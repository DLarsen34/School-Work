#include <iostream>
#include <iomanip>
#include "sterling.h"
using namespace std;

int main()
{
	sterling s1;
	read(&s1);
	print(s1);

	sterling s2;
	read(&s2);
	print(s2);

	sterling s3 = add(s1, s2);
	cout << endl;

	print(add(s1, s2));


	return 0;
}