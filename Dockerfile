FROM node:slim

ENV VERSION		1.10.2
ENV HOME        "/home"
ENV PORT        3000
ENV ADMIN_EMAIL "garden.yuen@gmail.com"
ENV DB_SERVER 	"mongo"
ENV DB_NAME 	"yapi"
ENV DB_PORT 	27017

WORKDIR ${HOME}/

COPY config.json ${HOME}
COPY wait-for-it.sh /
COPY sources.list /etc/apt/sources.list

RUN apt update && apt install iputils-ping -y
RUN npm config set registry http://registry.npm.taobao.org && \
	npm install -g npm@latest && \
	yarn global add yapi-cli && yarn cache clean
RUN sed -i 's/npm install/npm install --legacy-peer-deps/g' /usr/local/share/.config/yarn/global/node_modules/yapi-cli/src/commands/install.js

EXPOSE ${PORT}
COPY entrypoint.sh /bin
ENTRYPOINT ["entrypoint.sh"]