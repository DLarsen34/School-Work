#pragma once
#define _EMPLOYEE_H_
#include <iostream>
#include <string>
#include "Address.h"
#include "Date.h"
using namespace std;

class Employee
{
private:
	string name;
	Address* addr;
	Date date;
public:
	Employee(string a_name, int a_year, int a_month, int a_day) : date(a_year, a_month, a_day), addr(NULL), name(a_name) {}

	~Employee()
	{
		if (addr != NULL)
			delete addr;
	}

	virtual double calcPay() = 0;

	string getName()
	{
		return name;
	}

	void setAddress(string a_street, string a_city)
	{
		if (addr != NULL)
			delete addr;
		addr = new Address(a_street, a_city);
	}

	virtual void display()
	{
		cout << name << endl;
		date.display();
		if (addr != NULL)
			addr->display();
	}

	friend ostream& operator<<(ostream& out, Employee& me)
	{
		out << me.name << endl;
		out << me.date << endl;
		if (me.addr != NULL)
			out << *me.addr << endl;
		out << endl;
		return out;
	}
};
