FROM node:lts-alpine3.9 as dev

RUN apk update && apk add --no-cache wget
RUN npm install -g typescript
RUN npm install --quiet -g @angular/cli 
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY package.json /usr/src/app/
COPY package-lock.json /usr/src/app/
RUN npm install
RUN npm audit fix
COPY . /usr/src/app/
EXPOSE 4200
CMD npm start
