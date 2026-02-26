FROM debezium/connect:2.5

# Set versions and directories
ENV POSTGRES_VERSION=42.7.7
ENV MYSQL_VERSION=8.0.30
ENV KAFKA_JDBC_VERSION=10.9.0
ENV TOJSONSTRING_VERSION=1.0.3
ENV KAFKA_CONNECT_JDBC_DIR=${KAFKA_CONNECT_PLUGINS_DIR}/kafka-connect-jdbc
ENV TOJSONSTRING_DIR=${KAFKA_CONNECT_PLUGINS_DIR}/kafka-connect-transform-tojsonstring

# Deploy JDBC Driver
RUN cd /kafka/libs && curl -sO https://jdbc.postgresql.org/download/postgresql-${POSTGRES_VERSION}.jar
RUN cd /kafka/libs && curl -sO https://repo1.maven.org/maven2/mysql/mysql-connector-java/${MYSQL_VERSION}/mysql-connector-java-${MYSQL_VERSION}.jar

# Deploy Kafka Connect JDBC
RUN mkdir -p ${KAFKA_CONNECT_JDBC_DIR} && cd ${KAFKA_CONNECT_JDBC_DIR} && \
    curl -sO https://packages.confluent.io/maven/io/confluent/kafka-connect-jdbc/${KAFKA_JDBC_VERSION}/kafka-connect-jdbc-${KAFKA_JDBC_VERSION}.jar

# Deploy ToJsonString SMT
RUN mkdir -p ${TOJSONSTRING_DIR} && cd ${TOJSONSTRING_DIR} && \
    curl -sLO https://github.com/christian-edelsbrunner/kafka-connect-transform-tojsonstring/releases/download/${TOJSONSTRING_VERSION}/kafka-connect-transform-tojsonstring-${TOJSONSTRING_VERSION}.jar
