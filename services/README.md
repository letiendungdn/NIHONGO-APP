# Microservices

Backend services cho Edu Platform — giao tiếp qua **gRPC**.

| Service | Folder | Port | Mô tả |
|---------|--------|------|--------|
| **api-gateway** | `api-gateway/` | 3000 | HTTP entry, JWT auth, gRPC client |
| **content-service** | `content-service/` | 50051 | Lessons, vocab, grammar, kanji, reading… |
| **exam-service** | `exam-service/` | 50052 | Mock exam, progress, SRS, analytics |
| **english-api** | `english-api/` | 3001 | BFF tiếng Anh (Next.js routes trong `apps/english-web`) |

## Shared

| Folder | Mô tả |
|--------|--------|
| `libs/common` | Guards, filters, gRPC dispatch utils |
| `libs/contracts` | Message patterns, proto files, DTOs |
| `libs/prisma` | PrismaService, repositories |
| `prisma/` | Schema PostgreSQL `nihongo`, migrations, seeds |

## Chạy local

```bash
# Từ root monorepo
npm run dev:gateway      # HTTP :3000
npm run dev:content      # gRPC :50051
npm run dev:exam         # gRPC :50052
```

## gRPC flow

```
Client → api-gateway (HTTP)
              │ gRPC Dispatch(pattern, payload)
              ├──► content-service :50051
              └──► exam-service :50052
                        │
                   PostgreSQL + Redis
```

Proto definitions: `libs/contracts/proto/`

Environment:
- `CONTENT_GRPC_URL` — gateway → content (default `localhost:50051`)
- `EXAM_GRPC_URL` — gateway → exam (default `localhost:50052`)
- `CONTENT_GRPC_PORT` / `EXAM_GRPC_PORT` — listen ports for each service
