# Microservices

Backend services cho Edu Platform.

| Service | Folder | Port | Mô tả |
|---------|--------|------|--------|
| **api-gateway** | `api-gateway/` | 3000 | HTTP entry, JWT auth, proxy NATS |
| **content-service** | `content-service/` | — | Lessons, vocab, grammar, kanji, reading… |
| **exam-service** | `exam-service/` | — | Mock exam, progress, SRS, analytics |
| **english-api** | `english-api/` | 3001 | BFF tiếng Anh (Next.js routes trong `apps/english-web`) |

## Shared

| Folder | Mô tả |
|--------|--------|
| `libs/common` | Guards, filters, config NestJS |
| `libs/contracts` | NATS message patterns + DTOs |
| `libs/prisma` | PrismaService, repositories |
| `prisma/` | Schema PostgreSQL `nihongo`, migrations, seeds |

## Chạy local

```bash
# Từ root monorepo
npm run dev:gateway
npm run dev:content
npm run dev:exam
```

## NATS flow

```
Client → api-gateway → NATS → content-service / exam-service → PostgreSQL
```

Message patterns: `libs/contracts/src/message-patterns.ts`
