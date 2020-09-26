#include <iostream>
#include <string>

using namespace std;

string reverse(string s);

int main()
{
	string input;

	cout << "Enter the string you think could be a palindrome in all lowercase and no punctuation." << endl;
	getline(cin, input);

	for (int i = 0; i < input.length(); i++)
		while (input[i] == ' ')
			input.erase(i, 1);

	if (input == reverse(input))
		cout << "This string is a valid palindrome" << endl;
	else
		cout << "This string is not a valid palindrome" << endl;


	return 0;
}

	string reverse(string s)
	{
		string r;

		for (int i = 0; i < s.length(); i++)
			r += s[s.length() - 1 - i];

		return r;
	}
