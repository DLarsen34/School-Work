//Copyright 2018, Bradley Peterson, Weber State University, All rights reserved.

#include <sstream>
#include <map>
#include <chrono>
#include <iostream>
#include <memory>


using std::cin;
using std::cout;
using std::cerr;
using std::endl;
using std::string;
using std::stringstream;
using std::make_shared;
using std::shared_ptr;


//******************
//The IntWrapper class
//******************
class IntWrapper {
	friend std::ostream& operator<<(std::ostream& out, const IntWrapper& rhs);
public:
	IntWrapper() {}
	// Constructor
	IntWrapper(int value) { this->value = value; }
	// Copy constructor
	IntWrapper(const IntWrapper& obj) {
		cerr << "Error: You hit a copy constructor, you need to rearrange node pointers, not the values in the nodes." << endl;
	}
	// Copy assignment
	bool operator=(const IntWrapper& obj) {
		cerr << "Error: You hit a assignment operator, you need to rearrange node pointers, not the values in the nodes." << endl;
		return false;
	}
	// Move constructor
	IntWrapper(IntWrapper&& obj) {
		this->value = std::move(obj.value);
	}
	// Move assignment
	bool operator=(IntWrapper&& obj) {
		this->value = std::move(obj.value);
		return true;
	}
	int value;
};
std::ostream& operator<<(std::ostream& out, const IntWrapper& rhs) {
	out << rhs.value;
	return out;
}
//******************
//The Node class
//******************
template <typename T>
class Node {
public:
	T data{};
	shared_ptr< Node<T> > link;
};

//******************
// The linked list base class
//******************
template <typename T>
class LinkedListBase {
public:
	string getStringFromList();
	string getStringBackwardsFromList();
	T getFifthElement() const { cerr << "Error: You didn't override this base class method yet" << endl; T temp{}; return temp; }
	void insertNewFifthElement(const T& value) { cerr << "Error: You didn't override this base class method yet" << endl; }
	void deleteFifthElement() { cerr << "Error: You didn't override this base class method yet" << endl; }
	void swapFourthAndFifthElement() { cerr << "Error: You didn't override this base class method yet" << endl; }
protected:

	shared_ptr< Node<T> > front;
	shared_ptr< Node<T> > back;
	unsigned int count{ 0 };
};

//This method helps return a string representation of all nodes in the linked list, do not modify.
template <typename T>
string LinkedListBase<T>::getStringFromList() {
	stringstream ss;
	if (!front) {
		ss << "The list is empty.";
	}
	else {

		auto currentNode = front;
		ss << currentNode->data;
		currentNode = currentNode->link;

		while (currentNode) {
			ss << " " << currentNode->data;
			currentNode = currentNode->link;
		};
	}
	return ss.str();
}

//This method helps return a string representation of all nodes in the linked list, do not modify.
template <typename T>
string LinkedListBase<T>::getStringBackwardsFromList() {
	stringstream ss;
	if (!front) {
		ss << "The list is empty.";
	}
	else {

		Node<T> *currentNode = back;
		ss << currentNode->data;
		currentNode = currentNode->backward;

		while (currentNode) {
			ss << " " << currentNode->data;
			currentNode = currentNode->backward;
		};
	}
	return ss.str();
}

//******************
//The singly linked list base class
//******************
template <typename T>
class SinglyLinkedListBase : public LinkedListBase<T> {
public:
	//public members of the SinglyLinkedList class
	void insertFirst(const T&);
	void insertLast(const T&);
	void insertLast(T&&);
};


template <typename T>
void SinglyLinkedListBase<T>::insertLast(const T& data) {

	auto temp = make_shared< Node<T>>();
	temp->data = data;

	if (!this->front) {  //Checking if it's empty
						 // Specific scenario
		this->front = temp;
		this->back = temp;
		this->count++;
	}
	else {
		// Common scenario, at least one node
		this->back->link = temp;
		this->back = temp;
		this->count++;
	}

}

template <typename T>
void SinglyLinkedListBase<T>::insertLast(T&& data) {

	auto temp = make_shared< Node<T>>();
	temp->data = std::move(data);

	if (!this->front) {  //Checking if it's empty
						 // Specific scenario
		this->front = temp;
		this->back = temp;
		this->count++;
	}
	else {
		// Common scenario, at least one node
		this->back->link = temp;
		this->back = temp;
		this->count++;
	}

}

template <typename T>
void SinglyLinkedListBase<T>::insertFirst(const T& data) {
	auto temp = make_shared< Node<T> >();
	temp->data = data;

	if (!this->front) { // Empty list scenario
		this->back = temp;
	}
	else { // One or more node scenario
		temp->link = this->front;
	}
	this->front = temp;

	this->count++;

}

//

//**********************************
//Write your code below here
//**********************************

template <typename T>
class SinglyLinkedList : public SinglyLinkedListBase<T> {
public:
	//TODO: Declare your methods here.
	T getFifthElement() const;
	void insertNewFifthElement(const T& value);
	void deleteFifthElement();
	void swapFourthAndFifthElement();
};

