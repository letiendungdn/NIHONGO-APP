import { Injectable } from '@nestjs/common';
import { PrismaService } from '@app/prisma';
import { LogListeningDto, SyncReviewDto } from '@app/contracts';

@Injectable()
export class ProgressService {
  constructor(private prisma: PrismaService) {}

  async syncReviewBank(userId: number, dto: SyncReviewDto) {
    await this.prisma.$transaction(async (tx) => {
      for (const item of dto.items) {
        await tx.reviewLog.upsert({
          where: {
            userId_kana_lessonNumber: {
              userId,
              kana: item.kana,
              lessonNumber: item.lessonNumber,
            },
          },
          create: {
            userId,
            kana: item.kana,
            kanji: item.kanji ?? null,
            meaning: item.meaning,
            lessonNumber: item.lessonNumber,
            wrongCount: item.wrongCount,
            reviewStreak: item.reviewStreak,
            mastered: item.mastered,
            lastReviewedAt: item.lastReviewedAt
              ? new Date(item.lastReviewedAt)
              : null,
          },
          update: {
            kanji: item.kanji ?? null,
            meaning: item.meaning,
            wrongCount: item.wrongCount,
            reviewStreak: item.reviewStreak,
            mastered: item.mastered,
            lastReviewedAt: item.lastReviewedAt
              ? new Date(item.lastReviewedAt)
              : null,
          },
        });
      }
    });

    return { synced: dto.items.length };
  }

  getReviewBank(userId: number) {
    return this.prisma.reviewLog.findMany({
      where: { userId },
      orderBy: [{ mastered: 'asc' }, { wrongCount: 'desc' }],
    });
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
