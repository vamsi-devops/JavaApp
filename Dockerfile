  
FROM tomcat:8

#FROM openjdk:8-jdk
MAINTAINER venkatesh singu (myemail@gmail.com)
RUN apt-get update
RUN apt-get install -y maven
RUN mvn clean package
# Take the war and copy to webapps of tomcat
COPY target/DemoPipelineJava-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/DemoPipelineJava-0.0.1-SNAPSHOT.war
#ENTRYPOINT ["java","-jar","target/DemoPipelineJava-0.0.1-SNAPSHOT.war"]
