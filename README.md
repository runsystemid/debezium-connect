# Debezium Connect with JDBC Support

This Docker image extends the official Debezium Connect image to add JDBC connectors for PostgreSQL and MySQL databases.

## Components

- Debezium Connect v1.9
- PostgreSQL JDBC Driver v42.7.7
- MySQL Connector/J v8.0.30
- Kafka Connect JDBC v5.3.2

## Usage

Build the Docker image:

```bash
docker build -t debezium-connect .
```

## Configuration

The image includes:

- PostgreSQL JDBC driver installed in `/kafka/libs`
- MySQL JDBC driver installed in `/kafka/libs`
- Kafka Connect JDBC connector installed in `$KAFKA_CONNECT_PLUGINS_DIR/kafka-connect-jdbc`

## Environment Variables

- `KAFKA_CONNECT_JDBC_DIR`: Location of the Kafka Connect JDBC connector plugins

## Base Image

This image extends [debezium/connect](https://hub.docker.com/r/debezium/connect) which provides the core Debezium functionality.

## License

This project uses components with various licenses:
- Debezium: Apache License 2.0
- PostgreSQL JDBC Driver: BSD-2-Clause
- MySQL Connector/J: GPL-2.0
- Kafka Connect JDBC: Confluent Community License