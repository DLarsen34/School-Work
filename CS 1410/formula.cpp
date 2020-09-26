#include <iostream>
#include <cmath>

using namespace std;

int main()
{
	double P;
	cout << "Enter the vaule for variable P." << endl;
	cin >> P;

	double i;
	cout << "Enter the value for variable i." << endl;
	cin >> i;

	double g;
	cout << "Enter the value for variable g." << endl;
	cin >> g;

	double n;
	cout << "Enter the value for variable n." << endl;
	cin >> n;

	double F = P*((1 - (pow(g + 1, n)) * pow(1 + i, n)) / (i - g));
	cout << "F= " << F << endl;
	return 0;
}