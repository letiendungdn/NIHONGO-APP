export declare class ReviewItemDto {
    kana: string;
    kanji?: string;
    meaning: string;
    lessonNumber: number;
    wrongCount: number;
    reviewStreak: number;
    mastered: boolean;
    lastReviewedAt?: string;
}
export declare class SyncReviewDto {
    items: ReviewItemDto[];
}
export declare class LogListeningDto {
    date: string;
    seconds: number;
}
