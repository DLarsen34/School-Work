#include <iostream>
#include "fraction.h"
using namespace std;

int main()
{
	char	choice;
	fraction f1;
	fraction f2;
	fraction f3;

	do
	{
		cout << "A\tAdd\n";
		cout << "S\tSub\n";
		cout << "M\tMult\n";
		cout << "D\tDiv\n";
		cout << "E\tExit\n";

		cout << "\nChoice?: ";

		cin >> choice;
		cin.ignore();

		switch (choice)
		{
		case 'A':
		case 'a':
			cin >> f1;
			cin >> f2;
			f3 = f1 + f2;
			cout << f3;
			break;

		case 'S':
		case 's':
			cin >> f1;
			cin >> f2;
			f3 = f1 - f2;
			cout << f3;
			break;

		case 'M':
		case 'm':
			cin >> f1;
			cin >> f2;
			f3 = f1 * f2;
			cout << f3;
			break;

		case 'D':
		case 'd':
			cin >> f1;
			cin >> f2;
			f3 = f1 / f2;
			cout << f3;
			break;

		case 'e':
		case 'E':
			break;

		default:
			cerr << "Unrecognized choice: " <<
				choice << endl;
			break;
		}
	} while (choice != 'e' && choice != 'E');

	return 0;
}