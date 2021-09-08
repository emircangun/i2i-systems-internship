import org.apache.kafka.clients.consumer.*;
import org.apache.kafka.common.serialization.StringDeserializer;

import java.time.Duration;
import java.util.Collections;
import java.util.Properties;

public class ConsumerApp {

    public static void main(String[] args) {
        Properties properties = new Properties();
        properties.put(ConsumerConfig.BOOTSTRAP_SERVERS_CONFIG, "localhost:9092");
        properties.put(ConsumerConfig.GROUP_ID_CONFIG, "consumer-group");
        properties.put(ConsumerConfig.KEY_DESERIALIZER_CLASS_CONFIG, StringDeserializer.class);
        properties.put(ConsumerConfig.VALUE_DESERIALIZER_CLASS_CONFIG, OperationOperandDeserializer.class);
        properties.put(ConsumerConfig.AUTO_OFFSET_RESET_CONFIG, "earliest");

        Consumer<String, OperationOperand> consumer = new KafkaConsumer<>(properties);
        consumer.subscribe(Collections.singleton("Topic-OP"));

        PrimeFibonacci pb = new PrimeFibonacci();

        while (true) {
            ConsumerRecords<String, OperationOperand> records = consumer.poll(Duration.ofMillis(1000));

            System.out.println("Consumer Completed." + records);

            for (ConsumerRecord<String, OperationOperand> record : records) {
                System.out.printf("offset = %d, key = %s, value = %s \n", record.offset(), record.key(), record.value());

                OperationOperand op = record.value();
                String choice = op.getOperation();
                int num = op.getOperand();
                if (choice.equals("fib"))
                    System.out.println(pb.isFibonacci(num));
                else if (choice.equals("prime"))
                    System.out.println(pb.isPrime(num));
                else if (choice.equals("fibPri"))
                    System.out.println(pb.isPrime(num) && pb.isFibonacci(num));


            }

            consumer.commitAsync();
        }
    }

}
