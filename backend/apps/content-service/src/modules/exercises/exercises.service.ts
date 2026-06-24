import { Injectable } from '@nestjs/common';
import { PrismaService } from '@app/prisma';
import {
  CreateExerciseDto,
  UpdateExerciseDto,
} from '@app/contracts';

@Injectable()
export class ExercisesService {
  constructor(private prisma: PrismaService) {}

  create(dto: CreateExerciseDto) {
    return this.prisma.exercise.create({
      data: {
        type: dto.type,
        question: dto.question,
        options: dto.options ?? null,
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
    return this.prisma.exercise.update({ where: { id }, data: dto });
  }

  remove(id: number) {
    return this.prisma.exercise.delete({ where: { id } });
  }
}
