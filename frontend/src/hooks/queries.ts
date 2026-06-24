import { useQuery } from '@tanstack/react-query';
import {
  fetchAdminStats,
  fetchAuthMe,
  fetchExercises,
  fetchGrammars,
  fetchKanjiEntries,
  fetchKanjiLessons,
  fetchLessons,
  fetchListeningPlaylist,
  fetchMockExamTemplates,
  fetchVocabularies,
} from '../api';
import { getStoredToken } from '../lib/api-client';

export const queryKeys = {
  lessons: ['lessons'] as const,
  vocabularies: (lesson: number) => ['vocabularies', lesson, 'vi'] as const,
  grammars: (lesson: number) => ['grammars', lesson] as const,
  exercises: (lesson: number) => ['exercises', lesson] as const,
  kanjiLessons: ['kanji-lessons'] as const,
  kanjiEntries: (lesson: number) => ['kanji', lesson] as const,
  listeningPlaylist: (from: number, to: number) => ['listening-playlist', from, to] as const,
  mockExamTemplates: ['mock-exam-templates'] as const,
  authMe: ['auth', 'me'] as const,
  adminStats: ['admin', 'stats'] as const,
};

const STALE_5M = 5 * 60 * 1000;

export function useLessonsQuery() {
  return useQuery({
    queryKey: queryKeys.lessons,
    queryFn: fetchLessons,
    staleTime: STALE_5M,
  });
}

export function useVocabulariesQuery(lessonNumber: number) {
  return useQuery({
    queryKey: queryKeys.vocabularies(lessonNumber),
    queryFn: () => fetchVocabularies(lessonNumber),
    enabled: lessonNumber > 0,
    staleTime: STALE_5M,
  });
}

export function useGrammarsQuery(lessonNumber: number) {
  return useQuery({
    queryKey: queryKeys.grammars(lessonNumber),
    queryFn: () => fetchGrammars(lessonNumber),
    enabled: lessonNumber > 0,
    staleTime: STALE_5M,
  });
}

export function useExercisesQuery(lessonNumber: number) {
  return useQuery({
    queryKey: queryKeys.exercises(lessonNumber),
    queryFn: () => fetchExercises(lessonNumber),
    enabled: lessonNumber > 0,
    staleTime: STALE_5M,
  });
}

export function useKanjiLessonsQuery() {
  return useQuery({
    queryKey: queryKeys.kanjiLessons,
    queryFn: fetchKanjiLessons,
    staleTime: STALE_5M,
  });
}

export function useKanjiEntriesQuery(lessonNumber: number) {
  return useQuery({
    queryKey: queryKeys.kanjiEntries(lessonNumber),
    queryFn: () => fetchKanjiEntries(lessonNumber),
    enabled: lessonNumber > 0,
    staleTime: STALE_5M,
  });
}

export function useListeningPlaylistQuery(lessonFrom: number, lessonTo: number) {
  return useQuery({
    queryKey: queryKeys.listeningPlaylist(lessonFrom, lessonTo),
    queryFn: () => fetchListeningPlaylist(lessonFrom, lessonTo),
    staleTime: STALE_5M,
  });
}

export function useMockExamTemplatesQuery() {
  return useQuery({
    queryKey: queryKeys.mockExamTemplates,
    queryFn: fetchMockExamTemplates,
    staleTime: STALE_5M,
  });
}

export function useAuthMeQuery(enabled = true) {
  const token = getStoredToken();
  return useQuery({
    queryKey: queryKeys.authMe,
    queryFn: () => fetchAuthMe(token!),
    enabled: enabled && !!token,
    retry: false,
    staleTime: 60_000,
  });
}

export function useAdminStatsQuery(enabled = true) {
  const token = getStoredToken();
  return useQuery({
    queryKey: queryKeys.adminStats,
    queryFn: () => fetchAdminStats(token!),
    enabled: enabled && !!token,
    staleTime: 30_000,
  });
}
