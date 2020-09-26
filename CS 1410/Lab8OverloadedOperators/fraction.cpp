#include <iostream>
#include <iomanip>
#include <cmath>
#include "fraction.h"
using namespace std;

fraction operator+(fraction f1, fraction f2)
{
	int d = f1.denominator*f2.denominator;
	int n = (f1.numerator*f2.denominator) + (f1.denominator*f2.numerator);
	return fraction(n, d);
}

fraction operator-(fraction f1, fraction f2)
{
	int d = f1.denominator*f2.denominator;
	int n = (f1.numerator*f2.denominator) - (f1.denominator*f2.numerator);
	return fraction(n, d);
}

fraction operator*(fraction f1, fraction f2)
{
	int d = f1.denominator*f2.denominator;
	int n = f1.numerator*f2.numerator;
	return fraction(n, d);
}

fraction operator/(fraction f1, fraction f2)
{
	int d = f1.denominator*f2.numerator;
	int n = f1.numerator*f2.denominator;
	return fraction(n, d);
}

ostream& operator<<(ostream& out, fraction& f)
{
	out << f.numerator << "/" << f.denominator << endl;
	return out;
}

istream& operator>>(istream& in, fraction& f)
{
	cout << "Enter the numerator: ";
	in >> f.numerator;
	cout << "Enter the denominator: ";
	in >> f.denominator;

	return in;
}

// Euclid's Algorithm for finding the greatest common divisor

int gcd(int u, int v)
{
	u = (u < 0) ? -u : u;			// make u non-negative
	v = (v < 0) ? -v : v;			// make v non-negative

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

	return v;				// the GCD of u and v
}