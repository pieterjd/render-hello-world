FROM azul/zulu-openjdk:17
MAINTAINER drouillon@hotmail.com
COPY target/*.jar hello-world.jar
ENTRYPOINT ["java", "-jar", "/hello-world.jar"]