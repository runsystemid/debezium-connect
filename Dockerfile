FROM debezium/connect:1.9

# Set versions and directories
ENV POSTGRES_VERSION=42.7.7
ENV MYSQL_VERSION=8.0.30
ENV KAFKA_JDBC_VERSION=5.3.2
ENV KAFKA_CONNECT_JDBC_DIR=${KAFKA_CONNECT_PLUGINS_DIR}/kafka-connect-jdbc

# Deploy JDBC Driver
RUN cd /kafka/libs && curl -sO https://jdbc.postgresql.org/download/postgresql-${POSTGRES_VERSION}.jar
RUN cd /kafka/libs && curl -sO https://repo1.maven.org/maven2/mysql/mysql-connector-java/${MYSQL_VERSION}/mysql-connector-java-${MYSQL_VERSION}.jar

# Deploy Kafka Connect JDBC
RUN mkdir -p ${KAFKA_CONNECT_JDBC_DIR} && cd ${KAFKA_CONNECT_JDBC_DIR} &&\
	curl -sO https://packages.confluent.io/maven/io/confluent/kafka-connect-jdbc/${KAFKA_JDBC_VERSION}/kafka-connect-jdbc-${KAFKA_JDBC_VERSION}.jar
