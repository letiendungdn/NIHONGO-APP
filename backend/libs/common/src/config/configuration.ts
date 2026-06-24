export default () => ({
  port: parseInt(process.env.PORT ?? '3000', 10),
  database: { url: process.env.DATABASE_URL },
  redis: { url: process.env.REDIS_URL ?? 'redis://localhost:6379' },
  nats: { url: process.env.NATS_URL ?? 'nats://localhost:4222' },
  cors: {
    origins: (process.env.ALLOWED_ORIGINS ?? 'http://localhost:5173').split(
      ',',
    ),
  },
  jwt: {
    secret: process.env.JWT_SECRET ?? 'change-me-in-production',
    expiresIn: process.env.JWT_EXPIRES_IN ?? '7d',
  },
});
