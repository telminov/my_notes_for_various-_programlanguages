// не включаю iostream ибо он есть в cat.hpp
#include "cat.hpp"

Cat::Cat(int initialAge) { itsAge=initialAge; }

Cat::~Cat() {}

int main() {
  Cat Frisky(5);
  Frisky.Meow();
  std::cout <<"\n Frisky age:" <<Frisky.GetAge();

  return 0;
}
