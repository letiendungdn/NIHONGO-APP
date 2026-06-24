import { Global, Module } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { ClientsModule, Transport } from '@nestjs/microservices';

@Global()
@Module({
  imports: [
    ClientsModule.registerAsync([
      {
        name: 'CONTENT_SERVICE',
        inject: [ConfigService],
        useFactory: (config: ConfigService) => ({
          transport: Transport.NATS,
          options: {
            servers: [
              config.get<string>('nats.url') ?? 'nats://localhost:4222',
            ],
          },
        }),
      },
      {
        name: 'EXAM_SERVICE',
        inject: [ConfigService],
        useFactory: (config: ConfigService) => ({
          transport: Transport.NATS,
          options: {
            servers: [
              config.get<string>('nats.url') ?? 'nats://localhost:4222',
            ],
          },
        }),
      },
    ]),
  ],
  exports: [ClientsModule],
})
export class MicroservicesModule {}
