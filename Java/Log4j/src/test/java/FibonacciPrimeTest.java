import org.junit.Test;
import org.junit.jupiter.api.DisplayName;

import static org.junit.Assert.*;

public class FibonacciPrimeTest {

    private static final Log4jFibonacciPrimeApplication app = new Log4jFibonacciPrimeApplication();

    @Test
    @DisplayName("Testing numbers which are not primes")
    public void notPrimes()
    {
        assertFalse(app.isPrime(4));
        assertFalse(app.isPrime(0));
        assertFalse(app.isPrime(6));
        assertFalse(app.isPrime(-2));
        assertFalse(app.isPrime(8));
        assertFalse(app.isPrime(15));
    }

    @Test
    @DisplayName("Testing numbers which are primes")
    public void isPrimes()
    {
        assertTrue(app.isPrime(2));
        assertTrue(app.isPrime(3));
        assertTrue(app.isPrime(5));
        assertTrue(app.isPrime(7));
        assertTrue(app.isPrime(11));
        assertTrue(app.isPrime(13));
    }

    @Test
    @DisplayName("Testing numbers which are not in fibonacci series")
    public void notInFibonacci()
    {
        assertFalse(app.isFibonacci(0));
        assertFalse(app.isFibonacci(-1));
        assertFalse(app.isFibonacci(-5));
        assertFalse(app.isFibonacci(7));
        assertFalse(app.isFibonacci(4));
        assertFalse(app.isFibonacci(25));
        assertFalse(app.isFibonacci(24));
        assertFalse(app.isFibonacci(-13));
    }

    @Test
    @DisplayName("Testing numbers which are in fibonacci series")
    public void isInFibonacci()
    {
        assertTrue(app.isFibonacci(1));
        assertTrue(app.isFibonacci(3));
        assertTrue(app.isFibonacci(5));
        assertTrue(app.isFibonacci(8));
        assertTrue(app.isFibonacci(13));
        assertTrue(app.isFibonacci(21));
        assertTrue(app.isFibonacci(34));
    }
}
