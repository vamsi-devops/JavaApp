FROM tomcat
RUN apt-get update
RUN apt-get install -y maven
COPY pom.xml /usr/local/service/pom.xml
COPY src /usr/local/service/src
WORKDIR /usr/local/service
RUN mvn package
RUN rm -rf /usr/local/tomcat/webapps/*
COPY target/**.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 9090
CMD ["catalina.sh", "run"]
