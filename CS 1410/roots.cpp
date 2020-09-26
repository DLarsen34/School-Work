#include <iostream>
#include <cmath>
using namespace std;

int main()
{
	double a;
	cout << "Please enter side A: ";
	cin >> a;

	double b;
	cout << "Please enter side B: ";
	cin >> b;

	double c;
	cout << "Please enter side C: ";
	cin >> c;

	double x1, x2;

	x1 = (-b + sqrt(pow(b, 2) - 4 * a*c)) / (2 * a);
	x2 = (-b - sqrt(pow(b, 2) - 4 * a*c)) / (2 * a);

	cout << "x1 = " << x1 << endl;
	cout << "x2 = " << x2 << endl;

	return 0;
}