FROM node:14-alpine

EXPOSE 8081

USER root

RUN apk add bash gcompat dbus dbus-x11 libsecret gnome-keyring vim screen
RUN mkdir /var/workspace
COPY sncli.zip /var/workspace/sncli.zip
RUN chown -R  node:node /var/workspace

USER node
WORKDIR /var/workspace

RUN unzip sncli.zip
WORKDIR /var/workspace/ServiceNow CLI
RUN yes | ./snc-*-linux-x64-installer.run

USER root
RUN mv "/var/workspace/ServiceNow CLI/y/ServiceNow CLI/bin/snc" /usr/bin
RUN rm -r /var/workspace
USER node

WORKDIR /home/node
RUN mkdir .snc
RUN snc extension add --name ui-component

COPY docker-entrypoint.sh /docker-entrypoint.sh
COPY dbus-entrypoint.sh /dbus-entrypoint.sh

WORKDIR /home/node/data

ENTRYPOINT ["/docker-entrypoint.sh"]
