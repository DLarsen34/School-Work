#include <iostream>
#include <stdlib.h>
#include <time.h>
using namespace std;

int main()
{
	srand((unsigned)time(NULL)); //seed the generator
	int target = rand() % 100; // numbers [0..99]
	int guess;

	cout << "Welcome to the guessing game, Try and guess the correct number! (between 0-99)" << endl;
	cin >> guess;
	while (guess != target)
	{
		if (guess < 0)
		{
			exit(0);
		}
		if (guess < target)
		{
			cout << "Guess higher next time" << endl;
			cin>> guess;
		}
		if (guess > target)
		{
			cout << "Guess lower next time" << endl;
			cin >> guess;
		}
		if (guess == target)
		{
			cout << "You got it, great guess!" << endl;
		}
		

	}


	return 0;
}