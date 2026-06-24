import { Controller, Logger } from '@nestjs/common';
import { EventPattern, MessagePattern, Payload } from '@nestjs/microservices';
import {
  EXAM_EVENTS,
  EXAM_PATTERNS,
  LogListeningDto,
  PROGRESS_PATTERNS,
  SyncReviewDto,
} from '@app/contracts';
import { MockExamsService } from './modules/mock-exams/mock-exams.service';
import { ProgressService } from './modules/progress/progress.service';

@Controller()
export class ExamMsController {
  private readonly logger = new Logger(ExamMsController.name);

  constructor(
    private readonly mockExamsService: MockExamsService,
    private readonly progressService: ProgressService,
  ) {}

  @MessagePattern(EXAM_PATTERNS.LIST_TEMPLATES)
  listTemplates() {
    return this.mockExamsService.listTemplates();
  }

  @MessagePattern(EXAM_PATTERNS.START_EXAM)
  startExam(@Payload() data: { level: 'n5' | 'n4' }) {
    return this.mockExamsService.start(data.level);
  }

  @MessagePattern(EXAM_PATTERNS.SUBMIT_EXAM)
  submitExam(
    @Payload()
    data: {
      examId: string;
      answers: Record<string, string>;
      userId?: number;
    },
  ) {
    return this.mockExamsService.submit(
      data.examId,
      data.answers,
      data.userId,
    );
  }

  @MessagePattern(EXAM_PATTERNS.GET_HISTORY)
  getHistory(@Payload() data: { userId: number }) {
    return this.mockExamsService.getHistory(data.userId);
  }

  @MessagePattern(PROGRESS_PATTERNS.SYNC_REVIEW)
  syncReview(@Payload() data: { userId: number; dto: SyncReviewDto }) {
    return this.progressService.syncReviewBank(data.userId, data.dto);
  }

  @MessagePattern(PROGRESS_PATTERNS.GET_REVIEW_BANK)
  getReviewBank(@Payload() data: { userId: number }) {
    return this.progressService.getReviewBank(data.userId);
  }

  @MessagePattern(PROGRESS_PATTERNS.LOG_LISTENING)
  logListening(@Payload() data: { userId: number; dto: LogListeningDto }) {
    return this.progressService.logListening(data.userId, data.dto);
  }

  @MessagePattern(PROGRESS_PATTERNS.GET_LISTENING_LOGS)
  getListeningLogs(@Payload() data: { userId: number }) {
    return this.progressService.getListeningHistory(data.userId);
  }

  @EventPattern(EXAM_EVENTS.EXAM_SUBMITTED)
  onExamSubmitted(
    @Payload()
    data: {
      examId: string;
      userId?: number;
      level: string;
      percent: number;
      passed: boolean;
    },
  ) {
    this.logger.log(
      `Exam submitted: examId=${data.examId} userId=${data.userId ?? 'guest'} level=${data.level} percent=${data.percent}% passed=${data.passed}`,
    );
  }
}
