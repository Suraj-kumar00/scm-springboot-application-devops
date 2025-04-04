# ✅ Stage 1: Build JAR using Maven with OpenJDK 21
FROM maven:3.9-eclipse-temurin-21 AS builder
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# ✅ Stage 2: Run the app using OpenJDK
FROM eclipse-temurin:21-jdk
WORKDIR /app
COPY --from=builder /app/target/scm2.0-0.0.1-SNAPSHOT.jar /app/scm2.0-0.0.1-SNAPSHOT.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "scm2.0-0.0.1-SNAPSHOT.jar"]
