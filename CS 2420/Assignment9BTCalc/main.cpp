// Copyright 2018, Bradley Peterson, Weber State University, all rights reserved.

#include <iostream>
#include <string>
#include <stack>
#include <sstream>
#include <cmath>
#include <memory>

//To prevent those using g++ from trying to use a library
//they don't have
#ifndef __GNUC__
#include <conio.h>
#else
#include <stdio.h>
#endif

using std::stack;
using std::istringstream;
using std::ostringstream;
using std::string;
using std::cout;
using std::cerr;
using std::endl;
using std::pow;
using std::shared_ptr;
using std::make_shared;

struct Node {
	string data{};
	shared_ptr<Node> llink;
	shared_ptr<Node> rlink;
};

class TreeParser {
public:
	TreeParser();
	void displayParseTree();
	void processExpression(string &expression);
	string computeAnswer();
	void inOrderTraversal();
	void postOrderTraversal();

protected:
	string myExpression;
	int position;
	
private:
	stack<string> mathStack;
	double castStrToDouble(string const &s);
	string castDoubleToStr(const double d);
	void initialize();
	bool isDigit(char c);
	bool isOperator(char c);
	void processExpression(shared_ptr<Node> ptr);
	void computeAnswer(shared_ptr<Node> ptr);
	void inOrderTraversal(shared_ptr<Node> ptr);
	void postOrderTraversal(shared_ptr<Node> ptr);
	shared_ptr<Node> root;
};

void TreeParser::inOrderTraversal() {
	inOrderTraversal(root);
	cout << endl;
}

void TreeParser::inOrderTraversal(shared_ptr<Node> ptr) {
	if (ptr) {
		inOrderTraversal(ptr->llink);          // Go left
		cout << ptr->data << " ";			   // Action
		inOrderTraversal(ptr->rlink);          // Go right
	}
}

void TreeParser::postOrderTraversal() {
	postOrderTraversal(root);
	cout << endl;
}

void TreeParser::postOrderTraversal(shared_ptr<Node> ptr) {
	if (ptr) {
		postOrderTraversal(ptr->llink);   // Go left
		postOrderTraversal(ptr->rlink);   // Go Right
		cout << ptr->data << " ";				  // Action
	}
}

void TreeParser::processExpression(string &expression) {
	if (expression.size() > 0) {
		myExpression = expression;
		position = 0;
		auto newNode = make_shared<Node>();
		root = newNode;
		processExpression(root);
	}
}

void TreeParser::processExpression(shared_ptr<Node> ptr) {
	while (position < myExpression.size()) {
		if (myExpression[position] == '(') {
			auto newNode = make_shared<Node>();
			newNode->llink = nullptr;
			newNode->rlink = nullptr;
			ptr->llink = newNode;
			position++;
			processExpression(ptr->llink);
		}
		else if (isDigit(myExpression[position])) {
			string temp = "";
			while (isDigit(myExpression[position])) {
				temp += myExpression[position];
				position++;
			}
			ptr->data = temp;
			return;
		}
		else if (isOperator(myExpression[position])) {
			ptr->data = myExpression[position];
			auto myNode = make_shared<Node>();
			myNode->rlink = nullptr;
			myNode->llink = nullptr;
			ptr->rlink = myNode;
			position++;
			processExpression(ptr->rlink);
		}
		else if (myExpression[position] == ')') {
			position++;
			return;
		}
		else if (myExpression[position] == ' ') {
			position++;
		}
	}
}

string TreeParser::computeAnswer() {
	this->computeAnswer(root);
	return mathStack.top();
}

void TreeParser::computeAnswer(shared_ptr<Node> ptr) {
	string temp = "";
	if (ptr) {
		computeAnswer(ptr->llink);
		computeAnswer(ptr->rlink);
		if (isDigit(ptr->data[0])) {
			mathStack.push(ptr->data);
		}
		else if (isOperator(ptr->data[0])) {
			if (ptr->data[0] == '+') {
				string temp1 = mathStack.top();
				mathStack.pop();
				string temp2 = mathStack.top();
				mathStack.pop();
				double dTemp1 = castStrToDouble(temp1);
				double dTemp2 = castStrToDouble(temp2);
				double answer = dTemp1 + dTemp2;
				mathStack.push(castDoubleToStr(answer));
			}
			else if (ptr->data[0] == '-') {
				string temp1 = mathStack.top();
				mathStack.pop();
				string temp2 = mathStack.top();
				mathStack.pop();
				double dTemp1 = castStrToDouble(temp1);
				double dTemp2 = castStrToDouble(temp2);
				double answer = dTemp2 - dTemp1;
				mathStack.push(castDoubleToStr(answer));
			}
			else if (ptr->data[0] == '*') {
				string temp1 = mathStack.top();
				mathStack.pop();
				string temp2 = mathStack.top();
				mathStack.pop();
				double dTemp1 = castStrToDouble(temp1);
				double dTemp2 = castStrToDouble(temp2);
				double answer = dTemp1 * dTemp2;
				mathStack.push(castDoubleToStr(answer));
			}
			else if (ptr->data[0] == '/') {
				string temp1 = mathStack.top();
				mathStack.pop();
				string temp2 = mathStack.top();
				mathStack.pop();
				double dTemp1 = castStrToDouble(temp1);
				double dTemp2 = castStrToDouble(temp2);
				double answer = dTemp2 / dTemp1;
				mathStack.push(castDoubleToStr(answer));
			}
			else if (ptr->data[0] == '^') {
				string temp1 = mathStack.top();
				mathStack.pop();
				string temp2 = mathStack.top();
				mathStack.pop();
				double dTemp1 = castStrToDouble(temp1);
				double dTemp2 = castStrToDouble(temp2);
				double answer = pow(dTemp2, dTemp1);
				mathStack.push(castDoubleToStr(answer));
			}
		}
	}
}

