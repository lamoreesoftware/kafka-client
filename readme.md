## Usage

The entrypoint is Bash and the working directory set within the Apache Kafka distribution.

To create a new topic and connect as producer:

```shell
docker run --rm -it lamoreesoftware/kafka-client:3.8.0
...
brokers="kafka1.dev.internal:9092,kafka2.dev.internal:9092,kafka3.dev.internal:9092"
topic="testing"

./bin/kafka-topics.sh --create --bootstrap-server "$brokers" --replication-factor 3 --partitions 1 --topic "$topic"
./bin/kafka-console-producer.sh --broker-list "$brokers" --producer.config config/producer.properties --topic "$topic"
```

To connect as consumer:

```shell
docker run --rm -it lamoreesoftware/kafka-client:3.8.0
...
brokers="kafka1.dev.internal:9092,kafka2.dev.internal:9092,kafka3.dev.internal:9092"
topic="testing"

./bin/kafka-console-consumer.sh --bootstrap-server "$brokers" --consumer.config config/consumer.properties --topic "$topic"
```

If everything is working properly, the producer should be able to send messages that are stored in the cluster and appear (nearly) immediately at the consumer.
