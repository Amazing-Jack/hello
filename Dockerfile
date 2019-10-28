FROM openjdk:8-jdk-alpine
VOLUME /tmp
ADD target/hello-0.0.1-SNAPSHOT.jar hello-app.jar
ENV JAVA_OPTS=""
ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /hello-app.jar" ]
