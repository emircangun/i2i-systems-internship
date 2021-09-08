import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.kafka.common.serialization.Serializer;
import org.apache.kafka.common.errors.SerializationException;
import java.util.Map;

public class OperationOperandSerializer implements Serializer<OperationOperand> {

    @Override
    public void configure(Map<String, ?> map, boolean b) {

    }

    @Override
    public byte[] serialize(String topic, OperationOperand object)
    {
        byte[] retVal = null;
        ObjectMapper objectMapper = new ObjectMapper();
        try {
            retVal = objectMapper.writeValueAsString(object).getBytes();
        } catch (Exception e) {
            throw new SerializationException("Error when serializing Data to byte[]");
        }
        return retVal;
    }

    @Override
    public void close() {

    }

}
