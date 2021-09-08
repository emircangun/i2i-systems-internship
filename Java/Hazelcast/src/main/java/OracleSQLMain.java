import java.sql.*;

public class OracleSQLMain {
    public static void main(String[] args) {
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:49161:XE","system", "oracle");
            Statement stmt = con.createStatement();

            long put_start_time = System.nanoTime();
            for (int i = 0; i < 100000; ++i)
            {
                stmt.executeQuery("INSERT INTO CMPTEST(ID, RAND_NUM) VALUES(" + i + "," + (int) (Math.random() * (20000)) + ")" );
            }
            long put_end_time = System.nanoTime();
            double put_difference = (put_end_time - put_start_time) / 1e9;

            System.out.println("Putting 20000 elements into Oracle: " + put_difference); // 678.3377, 694.9467

            long get_start_time = System.nanoTime();
            for (int i = 0; i < 100000; ++i)
            {
                stmt.executeQuery("SELECT RAND_NUM FROM CMPTEST WHERE id=" + (int) (Math.random() * (20000)) + "");
            }
            long get_end_time = System.nanoTime();
            double get_difference = (get_end_time - get_start_time) / 1e9;

            System.out.println("Getting 20000 elements from Oracle: " + get_difference); // 541.4833

        } catch (Exception e) {
            System.out.println(e);
        }
    }

}
