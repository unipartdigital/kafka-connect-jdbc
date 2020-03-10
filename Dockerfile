FROM confluentinc/cp-kafka-connect:5.4.1

ARG JAR_VERSION

RUN rm /usr/share/java/kafka-connect-jdbc/kafka-connect-jdbc-5.4.1.jar

COPY target/kafka-connect-jdbc-$JAR_VERSION.jar /usr/share/java/kafka-connect-jdbc/