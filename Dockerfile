FROM eclipse-temurin:21-jdk-noble AS base
WORKDIR /java/app/base

RUN apt-get update 
RUN apt-get install -y build-essential
RUN apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false
RUN rm -rf /var/lib/apt/lists/*

COPY . .
COPY build.gradle .
COPY gradlew .
COPY settings.gradle .
#TODO: obtener dependencias
RUN gradlew dependencies


FROM eclipse-temurin:21-jdk-noble AS builder
WORKDIR /java/app/builder

COPY --from=base /java/app/base /java/app/builder
RUN gradlew clean build -x test --no-daemon



FROM eclipse-temurin:21-jre-alpine
ENV SPRING_OUTPUT_ANSI_ENABLED=ALWAYS
ENV JAVA_OPTS=""


RUN adduser -D -s /bin/sh app

WORKDIR /home/app

USER app

EXPOSE 8080

ADD build/libs/azure-app-0.0.1-SNAPSHOT.jar app.jar
 
ENTRYPOINT [ "sh", "-c", "java -Djava.security.egd=file:/dev/./urandom -jar app.jar ${JAVA_OPTS} {0} {@}" ]
