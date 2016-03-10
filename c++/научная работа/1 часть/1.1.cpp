#include <stdio.h>
#include <string>

//#include "stdafx.h"
#include <iostream>
#include <cstdio> //или stdafx.h

int Matr[4][5] = {
				  {0, 0, 0, 0, 0},
				  {0, 1,-1, 2, 3},
				  {0, 5,-7, 9, 9},
				  {0,-3, 4, 1, 2},
				  {0,-2, 1, 2, 3},
				  {0, 5, 3, 1, 5}
} ;

int Alphavit[4], Stroka[5], M, i, j, k;

// char alph_string[5], in_string[10];

    print("vvedite vash alphavit \n")
    for (int i=1; i<=4; i++)
        cin>>Alphavit[i]; // 1, 2, 3, 4
        
    printf("vvod stroki w \n");
    for (int i=1; i<=4; i++)
		cin>>Stroka[5] // 1,2,1,4,3 из нашего условия

    printf("idet podchet M = ")
    M = 0;
    for (int j=1; j<=5; j++)
		M = M + Matr[Stroka[j], j];
    cout << M;



