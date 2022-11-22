FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build
# /app/build inside the container
# will have all the stuff we need for production

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html