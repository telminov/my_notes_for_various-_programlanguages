#!/bin/bash
# Первая строка скрипта - это shebang, который сообщает системе, как исполнять
# https://learnxinyminutes.com/docs/ru-ru/bash-ru/

echo Hello world!

# Отдельные команды начинаются с новой строки или разделяются точкой с запятой:
echo 'Это первая строка'; echo 'Это вторая строка'; echo

# Вот так объявляется переменная:
VARIABLE="Просто строка"
# Использование переменой:
echo $VARIABLE; echo
# echo "$VARIABLE"
# echo '$VARIABLE'
# Когда вы используете переменную - присваиваете, экспортируете и т.д. -

# Подстановка строк в переменные вместо прсто  будет Lol
echo ${VARIABLE/Просто/LoL} ; echo

# прикольные штучки
echo "Последнее возвращенное значение: $?"
echo "PID скрипта: $$"
echo "Количество аргументов: $#"
echo "Аргументы скрипта: $@"
echo "Аргументы скрипта, распределённые по отдельным переменным: $1 $2..."

# Чтение аргументов из устройста ввода:
echo "Как Вас зовут?"
read NAME # Обратите внимание, что нам не нужно определять новую переменную
echo Привет, $NAME!

echo $USER; echo
# У нас есть обычная структура if:
if [ $NAME -ne 'nic' ]
then
    echo "Имя не совпадает с именем пользователя"
else
    echo "Имя совпадает с именем пользователя"
fi

# ||-или &&-и
echo "Исполнится всегда" || echo "Исполнится, если первая команда завершится ошибкой"
echo "Исполнится всегда" && echo "Исполнится, если первая команда выполнится удачно"
# if [ $NAME == "Steve" ] && [ $AGE -eq 15 ] как примерчик


python hello.py < "input.in"
python hello.py > "output.out"
python hello.py 2> "error.err"
python hello.py > "output-and-error.log" 2>&1
python hello.py > /dev/null 2>&1
# Поток ошибок перезапишет файл, если этот файл существует,
# поэтому, если вы хотите дописывать файл, используйте ">>":
python hello.py >> "output.out" 2>> "error.err"

# запист hellorowld в output.out
echo "#helloworld" > output.out

for VARIABLE in {1..3}
do
    echo "$VARIABLE"
done

for OUTPUT in $(ls)
do
    cat "$OUTPUT"
done

while [ true ]
do
    echo "тело цикла здесь..."
    break
done

# функции
function foo ()
{
    echo "Аргументы работают также, как аргументы скрипта: $@"
    echo "и: $1 $2..."
    echo "Это функция"
    return 0
}

# или просто
bar ()
{
    echo "Другой способ определить функцию!"
    return 0
}

# Вызов функции
foo "Мое имя" $NAME

# заменить каждое 'okay' на 'great' в файле file.txt (regex поддерживается)
sed -i 's/okay/great/g' file.txt

# этот пример выводит строки, которые начинаются на "foo" и оканчиваются "bar"
grep "^foo.*bar$" file.txt
# передайте опцию -c чтобы вывести число строк, в которых совпал шаблон
grep -c "^foo.*bar$" file.txt
# чтобы искать по строке, а не шаблону regex, используйте fgrep (или grep -F)
fgrep "^foo.*bar$" file.txt 

