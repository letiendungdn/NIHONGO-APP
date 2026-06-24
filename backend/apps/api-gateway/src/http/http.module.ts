import { Module } from '@nestjs/common';
import { LessonsController } from './lessons.controller';
import { VocabulariesController } from './vocabularies.controller';
import { GrammarsController } from './grammars.controller';
import { ExercisesController } from './exercises.controller';
import { KanjiController } from './kanji.controller';
import { ListeningController } from './listening.controller';
import { MockExamsController } from './mock-exams.controller';
import { ProgressController } from './progress.controller';
import { ImportController } from './import.controller';

@Module({
  controllers: [
    LessonsController,
    VocabulariesController,
    GrammarsController,
    ExercisesController,
    KanjiController,
    ListeningController,
    MockExamsController,
    ProgressController,
    ImportController,
  ],
})
export class HttpModule {}
