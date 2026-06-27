# Edu Platform — Monorepo

Hệ sinh thái học ngôn ngữ: **micro frontends** + **microservices**.

## Cấu trúc

```
edu-platform/
├── apps/                    # Micro Frontends
│   ├── nihongo-web/         # Next.js — học tiếng Nhật (:5173)
│   └── english-web/         # Next.js — học tiếng Anh (:3001)
├── services/                # Micro Backends
│   ├── api-gateway/         # NestJS HTTP gateway (:3000)
│   ├── content-service/     # NestJS — lessons, vocab, grammar, kanji…
│   ├── exam-service/        # NestJS — mock exam, progress, SRS
│   ├── english-api/         # BFF tiếng Anh (API trong english-web)
│   ├── libs/                # Shared NestJS libs (@app/common, contracts, prisma)
│   └── prisma/              # Schema + migrations DB nihongo
├── packages/                # Shared packages
│   └── vocab-images/        # OpenMoji picture dictionary map
├── infra/
│   └── backups/             # SQL dumps
└── docker-compose.yml
```

## Kiến trúc

```
┌─────────────────┐     ┌─────────────────┐
│  nihongo-web    │     │  english-web    │
│  (MFE :5173)    │     │  (MFE :3001)    │
└────────┬────────┘     └────────┬────────┘
         │ /api/* proxy           │ Next.js API routes
         ▼                        ▼
┌─────────────────┐     ┌─────────────────┐
│  api-gateway    │     │  english-api    │
│  (:3000)        │     │  (BFF in MFE)   │
└────────┬────────┘     └────────┬────────┘
         │ NATS                  │
    ┌────┴────┐                   │
    ▼         ▼                   ▼
 content   exam              english_learning
 service   service              (PostgreSQL)
    │         │
    └────┬────┘
         ▼
    PostgreSQL (nihongo)
```

## Chạy dev

```bash
# Infrastructure
docker compose up -d postgres redis nats

# Backend (3 terminal)
npm run dev:gateway      # api-gateway :3000
npm run dev:content      # content-service
npm run dev:exam         # exam-service

# Frontends
npm run dev:nihongo-web  # :5173
npm run dev:english-web  # :3001
```

## Docker (full stack)

```bash
docker compose up -d
```

## Database backup

```bash
docker exec nihongo-postgres pg_dump -U nihongo nihongo > infra/backups/nihongo_$(date +%Y%m%d_%H%M%S).sql
```
