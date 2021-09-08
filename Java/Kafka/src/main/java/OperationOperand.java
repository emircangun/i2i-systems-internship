import com.fasterxml.jackson.annotation.JsonProperty;

public class OperationOperand {
    @JsonProperty("operand")
    public int operand;

    @JsonProperty("operation")
    public String operation;

    public OperationOperand() {}

    public OperationOperand(int operand, String operation)
    {
        this.operand = operand;
        this.operation = operation;
    }

    public int getOperand()
    {
        return operand;
    }

    public String getOperation()
    {
        return operation;
    }

    public void setOperand(int operand) { this.operand = operand; }
    public void setOperation(String operation) { this.operation = operation; }

    @Override
    public String toString()
    {
        return "OperationOperand(" + operand + ", " + operation + ")";
    }

}
