FROM maven:3.9.16-eclipse-temurin-26 AS build
WORKDIR /app
COPY . .
RUN mvn clean install -DskipTests

FROM azul/zulu-openjdk:26-latest

WORKDIR /app

COPY --from=build /app/target/*.jar  /app/bff-agendador-tarefas.jar

EXPOSE 8083

CMD ["java", "-jar", "/app/bff-agendador-tarefas.jar"]