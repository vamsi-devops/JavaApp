  
FROM tomcat:8

#FROM openjdk:8-jdk
MAINTAINER venkatesh singu (myemail@gmail.com)
RUN apt-get update
RUN apt-get install -y maven
COPY pom.xml /usr/local/service/pom.xml
COPY src /usr/local/service/src
WORKDIR /usr/local/service
RUN mvn clean package
EXPOSE 8080
# Take the war and copy to webapps of tomcat
COPY /usr/local/service/target/DemoPipelineJava-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/DemoPipelineJava-0.0.1-SNAPSHOT.war
#ENTRYPOINT ["java","-jar","target/DemoPipelineJava-0.0.1-SNAPSHOT.war"]
