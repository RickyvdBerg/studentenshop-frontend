
# stage 1

FROM node:alpine AS studentenshop
WORKDIR /app
COPY . .
RUN npm ci && npm run build

# stage 2

FROM nginx:alpine
COPY --from=studentenshop /app/dist/studentenshop /usr/share/nginx/html
EXPOSE 80