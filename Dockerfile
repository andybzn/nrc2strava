FROM node:12-alpine3.9 AS build
COPY ./ /app
RUN npm ci

FROM node:12-alpine3.9 AS release
WORKDIR /app
COPY --from=build /app /app

CMD npm run sync
