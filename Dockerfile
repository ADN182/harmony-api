FROM node:argon

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Install app dependencies
COPY package.json /usr/src/app
RUN rm -Rf node_modules
RUN npm install

COPY . /usr/src/app
COPY ./config/config.sample.json /usr/src/app/config/config.json

ENV CONFIG_DIR /config
ENV NODE_ENV production

EXPOSE 8282
CMD [ "npm", "start" ]
