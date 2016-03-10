#include <iostream>

//целое без знака unsigned int
class Cat
{
public: //открытые переменные , иначе закрытые
	void Meow(); //функцие не надо ни чего возвращать - void
	int GetAge();
	int setAge(int age);
private:
	int itsAge;
};

int Cat::GetAge()
{
	return itsAge;
}
int Cat::setAge(int age)
{
	itsAge = age;
}
void Cat::Meow()
{
	std::cout << "\n Meow ^^ .\n";
}


//теперь делаю класс Catty у которого будет конструктор и деструктор
//отличие от класса Cat только в строчке выше
//в main() покажу как использовать
class Catty
{
public: //открытые переменные , иначе закрытые
	Catty(int initialAge); //конструктор
	~Catty(); //деструктор

	void Meow(); //функцие не надо ни чего возвращать - void
	int GetAge();
	int setAge(int age);
private:
	int itsAge;
};

Catty::Catty(int initialAge){ //тот самый конструктор
	itsAge = initialAge;
}
Catty::~Catty() //деструктор не делает ни чего
{}

int Catty::GetAge()
{
	return itsAge;
}
int Catty::setAge(int age)
{
	itsAge = age;
}
void Catty::Meow()
{
	std::cout << "\n  Meow ^^ I'm Catty .\n";
}


int main()
{
	//обычный класс Cat
	Cat Frisky;
	Frisky.setAge(7);
	Frisky.Meow();
	std::cout << "\n Cat yars : "<<Frisky.GetAge();
	Frisky.Meow();

	std::cout << "\n \n";

	//класс с конструктором и деструктором Catty
	Catty Malinka(171);
	Malinka.Meow();
	std::cout << "\n Catty yars : "<<Malinka.GetAge()
						<<"seted age ";
	Malinka.setAge(7);
	std::cout << "\n Cat yars when we use setAge(): "<<Malinka.GetAge();
	Malinka.Meow();

	return 0;
}
