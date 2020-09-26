//Copyright 2018, Bradley Peterson, Weber State University, All rights reserved. (Oct 1 2018)

#include <iostream>
#include <map>
#include <algorithm>
#include <list>
#include <vector>
#include <memory>

#include <sstream>

template <typename T> class DoublyLinkedList;

using namespace std;

//******************
//The node class
//******************
template <typename T>
struct Node {
	T data{};
	shared_ptr< Node<T> > forward;
	shared_ptr< Node<T> > backward;
};

//******************
//The Iterator class
//******************
template <typename T>
class Iterator : public std::iterator<std::bidirectional_iterator_tag, T> {
	friend class DoublyLinkedList<T>;
public:
	//TODO: Implement the following:
	//operator*
	T& operator*();
	//operator++ prefix  ends with return *this;
	Iterator<T> operator++();
	//operator++ postfix  starts with auto temp = *this;  advances the "this"...;   return temp;
	Iterator<T> operator++(int);
	//operator-- prefix
	Iterator<T> operator--();
	//operator!=
	bool operator!=(const Iterator<T>& it) const;
	//operator==
	bool operator==(const Iterator<T>& it) const;

private:
	//TODO: supply two data members
	//You need a shared pointer to a node (if you want, an even better approach would be to use a weak pointer)
	shared_ptr<Node<T>> current;
	//You need a boolean atRightEnd (see lecture video)
	bool atRightEnd{ false };
};

//***********************************
//The Iterator class methodscv gc
//***********************************

//TODO, code the definitions for all the iterator methods.
template <typename T>
T& Iterator<T>::operator*()
{
	return this->current->data;
}

template <typename T>
Iterator<T>Iterator<T>::operator++()
{
	if (this->current->forward == NULL)
		this->atRightEnd = true;
	else
		this->current = this->current->forward;

	return *this;
}

template <typename T>
Iterator<T>Iterator<T>::operator++(int)
{
	auto temp = *this;
	this->current = this->current->forward;
	return temp;
}

template <typename T>
Iterator<T>Iterator<T>::operator--()
{
	if (this->atRightEnd)
		this->atRightEnd = false;

	else
		this->current = this->current->backward;

	return *this;
}

template <typename T>
bool Iterator<T>::operator==(const Iterator<T>& it) const
{
	if ((this->current == it.current) && (this->atRightEnd == it.atRightEnd))
		return true;
	else
		return false;
}

template <typename T>
bool Iterator<T>::operator!=(const Iterator<T>& it) const
{
	if ((this->current != it.current) || (this->atRightEnd != it.atRightEnd))
		return true;
	else
		return false;
}

//****************************
//The DoublyLinkedList class
//****************************
template <typename T>
class DoublyLinkedList {

public:

	//public members of the DoublyLinkedList class
	DoublyLinkedList();
	~DoublyLinkedList();
	string getStringFromList();

	void insertFirst(const T&);
	void insertLast(const T&);
	void deleteFirst();
	void deleteLast();

	Iterator<T> begin();
	Iterator<T> end();
	//TODO: Implement a begin() and end() method

protected:
	shared_ptr< Node<T> > first;
	shared_ptr< Node<T> > last;
	unsigned int count;
};

template <typename T>
DoublyLinkedList<T>::DoublyLinkedList() {
	count = 0;
	first = nullptr;
	last = nullptr;
}

template <typename T>
DoublyLinkedList<T>::~DoublyLinkedList() {
	while (first) {
		first->backward.reset();
		first = first->forward;
	}
	last.reset();
}

template <typename T>
void DoublyLinkedList<T>::insertLast(const T& item) {


	if (!first) {
		//Scenario #1 - The list is empty
		first = make_shared< Node<T> >();
		first->data = item;
		last = first;
	}
	else {
		//Scenario #2 - The list has at least one item
		shared_ptr< Node<T> > tempPtr = make_shared< Node<T> >();
		tempPtr->data = item;
		last->forward = tempPtr;
		tempPtr->backward = last;
		last = tempPtr;
	}
	count++;
}
template <typename T>
void DoublyLinkedList<T>::insertFirst(const T& item) {
	if (!first) {
		//Scenario #1 The list is empty
		first = make_shared< Node<T> >();
		first->data = item;
		last = first;
	}
	else {
		//Scenario #2 The list has at least one item in it
		shared_ptr< Node<T> > tempPtr = make_shared< Node<T> >();
		tempPtr->data = item;
		tempPtr->forward = first;
		first->backward = tempPtr;
		first = tempPtr;
	}
	count++;
}

