#include <iostream>
#include <cmath>
using namespace std;

int main() 
{
	int x = 0;
	for (int i = 0; i < 100; i++)
	{
		for (int j = 1; j < 50; j++)
		{
			for (int k = 25; k < 40; k++)
			{
				cout << "here\n";
				x++;
			}
		}
	}
	cout << x << endl;
		return 0;
}