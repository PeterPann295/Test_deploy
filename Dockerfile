# Stage 1: Build the application
FROM ubuntu:latest AS build
RUN apt-get update && \
    apt-get install -y openjdk-21-jdk maven

WORKDIR /app
COPY . .

# Build the Spring Boot application
RUN chmod +x mvnw

# Build the Spring Boot application
RUN ./mvnw clean package -DskipTests

# Stage 2: Run the application
FROM openjdk:21-jdk-slim
WORKDIR /app

# Copy the built JAR file from the previous stage
COPY --from=build /app/target/*.jar app.jar

# Expose port (adjust the port to your app’s configuration)
EXPOSE 8080

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]

