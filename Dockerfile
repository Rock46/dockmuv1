From alpine/git
RUN rm -rf /usr/local/tomcat/webapps/*
WORKDIR /app
RUN git clone https://github.com/efsavage/hello-world-war.git (1)

FROM maven:3.5-jdk-8-alpine
WORKDIR /app
COPY --from=0 /app/spring-petclinic /app (2)
RUN mvn install (3)

FROM openjdk:8-jre-alpine
WORKDIR /app
COPY --from=1 /app/target/employee-producer-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war (4)
CMD ["catalina.sh","run"] (5)
