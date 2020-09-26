// Copyright 2018, Bradley Peterson, Weber State University, all rights reserved. (11/2018)


#include <iostream>
#include <string>
#include <memory>

using std::endl;
using std::cout;
using std::cin;
using std::string;
using std::unique_ptr;
using std::make_unique;


void pressAnyKeyToContinue() {
	printf("Press any key to continue\n");

	cin.get();

}

//This helps with testing, do not modify.
bool checkTest(string testName, int whatItShouldBe, int whatItIs) {

	if (whatItShouldBe == whatItIs) {
		cout << "Passed " << testName << endl;
		return true;
	}
	else {
		cout << "***Failed test " << testName << " *** " << endl << "   Output was " << whatItIs << endl << "   Output should have been " << whatItShouldBe << endl;
		return false;
	}
}

template <typename T>
struct Node {
	T data{};
	unique_ptr<Node<T>> llink;
	unique_ptr<Node<T>> rlink;
	~Node() { cout << "I'm a node with value " << data << " and I'm destruting" << endl; }
};

template <typename T>
class Tree {
public:
	~Tree();
	void insert(const T& item);
	void preOrder();
	void inOrder();
	void postOrder();
	int nodeCount();
	int leavesCount();
	int singleChildCount();
	int levelCount(int level);

private:

	void preOrder(Node<T> * ptr);
	void inOrder(Node<T> * ptr);
	void postOrder(Node<T> * ptr);
	int nodeCount(Node<T> * ptr);
	int leavesCount(Node<T> * ptr);
	int singleChildCount(Node<T> * ptr);
	int levelCount(Node<T> * ptr, int curr, int desired);
	unique_ptr<Node<T>> root;

};

template <typename T>
Tree<T>::~Tree() {
	root.reset();
}


template <typename T>
void Tree<T>::insert(const T& item) {

	auto newNode = make_unique<Node<T>>();
	newNode->data = item;

	if (!root) {
		root = std::move(newNode);
	}
	else {
		Node<T>* curr = root.get();
		while (true) {
			if (item < curr->data) {
				if (curr->llink) {
					curr = curr->llink.get(); //go left
				}
				else {
					//nothing on the left, add it in
					curr->llink = std::move(newNode);
					return;
				}
			}
			else {
				if (curr->rlink) {
					curr = curr->rlink.get();
				}
				else {
					curr->rlink = std::move(newNode);
					return;
				}
			}
		}
	} //while (true);
}

template <typename T>
void Tree<T>::preOrder() {
	preOrder(root.get());
	cout << endl;
}

template <typename T>
void Tree<T>::preOrder(Node<T> * ptr) {
	if (ptr) {
		cout << "\"" << ptr->data << "\" "; // Action
		preOrder(ptr->llink.get());         // Go left
		preOrder(ptr->rlink.get());         // Go right
	}
}

template <typename T>
void Tree<T>::inOrder() {
	inOrder(root.get());
	cout << endl;
}

template <typename T>
void Tree<T>::inOrder(Node<T> * ptr) {
	if (ptr) {
		inOrder(ptr->llink.get());          // Go left
		cout << "\"" << ptr->data << "\" "; // Action
		inOrder(ptr->rlink.get());          // Go right
	}
}

template <typename T>
void Tree<T>::postOrder() {
	postOrder(root.get());
	cout << endl;
}

template <typename T>
void Tree<T>::postOrder(Node<T> * ptr) {
	if (ptr) {
		inOrder(ptr->llink.get());          // Go left
		cout << "\"" << ptr->data << "\" "; // Action
		inOrder(ptr->rlink.get());          // Go right
	}
}

template <typename T>
int Tree<T>::nodeCount(){
	return nodeCount(root.get());
}

template <typename T>
int Tree<T>::nodeCount(Node<T> * ptr){
	if (ptr == nullptr)
		return 0;
	else
		return nodeCount(ptr->llink.get()) + nodeCount(ptr->rlink.get()) + 1;

}

template <typename T>
int Tree<T>::leavesCount(){
	return leavesCount(root.get());
}

