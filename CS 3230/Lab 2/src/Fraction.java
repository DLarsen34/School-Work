public class Fraction
{
	private int numerator;
	private int denominator;
	
	public Fraction(int numerator, int denominator)
	{
		int divisor = gcd(numerator, denominator);
		this.numerator = numerator / divisor;
		this.denominator = denominator / divisor;
	}
	
	public Fraction(int numerator)
	{
		this.numerator = numerator;
		this.denominator = 1;
	}
	
	public Fraction add(Fraction right)
	{
		int d = this.denominator * right.denominator;
		int n = (this.numerator * right.denominator) + (this.denominator * right.numerator);
		return new Fraction(n,d);
	}
	
	public Fraction sub(Fraction right)
	{
		int d = this.denominator * right.denominator;
		int n = (this.numerator * right.denominator) - (this.denominator * right.numerator);
		return new Fraction(n,d);
	}
	
	public Fraction mult(Fraction right)
	{
		return new Fraction(this.numerator * right.numerator, this.denominator * right.denominator);
	}
	
	public Fraction div(Fraction right)
	{
		return new Fraction(this.numerator * right.denominator, this.denominator * right.numerator);
	}
	
	public String toString()
	{
		return this.numerator + "/" + this.denominator;
	}
	
	public boolean equals(Object other)
	{
		if(this==other)
			return true;
		if(other==null)
			return false;
		if(getClass() != other.getClass())
			return false;
		Fraction otherFraction = (Fraction) other;
		return this.numerator == otherFraction.numerator && this.denominator == otherFraction.denominator;
	}
	
	private int gcd(int u, int v)
	{
		u = (u < 0) ? -u : u;		// make u non-negative
		v = (v < 0) ? -v : v;		// make v non-negative

		while (u > 0)
		{
			if (u < v)
			{
				int t = u;	// swap u and v
				u = v;
				v = t;
			}

			u -= v;
		}

		return v; // the GCD of u and v
	}
}
