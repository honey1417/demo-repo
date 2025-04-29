#set the base image with Java 17
FROM openjdk:17-jdk-slim

#set the working directory in the container 
WORKDIR /appdemo

# Copy the JAR file from your target folder to the container
COPY target/demo-app-1.0.0-SNAPSHOT.jar /appdemo/app.jar

# Expose the port the app will run on (default for Spring Boot is 8080)
EXPOSE 8080

#command to run the JAR file
ENTRYPOINT ["java", "-jar", "app.jar"]
