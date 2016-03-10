#include <iostream>

//операторы and - &&  or - ||   not - !
int main()
{
	int counter = 0;

	std::cout <<"\n  while\n ";

	while (counter < 5){
		counter ++;
		std::cout <<'\n'<<counter;
		//можно испольщовать  break  или continue
	}

	std::cout <<"\n \n do while \n ";
	do
	{	
		counter --;
		std::cout <<'\n'<<counter;

	}
	while (counter >0);

	std::cout <<"\n\n  for \n  ";
	for (int i=0; i<5; i++)
	{
		std::cout <<'\n'<<i;
	}

	//бесконечный цикл
	std::cout <<"\n\n  for beskonechniy \n  ";
	for (;;){
		counter ++;
		if (counter%2==0){std::cout << counter <<" ";}
		if (counter == 400) { break;}
	}

	std::cout <<"\n\n  vvedite chislo dla switch  0 or 1  \n  ";
	int number;
	std::cin >> number;
	switch (number)
	{
		case 0:
			std::cout <<"\n nu kak to 0";
			break;
		case 1:
			std::cout <<"\n nu kak to 1";
			break;
		default:
			std::cout <<"\n nu kak to default";
			break;
	}
	return 0;
}