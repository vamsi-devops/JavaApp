FROM openjdk:8-jdk
MAINTAINER venkatesh singu (myemail@gmail.com)
RUN apt-get update
RUN apt-get install -y maven
COPY pom.xml /usr/local/service/pom.xml
COPY src /usr/local/service/src
WORKDIR /usr/local/service
RUN mvn package
EXPOSE 8080
ENTRYPOINT ["java","-jar","target/DemoPipelineJava-0.0.1-SNAPSHOT.war"]
