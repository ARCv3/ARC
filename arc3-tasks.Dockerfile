FROM node:22
WORKDIR /app

COPY ./ARC3-TASKS/package*.json .
RUN node --max-old-space-size=1000 $(which npm) ci

COPY ./ARC3-TASKS .

ENTRYPOINT [ "tail", "-f", "/dev/null" ]