template <typename T>
int Tree<T>::leavesCount(Node<T> * ptr){
	if (ptr == nullptr)
		return 0;
	if (ptr->llink.get() == nullptr && ptr->rlink.get() == nullptr)
		return 1;
	else
		return leavesCount(ptr->llink.get()) + leavesCount(ptr->rlink.get());
}

template <typename T>
int Tree<T>::singleChildCount(){
	return singleChildCount(root.get());
}

template <typename T>
int Tree<T>::singleChildCount(Node<T> * ptr){
	if (ptr == nullptr)
		return 0;
	else {
		return ((((ptr->llink.get() == nullptr && ptr->rlink.get() != nullptr)) || (ptr->llink.get() != nullptr && ptr ->rlink.get() == nullptr))
			+ singleChildCount(ptr->llink.get()) + singleChildCount(ptr->rlink.get()));
	}
}

template <typename T>
int Tree<T>::levelCount(int level) {
	return levelCount(root.get(), 1, level);
}

template <typename T>
int Tree<T>::levelCount(Node<T> * ptr, int currLevel, int desiredLevel) {
	if (ptr == nullptr)
		return 0;
	if (currLevel == desiredLevel)
		return 1;
	return levelCount(ptr->llink.get(), currLevel+1, desiredLevel) + levelCount(ptr->rlink.get(), currLevel+1, desiredLevel);
}

int main() {

	Tree<int> myTree;

	myTree.insert(37);
	myTree.insert(32);
	myTree.insert(73);
	myTree.insert(95);
	myTree.insert(42);
	myTree.insert(12);
	myTree.insert(00);
	myTree.insert(49);
	myTree.insert(98);
	myTree.insert(7);
	myTree.insert(27);
	myTree.insert(17);
	myTree.insert(47);
	myTree.insert(87);
	myTree.insert(77);
	myTree.insert(97);
	myTree.insert(67);
	myTree.insert(85);
	myTree.insert(15);
	myTree.insert(5);
	myTree.insert(35);
	myTree.insert(55);
	myTree.insert(65);
	myTree.insert(75);
	myTree.insert(25);
	myTree.insert(45);
	myTree.insert(3);
	myTree.insert(93);
	myTree.insert(83);
	myTree.insert(53);
	myTree.insert(63);
	myTree.insert(23);
	myTree.insert(13);
	myTree.insert(43);
	myTree.insert(33);

	myTree.preOrder();

	// Comment in the following tests and implement them.  

	// Note: All recursion MUST accumulate through return values.  
	// That means nodeCount's return type must be int.  The code then obtain its return value and return that.  For example
	// int count = nodeCount( /* something to go left*/ );
	// count += nodeCount( /* something to go right*/ );
	// count += something for itself
	// return count;

	// This also means global count variables are not allowed.
	// Further, counts passed in through byref parameters or pointers are not allowed.  

	checkTest("Test #1, number of nodes", 35, myTree.nodeCount());
	checkTest("Test #2, number of leaves, (i.e. nodes with no children)", 11, myTree.leavesCount());
	checkTest("Test #3, number of nodes with one child", 14, myTree.singleChildCount());
	checkTest("Test #4, number of nodes on level 1 (the root level)", 1, myTree.levelCount(1));
	checkTest("Test #5, number of nodes on level 2", 2, myTree.levelCount(2));
	checkTest("Test #6, number of nodes on level 3", 4, myTree.levelCount(3));
	checkTest("Test #7, number of nodes on level 4", 6, myTree.levelCount(4));
	checkTest("Test #8, number of nodes on level 5", 7, myTree.levelCount(5));
	checkTest("Test #9, number of nodes on level 6", 7, myTree.levelCount(6));
	checkTest("Test #10, number of nodes on level 7", 7, myTree.levelCount(7));
	checkTest("Test #11, number of nodes on level 8", 1, myTree.levelCount(8));
	checkTest("Test #12, number of nodes on level 9", 0, myTree.levelCount(9));

	pressAnyKeyToContinue();
	return 0;
}