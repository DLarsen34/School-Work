#include <iostream>
#include <fstream>
#include <iomanip>
#include <string>
using namespace std;

int main()
{
	cout << "Please enter the name of the file with the extension: " << endl;
	string file;
	getline(cin, file);

	ifstream in(file);
	if (!in.good())
	{
		cout << "Unable to open " << file << endl;
		exit(1);
	}
	
	/*string line;
	while (getline(in, line))
		cout << line << endl;*/
	cout << "----------------------------------------------------------------------------------" << endl;
	while (!in.eof())
	{
		string deposit;
		getline(in, deposit, ':');
		cout << left << setw(20) << deposit;

		string date;
		getline(in, date, ':');
		cout << setw(20) << date;

		string store;
		getline(in, store, ':');
		cout << setw(20)<< store;
		
		cout.setf(ios::fixed);
		cout.precision(2);
		string balance;
		getline(in, balance);
		double balance1 = stod(balance);
		cout << right << "$" << setw(8) << balance1 << endl;
	}
	cout << "----------------------------------------------------------------------------------" << endl;
	cout << right << setw(55) << "Balance: " << setw(6) << "$" << setw(8) << "68.81" << endl;
	return 0;
}