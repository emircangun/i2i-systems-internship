import com.hazelcast.core.Hazelcast;
import com.hazelcast.core.HazelcastInstance;
import com.hazelcast.core.IList;

import java.sql.*;

public class HazelcastMain {

    private static HazelcastInstance hz;

    public static void main(String[] args) {
        hz = Hazelcast.newHazelcastInstance();

        HazelcastMain app = new HazelcastMain();
        app.PutAndGetHazelcast();

    }

    public void PutAndGetHazelcast()
    {
        IList<Integer> list = hz.getList("list");

        long put_start_time = System.nanoTime();
        for (int i = 0; i < 20000; ++i)
        {
            list.add((int) ((Math.random() * (1000000 - 0)) + 0));
        }
        long put_end_time = System.nanoTime();
        double put_difference = (put_end_time - put_start_time) / 1e6;

        System.out.println("Putting 20000 elements: " + put_difference); // 678.3377, 694.9467

        long get_start_time = System.nanoTime();
        for (int i = 0; i < 20000; ++i)
        {
            list.get((int) (Math.random() * (20000)));
        }
        long get_end_time = System.nanoTime();
        double get_difference = (get_end_time - get_start_time) / 1e6;

        System.out.println("Getting 20000 elements: " + get_difference); // 541.4833

    }

}
