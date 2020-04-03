FROM confluentinc/cp-kafka-connect:5.4.1

ARG JAR_VERSION

# Replace upstream confluent kafka-connect-jdbc driver
RUN rm /usr/share/java/kafka-connect-jdbc/kafka-connect-jdbc-5.4.1.jar
COPY target/kafka-connect-jdbc-$JAR_VERSION.jar /usr/share/java/kafka-connect-jdbc/
# Replace jTDS driver with Microsoft JDBC driver
# https://docs.confluent.io/current/connect/kafka-connect-jdbc/index.html#microsoft-sql-server
RUN rm /usr/share/java/kafka-connect-jdbc/jtds-*.jar
ADD https://repo1.maven.org/maven2/com/microsoft/sqlserver/mssql-jdbc/8.2.2.jre8/mssql-jdbc-8.2.2.jre8.jar /usr/share/java/kafka-connect-jdbc/
