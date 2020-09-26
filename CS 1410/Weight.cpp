#include <iostream>
#include <cmath>
using namespace std;

struct weight
{
	int ounce;
	int pound;
	int stone;
};

weight make_weight(int stone, int pound, int oz);
weight make_weight(int ounce);
weight add(weight w1, weight w2);
void print(weight& w);
void read(weight* w);

/*int main()
{
	return 0;
}*/

weight make_weight(int stone, int pound, int oz)
{
	weight temp;

	temp.stone = stone;
	temp.pound = pound;
	temp.ounce = oz;

	return temp;
}

weight make_weight(int ounce)
{
	weight temp;

	temp.stone = ounce/3584;
	ounce %= 3584;
	temp.pound = ounce / 16;
	temp.ounce = ounce % 16;
	
	return temp;
}

weight add(weight w1, weight w2)
{
	int i1 = w1.stone * 3584 + w1.pound * 16 + w1.ounce;
	int i2 = w2.stone * 3584 + w2.pound * 16 + w2.ounce;

	return make_weight(i1 + i2);
}

void print(weight& w)
{
	cout << w.stone << " stones " << w.pound << " pounds " << w.ounce << " ounces " << endl;
}

void read(weight* w)
{
	cout << "Please enter the Stones: ";
	cin >> w->stone;
	
	cout << "Please enter the pounds: ";
	cin >> w->pound;

	cout << "Please enter the ounces: ";
	cin >> w->ounce;
}
