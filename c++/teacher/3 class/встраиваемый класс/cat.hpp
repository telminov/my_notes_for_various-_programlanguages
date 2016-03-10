#include <iostream>

class Cat
{
public:
  Cat(int initialAge);
  ~Cat();
  int GetAge() { return itsAge; }
  void SetAge(int age) { itsAge = age; }
  void Meow() { std::cout<<"\nMeow\n"; }
private:
  int itsAge;
};
