#
# Build stage
#
FROM maven:3.8.6-amazoncorretto-17 AS build
COPY src /home/app/src
COPY pom.xml /home/app
RUN mvn -f /home/app/pom.xml -DskipTests clean package

#
# Package stage
#
FROM openjdk:17
COPY --from=build /home/app/target/hello-world-0.0.1-SNAPSHOT.jar /app/hello-world.jar
EXPOSE 8443
EXPOSE 443
EXPOSE 8080
EXPOSE 80
ENTRYPOINT ["java","-jar","/app/hello-world.jar"]