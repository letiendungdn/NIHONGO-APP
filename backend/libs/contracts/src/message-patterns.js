"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.PROGRESS_PATTERNS = exports.EXAM_EVENTS = exports.EXAM_PATTERNS = exports.CONTENT_PATTERNS = void 0;
exports.CONTENT_PATTERNS = {
    GET_LESSONS: 'content.lessons.findAll',
    GET_LESSON: 'content.lessons.findOne',
    CREATE_LESSON: 'content.lessons.create',
    DELETE_LESSON: 'content.lessons.delete',
    UPDATE_LESSON: 'content.lessons.update',
    GET_VOCABULARIES: 'content.vocabularies.findAll',
    GET_VOCABULARY: 'content.vocabularies.findOne',
    CREATE_VOCABULARY: 'content.vocabularies.create',
    UPDATE_VOCABULARY: 'content.vocabularies.update',
    DELETE_VOCABULARY: 'content.vocabularies.delete',
    GET_GRAMMARS: 'content.grammars.findAll',
    GET_GRAMMAR: 'content.grammars.findOne',
    CREATE_GRAMMAR: 'content.grammars.create',
    UPDATE_GRAMMAR: 'content.grammars.update',
    DELETE_GRAMMAR: 'content.grammars.delete',
    GET_EXERCISES: 'content.exercises.findAll',
    GET_EXERCISE: 'content.exercises.findOne',
    CREATE_EXERCISE: 'content.exercises.create',
    UPDATE_EXERCISE: 'content.exercises.update',
    DELETE_EXERCISE: 'content.exercises.delete',
    GET_KANJI_LESSONS: 'content.kanji-lessons.findAll',
    GET_KANJI_ENTRIES: 'content.kanji-entries.findAll',
    GET_KANJI_ENTRY: 'content.kanji-entries.findOne',
    GET_LISTENING_PLAYLIST: 'content.listening.playlist',
    IMPORT_VOCAB: 'content.import.vocab',
};
exports.EXAM_PATTERNS = {
    LIST_TEMPLATES: 'exam.templates.list',
    START_EXAM: 'exam.start',
    SUBMIT_EXAM: 'exam.submit',
    GET_HISTORY: 'exam.history.get',
};
exports.EXAM_EVENTS = {
    EXAM_SUBMITTED: 'exam.submitted',
};
exports.PROGRESS_PATTERNS = {
    SYNC_REVIEW: 'progress.review.sync',
    GET_REVIEW_BANK: 'progress.review.get',
    LOG_LISTENING: 'progress.listening.log',
    GET_LISTENING_LOGS: 'progress.listening.get',
};
//# sourceMappingURL=message-patterns.js.map