bool TreeParser::isDigit(char c) {
	if (c <= 57 && c >= 48) {
		return true;
	}
	else
		return false;
}

bool TreeParser::isOperator(char c) {
	if (c == 43 || c == 45 || c == 42 || c == 47 || c == 94) {
		return true;
	}
	else
		return false;
}

void TreeParser::initialize() {
	myExpression = "";
	position = 0;
	while (!mathStack.empty()) {
		mathStack.pop();
	}

}

double TreeParser::castStrToDouble(const string &s) {
	istringstream iss(s);
	double x;
	iss >> x;
	return x;
}

string TreeParser::castDoubleToStr(const double d) {
	ostringstream oss;
	oss << d;
	return oss.str();

}

TreeParser::TreeParser() {
	initialize();
}


void TreeParser::displayParseTree() {
	cout << "The expression seen using in-order traversal: ";
	inOrderTraversal();
	cout << endl;
	cout << "The expression seen using post-order traversal: ";
	postOrderTraversal();
	cout << endl;

}

void pressAnyKeyToContinue() {
	printf("Press any key to continue\n");

	//Linux and Mac users with g++ don't need this
	//But everyone else will see this message.
#ifndef __GNUC__
	_getch();
#else
	int c;
	fflush(stdout);
	do c = getchar(); while ((c != '\n') && (c != EOF));
#endif

}


int main() {
	
	TreeParser *tp = new TreeParser;
	string expression = "(4+7)";
	tp->processExpression(expression);
	tp->displayParseTree();
	cout << "The result is: " << tp->computeAnswer() << endl; //Should display 11 as a double output

	expression = "(7-4)";
	tp->processExpression(expression);
	tp->displayParseTree();
	cout << "The result is: " << tp->computeAnswer() << endl; //Should display 3 as a double output

	expression = "(9*5)";
	tp->processExpression(expression);
	tp->displayParseTree();
	cout << "The result is: " << tp->computeAnswer() << endl; //Should display 45 as a double output

	expression = "(4^3)";
	tp->processExpression(expression);
	tp->displayParseTree();
	cout << "The result is: " << tp->computeAnswer() << endl; //Should display 64 as a double output

	expression = "((2-5)-5)";
	tp->processExpression(expression);
	tp->displayParseTree();
	cout << "The result is: " << tp->computeAnswer() << endl; //Should display -8 as a double output

	expression = "(5*(6/2))";
	tp->processExpression(expression);
	tp->displayParseTree();
	cout << "The result is: " << tp->computeAnswer() << endl; //Should display 15 as a double output

	expression = "((1 + 2) * (3 + 4))";
	tp->processExpression(expression);
	tp->displayParseTree();
	cout << "The result is: " << tp->computeAnswer() << endl; //Should display 21 as a double output

	expression = "(543+321)";
	tp->processExpression(expression);
	tp->displayParseTree();
	cout << "The result is: " << tp->computeAnswer() << endl; //Should display 864 as a double output

	expression = "((5*(3+2))+(7*(4+6)))";
	tp->processExpression(expression);
	tp->displayParseTree();
	cout << "The result is: " << tp->computeAnswer() << endl; //Should display 95 as a double output

	expression = "(((((3+12)-7)*120)/(2+3))^3)";
	tp->processExpression(expression);
	tp->displayParseTree();
	cout << "The result is: " << tp->computeAnswer() << endl; //Should display close to 7077888 as a double output

	expression = "(((((9+(2*(110-(30/2))))*8)+1000)/2)+(((3^4)+1)/2))";
	tp->processExpression(expression);
	tp->displayParseTree();
	cout << "The result is: " << tp->computeAnswer() << endl; //Should display close to 1337 as a double/decimal output

	pressAnyKeyToContinue();
	return 0;
}
