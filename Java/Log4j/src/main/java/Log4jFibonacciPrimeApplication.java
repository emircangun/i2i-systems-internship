import org.apache.logging.log4j.Logger;
import org.apache.logging.log4j.LogManager;
import java.lang.Math;
import java.util.Scanner;

public class Log4jFibonacciPrimeApplication {

    public static void main(String[] args) {

        Logger logger = LogManager.getLogger(Log4jFibonacciPrimeApplication.class);

        Log4jFibonacciPrimeApplication app = new Log4jFibonacciPrimeApplication();

        Scanner in = new Scanner(System.in);
        System.out.print("Number: ");
        int number = in.nextInt();

        boolean isPrimeAndFibonacci = app.isFibonacci(number) && app.isPrime(number);
        System.out.println(isPrimeAndFibonacci);

        for (int i = 2; i < 50000; ++i)
        {
            boolean isPrimeAndFibonacci_debug = app.isFibonacci(i) && app.isPrime(i);
            System.out.println(isPrimeAndFibonacci_debug);
            logger.info("NUMBER " + i + " " + isPrimeAndFibonacci_debug);
        }
    }

    public boolean isPrime(int number)
    {
        if (number <= 1)
            return false;

        if (number == 2 || number == 3)
            return true;

        for (int i = 2; i <= number / 2; ++i) {
            if (number % i == 0) {
                return false;
            }
        }

        return true;
    }

//    public boolean isFibonacci_(int number)
//    {
//        if (number < 1)
//            return false;
//
//        int left = 1;
//        int right = 1;
//        while (right < number)
//        {
//            int tmp = left;
//            left = right;
//            right = tmp + right;
//        }
//
//        return (right == number);
//    }

    public boolean isFibonacci(int number)
    {
        if (number < 1)
            return false;

        return isPerfectSqr(5 * number * number + 4) ||
                isPerfectSqr(5 * number * number - 4);
    }

    private boolean isPerfectSqr(double number)
    {
        double s = Math.sqrt(number);
        return ((s - Math.floor(s)) == 0);
    }

} 
