FROM maven:3.9.16-eclipse-temurin-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean install -DskipTests

FROM azul/zulu-openjdk:17

WORKDIR /app

COPY --from=build /app/target/*.jar  /app/bff-agendador-tarefas.jar

EXPOSE 8083

CMD ["java", "-jar", "/app/bff-agendador-tarefas.jar"]