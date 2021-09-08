import org.apache.kafka.clients.producer.KafkaProducer;
import org.apache.kafka.clients.producer.Producer;
import org.apache.kafka.clients.producer.ProducerConfig;
import org.apache.kafka.clients.producer.ProducerRecord;
import org.apache.kafka.common.serialization.StringSerializer;

import com.fasterxml.jackson.databind.JsonSerializer;

import java.util.Properties;

public class PublisherApp {

    public static void main(String[] args) {
        //Creating Properties
        Properties properties = new Properties();
        properties.put(ProducerConfig.BOOTSTRAP_SERVERS_CONFIG, "localhost:9092");
        properties.put(ProducerConfig.KEY_SERIALIZER_CLASS_CONFIG, StringSerializer.class);
        properties.put(ProducerConfig.VALUE_SERIALIZER_CLASS_CONFIG, "OperationOperandSerializer");

        //Creating producers
        Producer<String, OperationOperand> producer = new KafkaProducer<>(properties);

        //prepare the record
        OperationOperand recordValue1 = new OperationOperand(13, "fibPri");
        OperationOperand recordValue2 = new OperationOperand(15, "prime");
        OperationOperand recordValue3 = new OperationOperand(18, "prime");
        OperationOperand recordValue4 = new OperationOperand(1, "fib");

        ProducerRecord<String, OperationOperand> record1 = new ProducerRecord<>("Topic-OP", "FIRST_KEY", recordValue1);
        ProducerRecord<String, OperationOperand> record2 = new ProducerRecord<>("Topic-OP", "FIRST_KEY", recordValue2);
        ProducerRecord<String, OperationOperand> record3 = new ProducerRecord<>("Topic-OP", "FIRST_KEY", recordValue3);
        ProducerRecord<String, OperationOperand> record4 = new ProducerRecord<>("Topic-OP", "FIRST_KEY", recordValue4);


        //Sending message to Kafka Broker
        producer.send(record1);
        producer.send(record2);
        producer.send(record3);
        producer.send(record4);

        System.out.println("Message sent!");

        producer.flush();
    }

}
