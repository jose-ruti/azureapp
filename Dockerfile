FROM eclipse-temurin:21-jre-alpine
ENV SPRING_OUTPUT_ANSI_ENABLED=ALWAYS
ENV JAVA_OPTS=""


RUN adduser -D -s /bin/sh app

WORKDIR /home/app

USER app

EXPOSE 8080

ADD build/libs/azure-app-0.0.1-SNAPSHOT.jar app.jar
 
ENTRYPOINT [ "sh", "-c", "java -Djava.security.egd=file:/dev/./urandom -jar app.jar ${JAVA_OPTS} {0} {@}" ]
