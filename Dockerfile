FROM node:13.8.0-alpine3.11

ENV LANG C.UTF-8
ARG ASSISTANT_RELAY_VERSION=3.2.0
ARG PORT=3000

RUN apk add --no-cache --update \
   python3 \
   unzip

RUN npm i pm2 -g

RUN wget https://github.com/greghesp/assistant-relay/releases/download/v${ASSISTANT_RELAY_VERSION}/release.zip

RUN unzip -d /assistant_relay release.zip

EXPOSE ${PORT}

WORKDIR /assistant-relay
#RUN npm i
#ENTRYPOINT ["npm", "run", "start"]
