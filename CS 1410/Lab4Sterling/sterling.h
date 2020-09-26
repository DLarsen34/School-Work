#pragma once
#include <iostream>
#include <iomanip>
using namespace std;

struct sterling
{
	int pounds;
	int shillings;
	int pence;
};

sterling make_sterling(int pounds, int shillings, int pence);
sterling make_sterling(int pounds);
sterling add(sterling s1, sterling s2);
void print(sterling& s);
void read(sterling* s);