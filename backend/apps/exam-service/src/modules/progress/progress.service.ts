import { Injectable } from '@nestjs/common';
import { PrismaService } from '@app/prisma';
import { SrsCardRepository } from '@app/prisma/srs-card.repository';
import { LogListeningDto, SyncReviewDto } from '@app/contracts';

function fallbackContentId(kana: string, lessonNumber: number): number {
  let hash = lessonNumber * 9973;
  for (let i = 0; i < kana.length; i += 1) {
    hash = (hash * 31 + kana.charCodeAt(i)) | 0;
  }
  return -Math.abs(hash || 1);
}

@Injectable()
export class ProgressService {
  constructor(
    private readonly prisma: PrismaService,
    private readonly srsCards: SrsCardRepository,
  ) {}

  async syncReviewBank(userId: number, dto: SyncReviewDto) {
    for (const item of dto.items) {
      const vocabulary = await this.prisma.vocabulary.findFirst({
        where: {
          kana: item.kana,
          lesson: { lessonNumber: item.lessonNumber },
        },
        select: { id: true },
        orderBy: { id: 'asc' },
      });

      const contentId =
        vocabulary?.id ?? fallbackContentId(item.kana, item.lessonNumber);
      const lastReviewedAt = item.lastReviewedAt
        ? new Date(item.lastReviewedAt)
        : null;

      await this.srsCards.upsertVocabularyReviewCard(
        userId,
        contentId,
        item,
        lastReviewedAt,
      );
    }

    return { synced: dto.items.length };
  }

  getReviewBank(userId: number) {
    return this.srsCards.findVocabularyReviewBank(userId);
  }

  async logListening(userId: number, dto: LogListeningDto) {
    const log = await this.prisma.listeningLog.upsert({
      where: { userId_date: { userId, date: dto.date } },
      create: { userId, date: dto.date, seconds: dto.seconds },
      update: { seconds: dto.seconds },
    });
    return log;
  }

  getListeningHistory(userId: number) {
    return this.prisma.listeningLog.findMany({
      where: { userId },
      orderBy: { date: 'desc' },
      take: 90,
    });
  }
}
