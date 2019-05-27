FROM node:lts-alpine


# make the 'app' folder the current working directory
ADD package*.json /tmp/

RUN cd /tmp && yarn install

RUN mkdir -p /usr/src/app && cp -a /tmp/node_modules /usr/src/app


WORKDIR /usr/src/app

ADD . /usr/src/app

RUN npm run build

RUN rm -rf ./build
RUN rm -rf ./src

ENV PORT=80

EXPOSE 80

# RUN 
CMD ["npm", "start"]