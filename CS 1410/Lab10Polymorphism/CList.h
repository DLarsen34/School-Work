#ifndef _CLIST_H_
#define _CLIST_H_

template <class T>
class CList
{
private:
	T*	data;
	CList*	link;

public:
	CList() : data(NULL) { link = this; }
	~CList();
	T*	insert(T* p);
	T*	search(T* p);
	T*	remove(T* p);
	void	list();
};

template <class T>
CList<T>::~CList()
{
	if (link == NULL)		// prevent run-away recursion
		return;

	// deallocate the entire list
	CList*	l = this->link;

	while (l != this)
	{
		CList*	t = l;
		l = l->link;
		t->link = NULL;
		//delete t->data;
		delete t;
	}

	this->link = NULL;
}

template <class T>
T*	CList<T>::insert(T* key)
{
	CList*	l;

	// search for key in list
	for (l = this; l->link != this && l->link->data->getName() < key->getName(); l = l->link)
		;

	if (l->link->data != NULL && key->getName() == l->link->data->getName())	// key is in list
		return l->link->data;

	// insert key
	CList*	t = new CList();
	t->data = key;
	t->link = l->link;
	l->link = t;

	return t->data;
}

template <class T>
T*	CList<T>::remove(T* key)
{
	CList*	l;

	// search for key in the list
	for (l = this; l->link != this && l->link->data->getName() != key->getName(); l = l->link)
		;

	if (l->link->data != NULL && l->link->data->getName() == key->getName())
	{
		CList*	t = l->link;
		T*	d = t->data;
		l->link = t->link;
		t->link = NULL;
		delete t;
		return d;
	}
	else
		return NULL;
}


template <class T>
T* CList<T>::search(T* key)
{
	for (CList* l = this->link; l != this; l = l->link)
		if (l->data->getName() == key->getName())
			return l->data;
	return NULL;
}

template <class T>
void CList<T>::list()
{
	for (CList* l = this->link; l != this; l = l->link)
		l->data->display();
}

#endif
