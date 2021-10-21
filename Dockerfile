#
# Build stage
#
# openjdk:8-jdk-alpine
FROM maven:3-jdk-8-alpine AS build
COPY src /usr/src/app/src
COPY pom.xml /usr/src/app
COPY application.properties /usr/src/app
COPY log4j2-weather.yml /usr/src/app
RUN mvn -f /usr/src/app/pom.xml clean package -DskipTests=True


#
# Package stage
#
FROM openjdk:8-jdk-alpine

RUN apk add --update apk-cron && rm -rf /var/cache/apk/*
COPY cron-job /etc/cron.d/cron-job
COPY init.sh /usr/local/lib/init.sh
COPY env-var-check-task.sh /usr/local/lib/env-var-check-task.sh

RUN chmod 0755 /usr/local/lib/init.sh
RUN chmod 0755 /usr/local/lib/env-var-check-task.sh
RUN chmod 0644 /etc/cron.d/cron-job
RUN crontab /etc/cron.d/cron-job
RUN touch /var/log/cron.log

COPY --from=build /usr/src/app/target/demo-0.0.1-SNAPSHOT.jar /usr/local/lib/demo.jar
COPY --from=build /usr/src/app/application.properties /usr/local/lib
COPY --from=build /usr/src/app/log4j2-weather.yml /

ENV APP_VARIABLE=1

EXPOSE 8080
ENTRYPOINT ["/usr/local/lib/init.sh"]
# ENTRYPOINT ["java","-jar","-Dspring.config.location=/usr/local/lib/","/usr/local/lib/demo.jar"]
