int gcd(int u, int v);

class fraction
{
	private:
		int numerator;
		int denominator;

	public:
		fraction(int n = 0, int d = 1) : numerator(n), denominator(d)
		{
			int	common = gcd(numerator, denominator);
			numerator /= common;
			denominator /= common;
		}
		fraction add(fraction f);
		fraction sub(fraction f);
		fraction mult(fraction f);
		fraction div(fraction f);
		void print();
		void read();
};