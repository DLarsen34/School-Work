#include <iostream>
#include <cmath>
using namespace std;

int main()
{
	double a;
	cout << "Please enter side A: ";
	cin >> a;
	if (a == 0)
	{
		cout << "Variable a cannot be equal to 0, it would cause division by 0" << endl;
		exit(0);
	}

	double b;
	cout << "Please enter side B: ";
	cin >> b;

	double c;
	cout << "Please enter side C: ";
	cin >> c;

	double x1, x2;
	double real;
	double imag;
	double discriminant = pow(b, 2) - 4 * a*c;
	if (discriminant >= 0)
	{
		x1 = (-b + sqrt(pow(b, 2) - 4 * a*c)) / (2 * a);
		x2 = (-b - sqrt(pow(b, 2) - 4 * a*c)) / (2 * a);
		cout << "x1 = " << x1 << endl;
		cout << "x2 = " << x2 << endl;
	}
	if (discriminant<0)
	{
		real = -b / (2 * a);
		imag = sqrt(-discriminant) / (2 * a);
		cout << "x1 = " << real << " + " << imag << "i" << endl;
		cout << "x2 = " << real << " - " << imag << "i" << endl;
	}

	return 0;
}