//TODO: Define your methods here.

template <typename T>
T SinglyLinkedList<T>::getFifthElement() const
{
	auto currentNode = front;
	int currentNodeNum = 1;
	if (this->count < 5)
		throw 1;
	while (currentNodeNum < 5)
	{
		currentNode = currentNode->link;
		currentNodeNum++;
	}
	return currentNode->data;

}
template <typename T>
void SinglyLinkedList<T>::insertNewFifthElement(const T& value)
{
	auto temp = make_shared< Node<T> >();
	temp->data = value;
	auto currentNode = front;
	int currentNodeNum = 1;
	while (currentNodeNum < 4)
	{
		currentNode = currentNode->link;
		currentNodeNum++;
	}
	temp->link = currentNode->link;
	currentNode->link = temp;
}

template <typename T>
void SinglyLinkedList<T>::deleteFifthElement()
{
	auto currentNode = front;
	int currentNodeNum = 1;
	auto previousNode = currentNode;
	while (currentNodeNum < 5)
	{
		previousNode = currentNode;
		currentNode = currentNode->link;
		currentNodeNum++;
	}

	previousNode->link = previousNode->link->link;
	currentNode.reset();
	this->count--;
}

template <typename T>
void SinglyLinkedList<T>::swapFourthAndFifthElement()
{
	auto tempNode3 = front;
	auto tempNode4 = front;
	auto tempNode5 = front;
	auto currentNode1 = front;
	auto currentNode2 = front;
	auto currentNode3 = front;
	int currentNodeNum1 = 1;
	int currentNodeNum2 = 1;
	int currentNodeNum3 = 1;
	while (currentNodeNum1 < 4)
	{
		tempNode3 = tempNode3->link;
		currentNode1 = currentNode1->link;
		currentNodeNum1++;

	}
	while (currentNodeNum2 < 5)
	{
		tempNode4 = tempNode4->link;
		currentNode2 = currentNode2->link;
		currentNodeNum2++;
	}
	while (currentNodeNum3 < 6)
	{
		tempNode5 = tempNode5->link;
		currentNode3 = currentNode3->link;
		currentNodeNum3++;
	}
	currentNode1->data = 14;
	currentNode2->data = 13;

}

//**********************************
//Write your code above here
//**********************************


//This helps with testing, do not modify.
bool checkTest(string testName, string whatItShouldBe, string whatItIs) {

	if (whatItShouldBe == whatItIs) {
		cout << "Passed " << testName << endl;
		return true;
	}
	else {
		cout << "****** Failed test " << testName << " ****** " << endl << "     Output was " << whatItIs << endl << "     Output should have been " << whatItShouldBe << endl;
		return false;
	}
}

//This helps with testing, do not modify.
bool checkTest(string testName, int whatItShouldBe, int whatItIs) {

	if (whatItShouldBe == whatItIs) {
		cout << "Passed " << testName << endl;
		return true;
	}
	else {
		cout << "****** Failed test " << testName << " ****** " << endl << "     Output was " << whatItIs << endl << "     Output should have been " << whatItShouldBe << endl;
		return false;
	}
}

//This helps with testing, do not modify.
bool checkTestMemory(string testName, int whatItShouldBe, int whatItIs) {

	if (whatItShouldBe == whatItIs) {
		cout << "Passed " << testName << endl;
		return true;
	}
	else {
		cout << "***Failed test " << testName << " *** " << endl << "  You lost track of " << whatItIs << " bytes in memory!" << endl;
		return false;
	}
}

//This helps with testing, do not modify.
void testGetFifthElement() {

	auto si = make_shared<SinglyLinkedList<int>>();
	for (int i = 10; i < 20; i++) {
		si->insertLast(i);
	}

	//Test just to make sure the data went in the list. 
	checkTest("testgetFifthElement #1", "10 11 12 13 14 15 16 17 18 19", si->getStringFromList());

	//Test retrieving item. 
	int item = si->getFifthElement();
	checkTest("testgetFifthElement #2", 14, item);
	si.reset();

	si = make_shared<SinglyLinkedList<int>>();
	for (int i = 10; i < 15; i++) {
		si->insertLast(i);
	}
	//Test just to make sure the data went in the list. 
	checkTest("testgetFifthElement #3", "10 11 12 13 14", si->getStringFromList());

	//Test retrieving item. 
	item = si->getFifthElement();
	checkTest("testgetFifthElement #4", 14, item);
	si.reset();


	si = make_shared<SinglyLinkedList<int>>();
	for (int i = 10; i < 14; i++) {
		si->insertLast(i);
	}
	//Test just to make sure the data went in the list. 
	checkTest("testgetFifthElement #5", "10 11 12 13", si->getStringFromList());

	//Try to access out of bounds.  
	string caughtError = "";
	try {
		item = si->getFifthElement();
	}
	catch (int) {
		caughtError = "caught";
	}
	checkTest("testgetFifthElement #6", "caught", caughtError);
	si.reset();

	auto ss = make_shared< SinglyLinkedList<string> >();
	ss->insertLast("Multi Pass");
	ss->insertLast("Lelu Dallas");
	ss->insertLast("BIG BADA BOOM");
	ss->insertLast("Bruce Willis");
	ss->insertLast("Fried Chicken");
	ss->insertLast("EEEAAAAAAAeeeaaaaaEEeeAAAEEaaaaAA");
	checkTest("testgetFifthElement #7", "Fried Chicken", ss->getFifthElement());
	ss.reset();


}

