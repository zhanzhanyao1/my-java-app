# Use a base image with Java 17 and Maven installed
FROM maven:3.8.5-openjdk-17

# Set the working directory in the container
WORKDIR /app

# Copy the entire project to the container
COPY . .

# Build the project with Maven
RUN mvn clean install

# Run the application
CMD ["java", "-jar", "target/my-java-app-1.0-SNAPSHOT.jar"]