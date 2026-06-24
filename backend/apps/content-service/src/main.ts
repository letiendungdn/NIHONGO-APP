import { NestFactory } from '@nestjs/core';
import { MicroserviceOptions, Transport } from '@nestjs/microservices';
import { ContentModule } from './content.module';

async function bootstrap() {
  const app = await NestFactory.createMicroservice<MicroserviceOptions>(
    ContentModule,
    {
      transport: Transport.NATS,
      options: {
        servers: [process.env.NATS_URL ?? 'nats://localhost:4222'],
        queue: 'content-service',
      },
    },
  );
  await app.listen();
  console.log('Content service listening on NATS');
}

bootstrap();