template <typename T>
void DoublyLinkedList<T>::deleteFirst() {

	//Empty list
	if (!first) {
		cout << "List is already empty" << endl;
		return;
	}

	//Scenario 1 or more nodes
	first = first->forward;

	if (!first) {
		//Must have been only 1 node in the list
		last.reset();
	}
	else {
		//first->backward = nullptr;
		first->backward.reset();
	}

	count--;

}

template <typename T>
void DoublyLinkedList<T>::deleteLast() {

	if (!first) {
		//empty list scenario
		cout << "The list is empty" << endl;
	}
	else {
		last = last->backward;
		if (!last) {
			//1 node scenario
			first.reset();
		}
		else {
			//2 or more node scenario
			last->forward.reset();
		}
		count--;
	}
}


//This method helps return a string representation of all nodes in the linked list
template <typename T>
string DoublyLinkedList<T>::getStringFromList() {
	stringstream ss;
	if (first == nullptr) {
		ss << "The list is empty.";
	}
	else {


		shared_ptr< Node<T> > currentNode = first;
		ss << currentNode->data;
		currentNode = currentNode->forward;

		while (currentNode != nullptr) {
			ss << " " << currentNode->data;
			currentNode = currentNode->forward;
		}
	}
	return ss.str();
}

//***********************************
//The DoublyLinkedList class methods
//***********************************
//TODO, implement the  the definitions for the begin() and end() methods

template <typename T>
Iterator<T> DoublyLinkedList<T>::begin()
{
	Iterator<T> temp;
	if (this->count > 0)
	{
		temp.current = this->first;
		temp.atRightEnd = false;
	}
	return temp;
}

template <typename T>
Iterator<T> DoublyLinkedList<T>::end()
{
	Iterator<T> temp;
	if (this->count > 0)
	{
		temp.current = this->last;
		temp.atRightEnd = true;
	}
	
	return temp;
}

//***********************************
// TODO, complete the ourSort function.
// Note that begin and end here are are iterators (The T is just saying it can be any kind of iterator).
// Our iterator tools are ***ONLY***
// ++, --, !=, *, ==. 
// To create a copy of iterators:
// T copyOfBeging = begin;
// To swap the data being pointed at by two iterators:
// iter_swap(begin, end);

template <typename T>
void ourSort(T begin, T end) {
	if (begin != end)
	{
		bool finished = false;
		while (finished == false)
		{
			finished = true;
			T curr = begin;
			T ahead = begin;
			++ahead;
			while (ahead != end)
			{
				if (*ahead < *curr)
				{
					iter_swap(ahead, curr);
					finished = false;
				}
				++curr;
				++ahead;
			}
		}
	}
}


template <typename T, typename Functor>
void runFunctor(T begin, T end, Functor f) {
	while (begin != end) {
		f(*begin);
		++begin;
	}
}

//----------------------------------------------------------------------------------------------------------------------------------------
//Copyright 2018, Bradley Peterson, Weber State University, All rights reserved. (Oct 1 2018)
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
		cout << "***Failed test " << testName << " *** " << endl << "  There are " << whatItIs << " bytes of memory yet to be reclaimed!" << endl;
		return false;
	}
}


//This helps with testing, do not modify.
void testIteratorFundamentals() {
	/*cout << "|||### You need to comment in testIteratorIncrement() when it's ready and remove this ###|||" << endl;
	cout << "|||### I'd strongly advise commenting in tests on at a time and testing those.  It's harder to try and do all tests at once.###|||" << endl;*/

	DoublyLinkedList<int> d;

	//Our test data should have all even numbers from 2 to 20
	for (int i = 2; i <= 20; i += 2) {
	  d.insertLast(i);
	}

	//Get an iterator which points at the beginning of the list
	Iterator<int> iter = d.begin();

	//Test the operator* operator
	checkTest("testIteratorFundamentals #1", 2, *iter);

	//Test the ++ prefix increment opreator
	++iter;
	checkTest("testIteratorFundamentals #2", 4, *iter);

	//Test the != operator
	//reset them back to the start
	iter = d.begin();
	Iterator<int> anotherIter = d.begin();
	if (iter != anotherIter) {
	  cout << "****** Failed testIteratorFundamentals #3 ****** " << endl << "     The two iteraters held the same data." << endl;
	}
	else {
	  cout << "Passed testIteratorFundamentals #3" << endl;
	}

	//Again test the != operator
	++iter;
	if (iter != anotherIter) {
	  cout << "Passed testIteratorFundamentals #4" << endl;
	}
	else {
	  cout << "****** Failed testIteratorFundamentals #4 ****** " << endl << "     The two iteraters held different data." << endl;
	}

	//Test the ++postfix increment
	iter = d.begin(); //reset it back to the start
	anotherIter = iter++;  //anotherIter should be at the data 2

	checkTest("testIteratorFundamentals #5", 4, *iter);
	checkTest("testIteratorFundamentals #6", 2, *anotherIter);

	checkTest("testIteratorFundamentals #7", "2 4 6 8 10 12 14 16 18 20", d.getStringFromList());

}

