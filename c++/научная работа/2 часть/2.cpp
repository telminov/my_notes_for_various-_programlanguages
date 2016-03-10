#include <stdio.h>
#include <string>

//#include "stdafx.h"
#include <iostream>
#include <cstdio> //или stdafx.h

integer Matr[4, 5] =[
				  {0, 0, 0, 0, 0},
				  {0, 1,-1, 2, 3},
				  {0, 5,-7, 9, 9},
				  {0,-3, 4, 1, 2},
				  {0,-2, 1, 2, 3},
				  {0, 5, 3, 1, 5}
	 ] ;

integer Alphavit[4], Stroka[5], i, j, k;
string alphavit;
string str, p;
// char alph_string[5], in_string[10];

    print("vvedite vash alphavir \n")
    for (i = 1, 4, i++)
        cin>>Alphavit[i]; // 1, 2, 3, 4
        
    printf("vvod stroki w \n");
    for (i = 1, 5, i++)
	cin>>Stroka[5] // 1,2,1,4,3 из нашего условия

    printf("idet podchet M = ")
    M = 0;
    for (j = 1, 5, j++)
	M = M + Matr[ Stroka[j], j];
    cout << M;

//2-я часть
//1, поиск максимального значения и количество мотивов для него
int k = 0;
int max = 0;
int Matr_motivov[4,5] // найду матрицу мотивов

int d = 0;//для матрицы мотивов
for ( i = 1, 4, i++)
	int d = 1; //для матрицы мотивов
	maxi = Matr[i,1];
	Matr_motivov[d,1] = 1; 
	k = k + k_max;// нахождение кол-ва мотивов
	k_max = 0;



//первый фор для поиска максимума
    for (j = 2, 5, j++) {
	if Matr[i,j] > max{
	   max = Matr[i,j];
	   Matr_motivov[d,j] = j;}// если вдруг максимума не будет
                     // или просто как запись певого варианта из мотивов для 
               //данной строки!!!
         
        if Matr[i,j] = max{
	   k_max++; 
}
//если k_max больше 0, то надо будет записать еще мотивы

        if k_max > 0
	    { 
  //фор для добавления элементов перед нашим значением (смотреть листочек)
  // то что подчеркнуто - переносим 
	   d++;
	   for (m = 1, j, m++)
		Matr_motivov[d,m] = Matr_motivov[d-1,m];

//второй фор для поиска нескольких мотивов для этого максимума( если таковые есть)
            for (j = 1, 5, j++) 
}
                 if Matr[i,j] = max{
	          Matr_motivov[i,j] = j; 
}



