import { apiRequest } from '../lib/api-client';
import type {
  AdminStats,
  AuthUser,
  Exercise,
  Grammar,
  KanjiEntry,
  KanjiLesson,
  Lesson,
  ListeningPlaylist,
  LoginResponse,
  MockExamTemplate,
  PaginatedResponse,
  Vocabulary,
} from '../types/api';

function unwrapList<T>(res: PaginatedResponse<T> | T[] | null | undefined): T[] {
  if (Array.isArray(res)) return res;
  if (res && Array.isArray(res.data)) return res.data;
  return [];
}

export function fetchLessons() {
  return apiRequest<Lesson[]>('/lessons');
}

export function fetchVocabularies(lessonNumber: number, page = 1, limit = 200) {
  return apiRequest<PaginatedResponse<Vocabulary> | Vocabulary[]>(
    `/vocabularies?lessonNumber=${lessonNumber}&page=${page}&limit=${limit}`,
  ).then(unwrapList);
}

export function fetchGrammars(lessonNumber: number, page = 1, limit = 200) {
  return apiRequest<PaginatedResponse<Grammar> | Grammar[]>(
    `/grammars?lessonNumber=${lessonNumber}&page=${page}&limit=${limit}`,
  ).then(unwrapList);
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