//This helps with testing, do not modify.
void testIteratorIncrement() {
	//cout << "|||### You need to comment in testIteratorIncrement() when it's ready and remove this ###|||" << endl;
	DoublyLinkedList<int> *d = new DoublyLinkedList<int>;

	//Our test data should have all even numbers from 2 to 20
	for (int i = 2; i <= 20; i += 2) {
	  d->insertLast(i);
	}

	//Get an iterator which points at the beginning of the list
	Iterator<int> iter = d->begin();

	//Test that it does point to the first
	checkTest("testIteratorsIncrement #1", 2, *iter);

	//Test that our Iterator can move forward;
	++iter;	checkTest("testIteratorsIncrement #2", 4, *iter);


	//Test that our Iterator can move forward again;
	++iter;
	checkTest("testIteratorsIncrement #3", 6, *iter);

	//move it some more
	for (int i = 0; i < 6; i++) {
	  ++iter;
	}
	checkTest("testIteratorsIncrement #4", 18, *iter);

	//Hit the end
	++iter;
	checkTest("testIteratorsIncrement #5", 20, *iter);

	//Verify we move the iterator past the end without crashing
	++iter;
	checkTest("testIteratorsIncrement #6", "did not crash", "did not crash");


	delete d;
}

//This helps with testing, do not modify.
void testIteratorDecrement() {
	//cout << "|||### You need to comment in testIteratorDecrement() when it's ready and remove this###|||" << endl;

	  DoublyLinkedList<int> *d = new DoublyLinkedList<int>;
	
	  //Our test data should have all even numbers from 2 to 20
	  for (int i = 2; i <= 20; i += 2) {
	    d->insertLast(i);
	  }
	
	  //Get an Iterator which points at the end of the list
	  Iterator<int> iter = d->end();
	  --iter;  //We have to do a decrement otherwise it crashes
	
	           //Test that it does point to the first
	  checkTest("testIteratorsDecrement #1", 20, *iter);
	
	  //Test that our Iterator can move forward;
	  --iter;
	  checkTest("testIteratorsDecrement #2", 18, *iter);
	
	  //move it some more
	  for (int i = 0; i < 7; i++) {
	    --iter;
	  }
	  checkTest("testIteratorsDecrement #3", 4, *iter);
	
	  //Hit the end
	  --iter;
	  checkTest("testIteratorsDecrement #4", 2, *iter);
	
	  //Now go back forward
	  ++iter;
	  checkTest("testIteratorsDecrement #5", 4, *iter);
	
	  delete d;
}

//This helps with testing, do not modify.
void testIterationTricky() {

	//cout << "|||### You need to comment in testIterationTricky() when it's ready and remove this###|||" << endl;

	  DoublyLinkedList<int> myListOneNode;
	
	  myListOneNode.insertLast(42);
	  cout << "TestIterationTricky test #1, the next line should display 42" << endl;
	  stringstream ss;
	  //see if we can just iterator through one item.
	  for (auto i : myListOneNode) {
	    cout << i << " ";
	    ss << i << " ";
	  }
	  cout << endl;
	  checkTest("TestIterationTricky test #1", "42 ", ss.str());
	  ss.str("");
	
	  DoublyLinkedList<int> myListEmpty;
	  cout << "TestIterationTricky test #2, the next line shouldn't display anything" << endl;
	  //see if we can just iterator through one item.
	  for (auto i : myListEmpty) {
	    cout << i << " ";
	    ss << i << " ";
	  }
	  cout << endl;
	  checkTest("TestIterationTricky test #2", "", ss.str());
	  ss.str("");
}



