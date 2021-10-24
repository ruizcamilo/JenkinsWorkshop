FROM openjdk:8u212-jre-alpine

ENV JAVA_HOME=/usr/lib/jvm/java-1.8-openjdk

ARG MOTD
ARG ONLINE_MODE

COPY . .

WORKDIR /server

RUN sed "s/motd=.*/motd=$MOTD/g" server.properties && \
    sed "s/online_mode=.*/online_mode=$ONLINE_MODE/g" server.properties

EXPOSE 25565

CMD ["java", "-jar", "server.jar", "nogui"]