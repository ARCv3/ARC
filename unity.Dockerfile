FROM node

RUN apt-get update && apt-get install -y npm
WORKDIR /app

COPY ./unity/package*.json .
RUN node --max-old-space-size=1000 $(which npm) i

COPY ./unity/ .
RUN node --max-old-space-size=1000 $(which npm) run build

ENTRYPOINT [ "npm", "run", "start" ]

