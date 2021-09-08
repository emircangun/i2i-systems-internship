public class PrimeFibonacci {

    void PrimeFibonacci() {}

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
