FROM eclipse-temurin:17-jre
WORKDIR /app
COPY ./target/spring-petclinic-3.5.0-SNAPSHOT.jar .

COPY ./jmx/jmx_prometheus_javaagent-1.4.0.jar /opt/jmx/jmx_prometheus_javaagent-1.4.0.jar
COPY ./jmx/config.yml /opt/jmx/config.yml

EXPOSE 8080 9404
CMD java \
    -javaagent:/opt/jmx/jmx_prometheus_javaagent-1.4.0.jar=9404:/opt/jmx/config.yml \
    -jar spring-petclinic-3.5.0-SNAPSHOT.jar > /var/log/app.log 2>&1