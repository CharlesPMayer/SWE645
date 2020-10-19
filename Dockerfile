FROM tomcat:9.0-jdk15
COPY /var/lib/jenkins/workspace/new-pipeline/Mayer-HW1-P2.war /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["catalina.sh", "run"]
