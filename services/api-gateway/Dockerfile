FROM node:22-alpine AS builder
WORKDIR /app
COPY package.json package-lock.json ./
COPY packages/vocab-images ./packages/vocab-images
COPY services ./services
RUN npm ci
WORKDIR /app/services
RUN npx prisma generate
RUN npm run build:all

FROM node:22-alpine AS runner
WORKDIR /app/services
ENV NODE_ENV=production
COPY --from=builder /app/services/dist ./dist
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/services/prisma ./prisma
COPY --from=builder /app/packages ./packages
USER node
CMD ["node", "dist/apps/api-gateway/api-gateway/src/main.js"]
