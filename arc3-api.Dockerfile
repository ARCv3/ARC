FROM node AS build-step

WORKDIR /app

COPY ./ARC3-DASH/package*.json .
RUN node --max-old-space-size=1000 $(which npm) ci

COPY ./ARC3-DASH/ .

RUN node --max-old-space-size=1000 $(which npm) run build

FROM node
WORKDIR /app

COPY ./ARC3-API/package*.json /app/
RUN node --max-old-space-size=1000 $(which npm) ci

COPY --from=build-step /app/build /app/build
COPY ./keys /keys
COPY ./ARC3-API/src /app/src
COPY ./ARC3-API/bin /app/bin
COPY ./ARC3-API/__tests__ ./__tests__

ENTRYPOINT [ "node", "--max-old-space-size=512", "bin/www" ]


