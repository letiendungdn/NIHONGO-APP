import { Injectable } from '@nestjs/common';
import { Prisma } from '@prisma/client';
import { PrismaService } from '@app/prisma';
import { CreateExerciseDto, UpdateExerciseDto } from '@app/contracts';

type PrismaExerciseType = 'MULTIPLE_CHOICE' | 'FILL_IN_BLANK' | 'LISTENING';

const PRISMA_EXERCISE_TYPE: Record<string, PrismaExerciseType> = {
  multiple_choice: 'MULTIPLE_CHOICE',
  fill_in_blank: 'FILL_IN_BLANK',
  listening: 'LISTENING',
  MULTIPLE_CHOICE: 'MULTIPLE_CHOICE',
  FILL_IN_BLANK: 'FILL_IN_BLANK',
  LISTENING: 'LISTENING',
};

function toPrismaExerciseType(type: string): PrismaExerciseType {
  const mapped = PRISMA_EXERCISE_TYPE[type];
  if (!mapped) {
    throw new Error(`Unknown exercise type: ${type}`);
  }
  return mapped;
}

@Injectable()
export class ExercisesService {
  constructor(private prisma: PrismaService) {}

  create(dto: CreateExerciseDto) {
    return this.prisma.exercise.create({
      data: {
        type: toPrismaExerciseType(dto.type),
        question: dto.question,
        options: dto.options ?? Prisma.JsonNull,
        answer: dto.answer,
        lessonId: dto.lessonId,
      },
    });
  }

  async findAll(lessonNumber?: number) {
    let lessonId: number | undefined;
    if (lessonNumber) {
      const lesson = await this.prisma.lesson.findUnique({
        where: { lessonNumber },
        select: { id: true },
      });
      if (!lesson) return [];
      lessonId = lesson.id;
    }
    return this.prisma.exercise.findMany({
      where: lessonId ? { lessonId } : undefined,
      orderBy: { id: 'asc' },
    });
  }

  findOne(id: number) {
    return this.prisma.exercise.findUnique({ where: { id } });
  }

  update(id: number, dto: UpdateExerciseDto) {
    const { type, options, ...rest } = dto;
    return this.prisma.exercise.update({
      where: { id },
      data: {
        ...rest,
        ...(type !== undefined && { type: toPrismaExerciseType(type) }),
        ...(options !== undefined && { options: options ?? Prisma.JsonNull }),
      },
    });
  }

  remove(id: number) {
    return this.prisma.exercise.delete({ where: { id } });
  }
}
