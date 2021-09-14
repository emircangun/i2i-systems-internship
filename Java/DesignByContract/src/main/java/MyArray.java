import com.google.java.contract.*;

import java.util.ArrayList;
import java.util.List;

@Invariant("arr != null && size > 0 && max > 0")
public class MyArray {

    private List<Integer> arr;
    private int size;
    private final int max;

    @Requires("arr != null && max > 0")
    public MyArray(int[] arr, int max)
    {
        this.arr = new ArrayList<>();
        for (int num : arr) {
            this.arr.add(num);
        }
        this.size = arr.length;
        this.max = max;
    }

    @Requires("data != null")
    @Ensures("arr.get(arr.size() - 1) == data")
    @ThrowEnsures({ "IllegalArgumentException", "size == old (size)" })
    public void AddElement(Integer data)
    {
        arr.add(data);
        size++;
    }

    public static void main(String[] args)
    {
        int[] arr = {2, 3, 4};
        MyArray myArr = new MyArray(arr, 5);
        myArr.AddElement(5);
//        Integer nullInt = null;
//        myArr.AddElement(nullInt);
//        myArr.AddElement(10);
        myArr.AddElement(15);
    }

}
