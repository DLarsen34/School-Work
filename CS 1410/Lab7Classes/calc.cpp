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
			f1.read();
			f2.read();
			f3 =f1.add(f2);
			f3.print();
			break;

		case 'S':
		case 's':
			f1.read();
			f2.read();
			f3 = f1.sub(f2);
			f3.print();
			break;

		case 'M':
		case 'm':
			f1.read();
			f2.read();
			f3 = f1.mult(f2);
			f3.print();
			break;

		case 'D':
		case 'd':
			f1.read();
			f2.read();
			f3 = f1.div(f2);
			f3.print();
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
