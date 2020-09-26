#include <iostream>
#include <iomanip>
#include <cmath>
#include "fraction.h"
using namespace std;

fraction fraction::add(fraction f)
{
	int d = denominator*f.denominator;
	int n = (numerator*f.denominator) + (denominator*f.numerator);
	return fraction(n, d);
}

fraction fraction::sub(fraction f)
{
	int d = denominator*f.denominator;
	int n = (numerator*f.denominator) - (denominator*f.numerator);
	return fraction(n, d);
}

fraction fraction::mult(fraction f)
{
	int d = denominator*f.denominator;
	int n = numerator*f.numerator;
	return fraction(n, d);
}

fraction fraction::div(fraction f)
{
	int d = denominator*f.numerator;
	int n = numerator*f.denominator;
	return fraction(n, d);
}

void fraction::print()
{
	cout << numerator << "/" << denominator << endl;
}

void fraction::read()
{
	cout << "Enter the numerator: ";
	cin >> numerator;
	cout << "Enter the denominator: ";
	cin >> denominator;
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