#include <iostream>
#include <iomanip>
using namespace std;

int main()
{
	int height;
	cout << "How tall should the tree be?: " << endl;
	cin >> height;
	if (height < 3 || height > 15)
		cout << "Invalid height" << endl;
	for (int level = 0; level < height; level++)
	{
		for (int i = 0; i < height-level-1; i++)
			cout << ' ';
		cout << '/';
		for (int j = 0; j < 2*level; j++)
			cout << ' ';
		cout << '\\';
		cout << endl;
	}
	for (int i = 0; i < 2 * height; i++)
		cout << '-';
	cout << endl;
	for (int i = 0; i < .5*height; i++)
	{
		for (int j = 0; j < height - 1; j++)
			cout << ' ';
		cout << "||"<< endl;
	}
	
	return 0;
}