//This helps with testing, do not modify.
void testLambda() {
	//cout << "|||### You need to comment in testIteratorIncrement() when it's ready and remove this ###|||" << endl;
	DoublyLinkedList<int> myList;

	//Our test data should have all even numbers from 2 to 20
	for (int i = 2; i <= 6; i += 2) {
		myList.insertLast(i);
	}
	myList.insertLast(100);
	for (int i = 8; i <= 12; i += 2) {
		myList.insertLast(i);
	}
	myList.insertLast(100);
	for (int i = 14; i <= 20; i += 2) {
		myList.insertLast(i);
	}
	stringstream ss;
	for (auto i : myList) {
		ss << i << " ";
	}
	cout << endl;
	checkTest("testLambda test #1", "2 4 6 100 8 10 12 100 14 16 18 20 ", ss.str());
	ss.str("");

	//Now sort it using our algorithm
	runFunctor(myList.begin(), myList.end(), [&](int& i) {i = i * 2; });
	for (auto i : myList) {
	  ss << i << " ";
	}
	cout << endl;
	checkTest("testLambda test #2", "4 8 12 200 16 20 24 200 28 32 36 40 ", ss.str());
	ss.str("");

}


//This helps with testing, do not modify.
void testAlgorithms() {
	//cout << "|||### You need to comment in testIteratorIncrement() when it's ready and remove this ###|||" << endl;

	DoublyLinkedList<int> myList;

	//Our test data should have all even numbers from 2 to 20
	for (int i = 2; i <= 6; i += 2) {
	  myList.insertLast(i);
	}
	myList.insertLast(100);
	for (int i = 8; i <= 12; i += 2) {
	  myList.insertLast(i);
	}
	myList.insertLast(100);
	for (int i = 14; i <= 20; i += 2) {
	  myList.insertLast(i);
	}
	stringstream ss;
	for (auto i : myList) {
	  ss << i << " ";
	}
	cout << endl;
	checkTest("testAlgorithms test #1", "2 4 6 100 8 10 12 100 14 16 18 20 ", ss.str());
	ss.str("");

	//Now sort it using our algorithm
	ourSort(myList.begin(), myList.end());
	for (auto i : myList) {
	  ss << i << " ";
	}
	cout << endl;
	checkTest("testAlgorithms test #2", "2 4 6 8 10 12 14 16 18 20 100 100 ", ss.str());
	ss.str("");


	DoublyLinkedList<int> manyNines;
	manyNines.insertLast(9);
	manyNines.insertLast(9);
	manyNines.insertLast(4);
	manyNines.insertLast(2);
	manyNines.insertLast(9);
	manyNines.insertLast(9);
	manyNines.insertLast(5);
	manyNines.insertLast(1);
	manyNines.insertLast(9);
	manyNines.insertLast(2);
	manyNines.insertLast(9);
	manyNines.insertLast(9);

	ourSort(manyNines.begin(), manyNines.end());

	for (auto i : manyNines) {
	  ss << i << " ";
	}
	cout << endl;
	checkTest("testAlgorithms test #3", "1 2 2 4 5 9 9 9 9 9 9 9 ", ss.str());
	ss.str("");

	DoublyLinkedList<int> oneItem;
	oneItem.insertLast(42);
	ourSort(oneItem.begin(), oneItem.end());

	for (auto i : oneItem) {
	  ss << i << " ";
	}
	cout << endl;
	checkTest("testAlgorithms test #4", "42 ", ss.str());
	ss.str("");

	DoublyLinkedList<int> noItems;
	oneItem.insertLast(42);
	ourSort(noItems.begin(), noItems.end());

	for (auto i : noItems) {
	  ss << i << " ";
	}
	cout << endl;
	checkTest("testAlgorithms test #5", "", ss.str());
	ss.str("");

}

void pressAnyKeyToContinue() {
	cout << "Press enter to continue...";
	cin.get();
}

int main() {

	//cout << "This first test can run forever until you get operators *, != and ++ implemented." << endl;

	testIteratorFundamentals();

	testIteratorIncrement();

	testIteratorDecrement();

	testIterationTricky();

	testLambda();

	testAlgorithms();
	



	return 0;
}