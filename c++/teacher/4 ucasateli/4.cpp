#include <iostream>

int main()
{

 int a = 123;
 int *b = &a;
 //int c = *b;
 int *c = b;
 *c = 1232;
 std::cout << c << "\n";  // a in memory
 std::cout << a; //1232

 return 0;
}
