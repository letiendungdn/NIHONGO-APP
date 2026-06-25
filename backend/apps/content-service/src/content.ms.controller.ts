import { Controller } from '@nestjs/common';
import { MessagePattern, Payload } from '@nestjs/microservices';
import {
  CONTENT_PATTERNS,
  CreateExerciseDto,
  CreateGrammarDto,
  CreateLessonDto,
  CreateVocabularyDto,
  UpdateExerciseDto,
  UpdateGrammarDto,
  UpdateLessonDto,
  UpdateVocabularyDto,
} from '@app/contracts';
import { LessonsService } from './modules/lessons/lessons.service';
import { VocabulariesService } from './modules/vocabularies/vocabularies.service';
import { GrammarsService } from './modules/grammars/grammars.service';
import { ExercisesService } from './modules/exercises/exercises.service';
import { KanjiService } from './modules/kanji/kanji.service';
import { ListeningService } from './modules/listening/listening.service';
import { ImportService } from './modules/import/import.service';

@Controller()
export class ContentMsController {
  constructor(
    private readonly lessonsService: LessonsService,
    private readonly vocabulariesService: VocabulariesService,
    private readonly grammarsService: GrammarsService,
    private readonly exercisesService: ExercisesService,
    private readonly kanjiService: KanjiService,
    private readonly listeningService: ListeningService,
    private readonly importService: ImportService,
  ) {}

  @MessagePattern(CONTENT_PATTERNS.GET_LESSONS)
  getLessons() {
    return this.lessonsService.findAll();
  }

  @MessagePattern(CONTENT_PATTERNS.GET_LESSON)
  getLesson(@Payload() data: { lessonNumber: number }) {
    return this.lessonsService.findOne(data.lessonNumber);
  }

  @MessagePattern(CONTENT_PATTERNS.CREATE_LESSON)
  createLesson(@Payload() dto: CreateLessonDto) {
    return this.lessonsService.create(dto);
  }

  @MessagePattern(CONTENT_PATTERNS.UPDATE_LESSON)
  updateLesson(@Payload() data: { id: number; dto: UpdateLessonDto }) {
    return this.lessonsService.update(data.id, data.dto);
  }

  @MessagePattern(CONTENT_PATTERNS.DELETE_LESSON)
  deleteLesson(@Payload() data: { id: number }) {
    return this.lessonsService.remove(data.id);
  }

  @MessagePattern(CONTENT_PATTERNS.GET_VOCABULARIES)
  getVocabularies(
    @Payload()
    data: {
      lessonNumber?: number;
      page?: number;
      limit?: number;
    },
  ) {
    return this.vocabulariesService.findAll(
      data.lessonNumber,
      data.page,
      data.limit,
    );
  }

  @MessagePattern(CONTENT_PATTERNS.GET_VOCABULARY)
  getVocabulary(@Payload() data: { id: number }) {
    return this.vocabulariesService.findOne(data.id);
  }

  @MessagePattern(CONTENT_PATTERNS.CREATE_VOCABULARY)
  createVocabulary(@Payload() dto: CreateVocabularyDto) {
    return this.vocabulariesService.create(dto);
  }

  @MessagePattern(CONTENT_PATTERNS.UPDATE_VOCABULARY)
  updateVocabulary(@Payload() data: { id: number; dto: UpdateVocabularyDto }) {
    return this.vocabulariesService.update(data.id, data.dto);
  }

  @MessagePattern(CONTENT_PATTERNS.DELETE_VOCABULARY)
  deleteVocabulary(@Payload() data: { id: number }) {
    return this.vocabulariesService.remove(data.id);
  }

  @MessagePattern(CONTENT_PATTERNS.GET_GRAMMARS)
  getGrammars(
    @Payload()
    data: {
      lessonNumber?: number;
      page?: number;
      limit?: number;
    },
  ) {
    return this.grammarsService.findAll(
      data.lessonNumber,
      data.page,
      data.limit,
    );
  }

  @MessagePattern(CONTENT_PATTERNS.GET_GRAMMAR)
  getGrammar(@Payload() data: { id: number }) {
    return this.grammarsService.findOne(data.id);
  }

  @MessagePattern(CONTENT_PATTERNS.CREATE_GRAMMAR)
  createGrammar(@Payload() dto: CreateGrammarDto) {
    return this.grammarsService.create(dto);
  }

  @MessagePattern(CONTENT_PATTERNS.UPDATE_GRAMMAR)
  updateGrammar(@Payload() data: { id: number; dto: UpdateGrammarDto }) {
    return this.grammarsService.update(data.id, data.dto);
  }

  @MessagePattern(CONTENT_PATTERNS.DELETE_GRAMMAR)
  deleteGrammar(@Payload() data: { id: number }) {
    return this.grammarsService.remove(data.id);
  }

  @MessagePattern(CONTENT_PATTERNS.GET_EXERCISES)
  getExercises(@Payload() data: { lessonNumber?: number }) {
    return this.exercisesService.findAll(data.lessonNumber);
  }

  @MessagePattern(CONTENT_PATTERNS.GET_EXERCISE)
  getExercise(@Payload() data: { id: number }) {
    return this.exercisesService.findOne(data.id);
  }

  @MessagePattern(CONTENT_PATTERNS.CREATE_EXERCISE)
  createExercise(@Payload() dto: CreateExerciseDto) {
    return this.exercisesService.create(dto);
  }

  @MessagePattern(CONTENT_PATTERNS.UPDATE_EXERCISE)
  updateExercise(@Payload() data: { id: number; dto: UpdateExerciseDto }) {
    return this.exercisesService.update(data.id, data.dto);
  }

  @MessagePattern(CONTENT_PATTERNS.DELETE_EXERCISE)
  deleteExercise(@Payload() data: { id: number }) {
    return this.exercisesService.remove(data.id);
  }

  @MessagePattern(CONTENT_PATTERNS.GET_KANJI_LESSONS)
  getKanjiLessons() {
    return this.kanjiService.findAllLessons();
  }

  @MessagePattern(CONTENT_PATTERNS.GET_KANJI_ENTRIES)
  getKanjiEntries(@Payload() data: { lessonNumber?: number }) {
    return this.kanjiService.findEntries(data.lessonNumber);
  }

  @MessagePattern(CONTENT_PATTERNS.GET_KANJI_ENTRY)
  getKanjiEntry(@Payload() data: { id: number }) {
    return this.kanjiService.findOne(data.id);
  }

  @MessagePattern(CONTENT_PATTERNS.GET_LISTENING_PLAYLIST)
  getListeningPlaylist(
    @Payload() data: { lessonFrom: number; lessonTo: number; limit: number },
  ) {
    return this.listeningService.getPlaylist(
      data.lessonFrom,
      data.lessonTo,
      data.limit,
    );
  }

  @MessagePattern(CONTENT_PATTERNS.IMPORT_VOCAB)
  importVocab(@Payload() data: { lessonNumber: number; text: string }) {
    return this.importService.importVocabFromText(data.lessonNumber, data.text);
  }
}
