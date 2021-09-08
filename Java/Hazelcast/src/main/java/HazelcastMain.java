import com.hazelcast.core.Hazelcast;
import com.hazelcast.core.HazelcastInstance;
import com.hazelcast.core.IList;

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
        double put_difference = (put_end_time - put_start_time) / 1e9;

        System.out.println("Putting 20000 elements into Hazelcast: " + put_difference);

        long get_start_time = System.nanoTime();
        for (int i = 0; i < 20000; ++i)
        {
            list.get((int) (Math.random() * (19999)));
        }
        long get_end_time = System.nanoTime();
        double get_difference = (get_end_time - get_start_time) / 1e9;

        System.out.println("Getting 20000 elements from Hazelcast: " + get_difference);
    }

}
