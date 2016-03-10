1 cin>>str;  // вводы chara
2 cin.getline(str,nChars);
3 для std::string
4 getline(cin,str);

В следующем примере все элементы массива будут выведены на экран без использования индексов (обратите внимание, что при этом параметры цикла могут быть любыми, лишь бы цикл выполнился нужное количество раз)  
int ar[] = {-72, 3, 402, -1, 55, 132}; //соединяем два массива, например индексируем его значения
int* p = ar;
for (int i=101; i<=106; i++) {
 cout << *p << ' ';
 p++;  // интересно, чем равно было p  и что это вообще получиться
}  // массив или нет


integer Alph_index[4], String_index;
int main(int argc, char* argv[]){
    char alph[5]; // всего 4 символа - конечный символ нуль, машино

    cin>>alph;
    char* alph_index_c = alph;// 
	char min;
//над попробовать с min
    сhar min = alph_index_c; //кладется адресс самого первого символа  
    int i = 0;
    while(*alph_index_c != '\0') {
   	 c = alph_index_c;
	 c = c - min; // удастся ли?  числа в 16-ой системе должны быть
   	 Alph_index[i] = atoi(c);//записываем в массив индекс полученный из разности адресов
	 alph_index_c ++;
	 i++
}

     char string[6]; // всего 5 символов (например)
     int string_index[5];
	
     cin>>string;
     for (int i=1;i<=5; i++)
		for (int j=1; j<=4; j++)
			 if string[i] = alph[j]
				String_index[i] = Alph_index[j];

     // A -1, C-3, A-1, F-4, B-2
  // в стринг_индекс: 1, 3, 1, 4, 2 - именно эти индексы потом понадобятся для работы
}

//
int pow( int val, int exp )
{
   for ( int res = 1; exp > 0; --exp )
         res = res * val;
   return res;
}
