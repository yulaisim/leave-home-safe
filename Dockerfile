FROM node:latest AS builder
WORKDIR /app
COPY ./src ./src
COPY ./public ./public
COPY ./package.json ./package.json
COPY ./package-lock.json ./package-lock.json
RUN npm ci && npm run build

FROM nginx:mainline-alpine
COPY --from=builder /app/build /usr/share/nginx/html
EXPOSE 80