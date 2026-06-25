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

  async getAnalytics(userId: number) {
    const [studySessions, examResults, srsStats, listeningLogs] =
      await Promise.all([
        this.prisma.studySession.findMany({
          where: { userId },
          orderBy: { date: 'asc' },
          take: 365,
          select: { date: true, seconds: true, cardsReviewed: true },
        }),
        this.prisma.examResult.findMany({
          where: { userId },
          orderBy: { submittedAt: 'asc' },
          select: {
            submittedAt: true,
            percent: true,
            passed: true,
            level: true,
            title: true,
          },
        }),
        this.prisma.srsCard.aggregate({
          where: { userId },
          _count: { id: true },
          _sum: { correctCount: true, wrongCount: true },
        }),
        this.prisma.listeningLog.findMany({
          where: { userId },
          orderBy: { date: 'asc' },
          take: 365,
          select: { date: true, seconds: true },
        }),
      ]);

    const masteredCount = await this.prisma.srsCard.count({
      where: { userId, mastered: true },
    });

    const totalStudySeconds = studySessions.reduce((s, r) => s + r.seconds, 0);
    const totalListeningSeconds = listeningLogs.reduce(
      (s, r) => s + r.seconds,
      0,
    );

    return {
      overview: {
        totalStudySeconds,
        totalListeningSeconds,
        totalCardsReviewed:
          srsStats._sum.correctCount ?? 0 + (srsStats._sum.wrongCount ?? 0),
        masteredVocab: masteredCount,
        totalExams: examResults.length,
        passedExams: examResults.filter((e) => e.passed).length,
      },
      studySessions,
      examHistory: examResults,
      listeningHistory: listeningLogs,
    };
  }
}
