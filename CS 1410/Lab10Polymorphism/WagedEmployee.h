#pragma once
#include "Employee.h"
#include <iostream>
#include <string>
using namespace std;

class WagedEmployee : public Employee
{
private:
	double wage;
	double hours;
public:
	WagedEmployee(string a_name, int a_year, int a_month, int a_day, double a_wage, double a_hours) : Employee(a_name, a_year, a_month, a_day), wage(a_wage), hours(a_hours) {}

	double calcPay()
	{
			return wage*hours;
	}

	virtual void display()
	{
		Employee::display();
		cout << wage << " " << hours << calcPay() << endl;
	}

	friend ostream& operator<<(ostream& out, WagedEmployee& me)
	{
		out << (Employee &)me << " " << me.wage << " " << me.hours << endl;
		return out;
	}
}; 

