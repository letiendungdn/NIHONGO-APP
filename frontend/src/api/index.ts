import { apiRequest } from '../lib/api-client';
import type {
  AdminStats,
  AuthUser,
  Exercise,
  Grammar,
  JlptDaNangSchedule,
  KanjiEntry,
  KanjiLesson,
  Lesson,
  ListeningPlaylist,
  LoginResponse,
  MockExamTemplate,
  PaginatedResponse,
  Vocabulary,
} from '../types/api';
import type {
  DailyListeningPayload,
  JapaneseCountersPayload,
  JlptDaNangSchedulePayload,
  JlptRoadmapPayload,
  KanaChartsPayload,
  ReferenceMeta,
} from '../types/reference';

async function fetchPaginatedAll<T>(
  buildPath: (page: number, limit: number) => string,
  pageSize = 100,
): Promise<T[]> {
  const all: T[] = [];
  let page = 1;
  let total = Number.POSITIVE_INFINITY;

  while (all.length < total) {
    const res = await apiRequest<PaginatedResponse<T> | T[]>(
      buildPath(page, pageSize),
    );

    if (Array.isArray(res)) return res;

    const batch = res?.data ?? [];
    total = res?.total ?? batch.length;
    all.push(...batch);

    if (batch.length === 0 || all.length >= total) break;
    page += 1;
  }

  return all;
}

export function fetchLessons() {
  return apiRequest<Lesson[]>('/lessons');
}

export function fetchVocabularies(lessonNumber: number) {
  return fetchPaginatedAll<Vocabulary>((page, limit) =>
    `/vocabularies?lessonNumber=${lessonNumber}&page=${page}&limit=${limit}`,
  );
}

export function fetchGrammars(lessonNumber: number) {
  return fetchPaginatedAll<Grammar>((page, limit) =>
    `/grammars?lessonNumber=${lessonNumber}&page=${page}&limit=${limit}`,
  );
}

export function fetchExercises(lessonNumber: number) {
  return apiRequest<Exercise[]>(`/exercises?lessonNumber=${lessonNumber}`);
}

export function fetchKanjiLessons() {
  return apiRequest<KanjiLesson[]>('/kanji-lessons');
}

export function fetchKanjiEntries(lessonNumber: number) {
  return apiRequest<KanjiEntry[]>(`/kanji?lessonNumber=${lessonNumber}`);
}

export function fetchListeningPlaylist(lessonFrom = 1, lessonTo = 25, limit = 120) {
  return apiRequest<ListeningPlaylist>(
    `/listening/playlist?lessonFrom=${lessonFrom}&lessonTo=${lessonTo}&limit=${limit}`,
  );
}

export function fetchMockExamTemplates() {
  return apiRequest<MockExamTemplate[]>('/mock-exams');
}

export function fetchJlptDaNangSchedule() {
  return apiRequest<JlptDaNangSchedule>('/jlpt/da-nang/schedule');
}

export function fetchReferenceList() {
  return apiRequest<ReferenceMeta[]>('/reference');
}

export function fetchReference<T>(slug: string) {
  return apiRequest<T>(`/reference/${slug}`);
}

export function fetchKanaCharts() {
  return fetchReference<KanaChartsPayload>('kana-charts');
}

export function fetchJapaneseCounters() {
  return fetchReference<JapaneseCountersPayload>('japanese-counters');
}

export function fetchDailyListeningConfig() {
  return fetchReference<DailyListeningPayload>('daily-listening');
}

export function fetchJlptRoadmap() {
  return fetchReference<JlptRoadmapPayload>('jlpt-roadmap');
}

export function fetchJlptDaNangScheduleStatic() {
  return fetchReference<JlptDaNangSchedulePayload>('jlpt-danang-schedule');
}

export function startMockExam(level: string) {
  return apiRequest<Record<string, unknown>>(`/mock-exams/${level}/start`, { method: 'POST' });
}

export function submitMockExam(examId: string, answers: Record<string, string>) {
  return apiRequest<Record<string, unknown>>(`/mock-exams/${examId}/submit`, {
    method: 'POST',
    body: JSON.stringify({ answers }),
  });
}

export function loginAdmin(email: string, password: string) {
  return apiRequest<LoginResponse>('/auth/login', {
    method: 'POST',
    body: JSON.stringify({ email, password }),
  });
}

export function fetchAuthMe(token: string) {
  return apiRequest<AuthUser>('/auth/me', { token });
}

export function fetchAdminStats(token: string) {
  return apiRequest<AdminStats>('/admin/stats', { token });
}

export function adminImportVocab(token: string, lessonNumber: number, text: string) {
  return apiRequest<{ count: number; skipped: number }>('/admin/import/vocab', {
    method: 'POST',
    token,
    body: JSON.stringify({ lessonNumber, text }),
  });
}

export interface ReviewLogItem {
  kana: string;
  kanji?: string | null;
  meaning: string;
  lessonNumber: number;
  wrongCount: number;
  reviewStreak: number;
  mastered: boolean;
  lastReviewedAt?: string | null;
}

export function syncReviewProgress(token: string, items: ReviewLogItem[]) {
  return apiRequest<{ synced: number }>('/progress/review', {
    method: 'POST',
    token,
    body: JSON.stringify({ items }),
  });
}

export function fetchReviewProgress(token: string) {
  return apiRequest<ReviewLogItem[]>('/progress/review', { token });
}

export function logListeningProgress(token: string, date: string, seconds: number) {
  return apiRequest<unknown>('/progress/listening', {
    method: 'POST',
    token,
    body: JSON.stringify({ date, seconds }),
  });
}

export function fetchListeningProgress(token: string) {
  return apiRequest<Array<{ date: string; seconds: number }>>('/progress/listening', {
    token,
  });
}
