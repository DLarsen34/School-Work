#include <iostream>
#include <iomanip>
#include <cmath>
using namespace std;

int* histogram(int* scores, int count);
double deviation(int* scores, int size);
double mean(int* scores, int size);

int main()
{
	int scores[100];
	int score;
	int count = 0;

	cout << "Enter a score (-1 to stop): "; 
	cin >> score;
	if (score < -1 || score > 109)
	{
		cout << "Invalid score" << endl;
		cin >> score;
		count--;
	}
		
	while (score != -1)
	{
		cout << "Enter a score (-1 to stop): ";
		scores[count++] = score;
		cin >> score;
		if (score < -1 || score > 109)
		{
			cout << "Invalid score, Enter a score (-1 to stop): " << endl;
			cin >> score;
			count--;
		}
	}
	int* a = histogram(scores, count);
	for (int i = 9; i >= 0; i--)
	{
		cout << i << "| ";
		for (int j = 0; j < a[i]; j++)
		{
			cout << '*';
		}
		cout << endl;
	}
	cout << "SD: " << deviation(scores, count) << endl;
	return 0;
}

int* histogram(int* scores, int count)
{
	int* bins = new int[10]{};
	for (int i = 0; i < count; i++)
	{
		if (scores[i] >= 90)
		{
			bins[9]++;
		}
		else if (scores[i] >= 80 && scores[i] < 90)
		{
			bins[8]++;
		}
		else if (scores[i] >= 70 && scores[i] < 80)
		{
			bins[7]++;
		}
		else if (scores[i] >= 60 && scores[i] < 70)
		{
			bins[6]++;
		}
		else if (scores[i] >= 50 && scores[i] < 60)
		{
			bins[5]++;
		}
		else if (scores[i] >= 40 && scores[i] < 50)
		{
			bins[4]++;
		}
		else if (scores[i] >= 30 && scores[i] < 40)
		{
			bins[3]++;;
		}
		else if (scores[i] >= 20 && scores[i] < 30)
		{
			bins[2]++;
		}
		else if (scores[i] >= 10 && scores[i] < 20)
		{
			bins[1]++;
		}
		else if (scores[i]<10 && scores[i] >0)
		{
			bins[0]++;
		}
	}
	return bins;
}

double deviation(int* scores, int size)
{
	double sum =0;
	for (int i = 0; i < size; i++)
	{
		sum += pow(scores[i] - mean(scores, size), 2);
	}
	return sqrt(sum / size);

}

double mean(int* scores, int size)
{
	double sum = 0;
	for (int i = 0; i < size; i++)
		sum += scores[i];
	double average = sum / size;
	return average;
}