FROM maven:latest AS builder

RUN mkdir app

COPY . ./app

WORKDIR /app

RUN mvn clean install -Dmaven.test.skip=true -Dmaven.test.failure.ignore=true


FROM openjdk:8-alpine

COPY --from=builder app/target/spring-boot-maven-sample-1.0.0.jar ./spring-boot-maven-sample-1.0.0.jar

EXPOSE 8080

ENTRYPOINT [ "java", "-jar", "/spring-boot-maven-sample-1.0.0.jar" ]