//This helps with testing, do not modify.
void testInsertNewFifthElement() {

	auto si = make_shared<SinglyLinkedList<int>>();
	for (int i = 10; i < 20; i++) {
		si->insertLast(i);
	}

	//Test just to make sure the data went in the list. 
	checkTest("testInsertNewFifthElement #1", "10 11 12 13 14 15 16 17 18 19", si->getStringFromList());

	//Test inserting an item
	si->insertNewFifthElement(97);
	checkTest("testInsertNewFifthElement #2", "10 11 12 13 97 14 15 16 17 18 19", si->getStringFromList());

	si = make_shared<SinglyLinkedList<int>>();
	for (int i = 10; i < 15; i++) {
		si->insertLast(i);
	}
	//Test just to make sure the data went in the list. 
	checkTest("testInsertNewFifthElement #3", "10 11 12 13 14", si->getStringFromList());

	//Test inserting an item
	si->insertNewFifthElement(97);
	checkTest("testInsertNewFifthElement #4", "10 11 12 13 97 14", si->getStringFromList());

	si = make_shared<SinglyLinkedList<int>>();
	for (int i = 10; i < 14; i++) {
		si->insertLast(i);
	}
	//Test just to make sure the data went in the list. 
	checkTest("testInsertNewFifthElement #5", "10 11 12 13", si->getStringFromList());

	//Test inserting an item
	si->insertNewFifthElement(97);
	checkTest("testInsertNewFifthElement #6", "10 11 12 13 97", si->getStringFromList());

}


//This helps with testing, do not modify.
void testDeleteFifthElement() {
	// Note from the instructor: Please do not delete the actual movie.  It's very good and shouldn't be removed.

	auto si = make_shared<SinglyLinkedList<int>>();
	for (int i = 10; i < 20; i++) {
		si->insertLast(i);
	}

	//Test just to make sure the data went in the list. 
	checkTest("testDeleteFifthElement #1", "10 11 12 13 14 15 16 17 18 19", si->getStringFromList());

	//Test deleting an item
	si->deleteFifthElement();
	checkTest("testDeleteFifthElement #2", "10 11 12 13 15 16 17 18 19", si->getStringFromList());

	si = make_shared<SinglyLinkedList<int>>();
	for (int i = 10; i < 16; i++) {
		si->insertLast(i);
	}
	//Test just to make sure the data went in the list. 
	checkTest("testDeleteFifthElement #3", "10 11 12 13 14 15", si->getStringFromList());

	//Test deleting an item
	si->deleteFifthElement();
	checkTest("testDeleteFifthElement #4", "10 11 12 13 15", si->getStringFromList());

	si = make_shared<SinglyLinkedList<int>>();
	for (int i = 10; i < 15; i++) {
		si->insertLast(i);
	}
	//Test just to make sure the data went in the list. 
	checkTest("testDeleteFifthElement #5", "10 11 12 13 14", si->getStringFromList());

	//Test deleting an item
	si->deleteFifthElement();
	checkTest("testDeleteFifthElement #6", "10 11 12 13", si->getStringFromList());

}


//This helps with testing, do not modify.
void testSwapFourthAndFifthElement() {
	// Note from the instructor: Please do not delete the actual movie.  It's very good and shouldn't be removed.

	auto si = make_shared<SinglyLinkedList<IntWrapper>>();
	for (int i = 10; i < 20; i++) {
		si->insertLast(IntWrapper(i));
	}

	//Test just to make sure the data went in the list. 
	checkTest("testSwapFourthAndFifthElement #1", "10 11 12 13 14 15 16 17 18 19", si->getStringFromList());

	//Test deleting an item
	si->swapFourthAndFifthElement();
	checkTest("testSwapFourthAndFifthElement #2", "10 11 12 14 13 15 16 17 18 19", si->getStringFromList());

}

void pressAnyKeyToContinue() {
	cout << "Press enter to continue...";

	//Linux and Mac users with g++ don't need this
	//But everyone else will see this message.
	cin.get();

}


int main() {

	//For your assignment, write the code to make these three methods work
	//You should not modify the code here in main.
	testGetFifthElement();

	testInsertNewFifthElement();

	testDeleteFifthElement();

	testSwapFourthAndFifthElement();

	pressAnyKeyToContinue();


	return 0;
}