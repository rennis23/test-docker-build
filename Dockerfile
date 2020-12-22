FROM node:lts-alpine3.12

ENV NPM_CONFIG_LOGLEVEL info

WORKDIR /usr/src/app

RUN chown node:node /usr/src/app

USER node

COPY --chown=node:node . .

RUN ls -al \
    && pwd \
    && whoami \
    && npm ci --only=production

EXPOSE 8080

CMD [ "node", "src/index.js" ]