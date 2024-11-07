FROM docker.1581.top/node:18-alpine AS build
WORKDIR /app
COPY . .
RUN yarn install
RUN yarn build

FROM nginx:1.0.0
COPY --from=build /app/dist /var/www/html
EXPOSE 12580
CMD [ "nginx", "-g", "daemon off;" ]
