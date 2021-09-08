import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.kafka.common.serialization.Deserializer;
import org.apache.kafka.common.errors.SerializationException;

import java.nio.ByteBuffer;
import java.nio.charset.StandardCharsets;
import java.util.Map;

public class OperationOperandDeserializer implements Deserializer<OperationOperand> {

    private ObjectMapper objectMapper;

    @Override
    public void configure(Map<String, ?> configs, boolean isKey) {
        //Nothing to configure
    }

    @Override
    public OperationOperand deserialize(String topic, byte[] bytes)
    {
        if (bytes == null || bytes.length == 0) {
            return null;
        }

        try {
            ObjectMapper mapper = new ObjectMapper();
            String s = new String(bytes, StandardCharsets.UTF_8);
            OperationOperand op = mapper.readValue(s, OperationOperand.class);
            return op;
        } catch (Exception e) {
            throw new SerializationException(e);
        }
    }

}
