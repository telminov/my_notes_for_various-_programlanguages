#include <iostream> //библа нужна для cout cin функций вывода - ввода

using namespace std;

int Doubler(int AmountToDouble); //обычная функция
inline int DoublerInline(int); //встраиваемая

int main()
{
  int result = 0;
  int input;

  std::cout << "Enter a number:  ";
  std::cin >> input;

  result = Doubler(input);

  std::cout << "\n Im getted  " << result <<"\n";

  void OneFunc(int result);
  OneFunc(result);

  return 0;
}

int Doubler(int original)
{
  if (original <= 1000)
    return original * 2;
  else
    return -1;
}

int DoublerInline( int number )
{ //т.е. функция, которая как бы будет записываться в то место, где ее вызвали для быстроты
  return 2*number;
}

void OneFunc(int vlaue)
{
	std::cout << "void func";
}