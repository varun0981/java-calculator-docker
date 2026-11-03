
# Stage 1: Build the Java application
FROM maven:3.9.9-eclipse-temurin-17 AS build

WORKDIR /app

# Copy project files
COPY pom.xml .
COPY src ./src

# Build the JAR file
RUN mvn clean package -DskipTests

# Stage 2: Runtime image
FROM eclipse-temurin:17-jdk

WORKDIR /app

COPY --from=build /app/target/Lab_Ex_11-1.0.jar app.jar

# Start Java application
CMD ["java", "-jar", "app.jar"]
