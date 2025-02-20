# 1. Use official Maven image for building the application
FROM maven:3.9.6-eclipse-temurin-17 AS build

# 2. Set working directory inside container
WORKDIR /app

# 3. Copy all project files to container
COPY . .

# 4. Build the application using Maven
RUN mvn clean install -DskipTests

# 5. Use lightweight OpenJDK image for running the app
FROM openjdk:17-jdk-slim

# 6. Set working directory inside container
WORKDIR /app

# 7. Copy built JAR file from the previous stage
COPY --from=build /app/target/*.jar app.jar

# 8. Expose the application port (change if needed)
EXPOSE 8080

# 9. Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]
