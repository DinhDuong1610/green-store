FROM maven:3.8.5-openjdk-17 AS build
WORKDIR /app
COPY pom.xml .
RUN mvn dependency:go-offline
COPY src ./src
RUN mvn clean package -DskipTests

FROM openjdk:17.0.1-jdk-slim
WORKDIR /app
COPY --from=build /app/target/greenstore-0.0.1-SNAPSHOT.jar app.jar

RUN mkdir -p upload/images

EXPOSE 8080
ENTRYPOINT ["java","-jar","app.jar"]