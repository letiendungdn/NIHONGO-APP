FROM node:22-alpine AS builder
WORKDIR /app
COPY package*.json .npmrc ./
RUN npm ci
COPY . .
ENV API_URL=http://api-gateway:3000
RUN npm run build

FROM node:22-alpine AS runner
WORKDIR /app
ENV NODE_ENV=production
ENV PORT=5173
ENV API_URL=http://api-gateway:3000
COPY --from=builder /app/package*.json ./
COPY --from=builder /app/.next ./.next
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/public ./public
EXPOSE 5173
CMD ["npm", "start"]
