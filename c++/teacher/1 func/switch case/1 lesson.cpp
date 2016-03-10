#include <iostream> //библа нужна для cout cin функций вывода - ввода

using namespace std;



int main()
{
  std::cout << "Enter a number:  ";
  // std::cin >> input;
  char port = 's';

  switch (port) //читаем переменную (по 1 символу) с порта
      { 
        case 'w':
        {
          std::cout << "w";
          brake();
        }
      
        case 's':
        {
          std::cout << "s";
          brake();
        }
      
        case 'b':
        { 
          std::cout << "b";
          brake();
        }
          
        case 'd':
        { 
          std::cout << "d";
          brake();
        }
        case 'a':
        { 
          std::cout << "a";
          brake();
        }
      } 

  return 0;
}
