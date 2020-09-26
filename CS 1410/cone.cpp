#define _USE_MATH_DEFINES
#include <iostream>
#include <cmath>
using namespace std;

int main()
{
	double V, S; //Volume and Surface Area

	double r; //radius variable
	cout << "Enter a radius: "; // prompt
	cin >> r;

	double h; //hieght variable
	cout << "Enter a height: "; //prompt
	cin >> h;
	
	V = (1.0 / 3.0)*M_PI*pow(r, 2)*h;
	S = M_PI*pow(r, 2) + M_PI*r*sqrt(pow(r, 2) + pow(h, 2));

	cout << "Volume = " << V << endl;
	cout << "Surface Area = " << S << endl;


	return 0;
}