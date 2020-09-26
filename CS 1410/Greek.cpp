//#include <iostream>
//#include <string>
//using namespace std;
//
//class Beta
//{
//	private:
//		double cost;
//
//	public:
//		Beta(double a_cost) : cost(a_cost){}
//
//		void display()
//		{
//			cout << cost << endl;
//		}
//
//};
//
//class Gamma
//{
//	private:
//		char id;
//
//	public:
//		Gamma(char a_id) : id(a_id) {}
//		
//		void display()
//		{
//			cout << id << endl;
//		}
//};
//
//class Alpha
//{
//	private:
//		string name;
//		int part;
//		Beta* beta = NULL;
//		Gamma Gamm;
//
//	public:
//		Alpha(string a_name, int a_part, char a_id) : name(a_name), part(a_part), Gamm(a_id), beta(NULL) {}
//		
//		~Alpha()
//		{
//			if (beta != NULL)
//				delete beta;
//		}
//
//		void setBeta(double a_cost)
//		{
//			if (beta != NULL)
//				delete beta;
//			beta = new Beta(a_cost);
//		}
//
//		void display()
//		{
//			cout << name << endl;
//			Gamm.display();
//			if (beta != NULL)
//				beta->display();
//		}
//};
//
//class Delta : public Alpha
//{
//	private:
//		string desc;
//
//	public:
//		Delta(string a_name, string a_desc, int a_part, char a_id) : Alpha(a_name, a_part, a_id), desc(a_desc) {}
//		
//		void display()
//		{
//			Alpha::display(); cout << desc << endl;
//		}
//};
//
//int main()
//{
//	Delta d("DDDDD", "John", 5, 'A');
//
//	d.setBeta(50000);
//	d.display();
//	return 0;
//}

#include <iostream>

using namespace std;

void myFunction(int value)
{
	if (value < 128)
	{
		int temp;
		temp = value + value;
		cout << "I got here" << endl; myFunction(temp);
	}
}
int main()
{
	myFunction(2);
	return 0;
}