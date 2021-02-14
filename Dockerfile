FROM tomcat:8.0-alpine
LABEL maintainer=”raju0596@yah00.com”
ADD /var/lib/jenkins/workspace/New_home/gameoflife-web/target/gameoflife.war /usr/local/tomcat/webapps/
EXPOSE 8080/tcp
CMD [“catalina.sh”, “run”]