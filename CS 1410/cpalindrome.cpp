#define _CRT_SECURE_NO_WARNINGS
#include <iostream>
#include <cstring>

using namespace std;

void reverse(char* s);

int main(int argc, char* argv[])
{
	char input[1000] = "";
	for (int i = 1; i < argc; i++)
		strcat_s(input, 1000, argv[i]);

	char palindrome[1000] = "";	
	for (int i = 1; i < argc; i++)
		strcat_s(palindrome, 1000, argv[i]);
	
	reverse(palindrome);
	
	if (strcmp(palindrome, input) == 0)
		cout << "It is a palindrome." << endl;
	else
		cout << "It is not a palindrome" << endl;

	return 0;
}

void reverse(char* s)
{
	for (size_t i = 0; i < strlen(s) / 2; i++)
	{
		char	temp = s[i];
		s[i] = s[strlen(s) - 1 - i];
		s[strlen(s) - 1 - i] = temp;
	}
}
