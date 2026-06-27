import { NestFactory } from '@nestjs/core';
import { MicroserviceOptions, Transport } from '@nestjs/microservices';
import { ExamModule } from './exam.module';
import { RpcHttpExceptionFilter } from './filters/rpc-http-exception.filter';

async function bootstrap() {
  const app = await NestFactory.createMicroservice<MicroserviceOptions>(
    ExamModule,
    {
      transport: Transport.NATS,
      options: {
        servers: [process.env.NATS_URL ?? 'nats://localhost:4222'],
        queue: 'exam-service',
      },
    },
  );
  app.useGlobalFilters(new RpcHttpExceptionFilter());
  await app.listen();
  console.log('Exam service listening on NATS');
}

void bootstrap();
