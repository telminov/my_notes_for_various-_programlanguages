echo "Я надеюсь вы запустили скрипт от админа ^^ "
echo "Добро пожаловать в установку всякого шлака для работы вашего танчика"
echo "Введите имя пользователя вашей распбери" 

read NAME
echo "Господин, " $NAME ", как ваши дела?"

sudo apt-get update
sudo apt-get upgrade

sudo apt-get install  htop docker python-dev python-setuptools ipython ipython-notebook python-nose python-sympy 
git python-virtualenv virtualenvwrapper python-pip openjdk-7-jdk nano gedit
zsh npm nodejs libzmq-dev scrot ansible &&

# установка прав вашему пользователю для работы с ардуинкой
sudo apt-get install arduino && sudo usermod -a -G tty $USER && sudo usermod -a -G dialout $USER &&

# для виртауленва (при пользовании bash - не обязательно)#
# .bashrc  и .zshrcе
cd ~ &&
export WORKON_HOME=$HOME/.virtualenvs &&
export PROJECT_HOME=$HOME/Devel &&
source /usr/local/bin/virtualenvwrapper.sh &&

# install python3.5.1  под судо
sudo apt-get install libssl-dev openssl &&
cd /opt &&
wget https://www.python.org/ftp/python/3.5.1/Python-3.5.1.tgz &&
tar -xzvf Python-3.5.1.tgz &&
rm Python-3.5.1.tgz &&
cd Python-3.5.1 &&
./configure --prefix=/usr/bin/python3.5.1 && # /usr/local/lib/python3.5 иначе установит в эту директорию
# sudo find / 3.5.1 -type d -name 'python3.5'  - способ найти куда меня установили
make 
sudo make install
cd .. && rm -rf Python-3.5.1

# виртуальное окружение
mkvirtualenv

###########################
sudo apt-get install python python-tk idle python-pmw python-imaging

###########################
echo "Вроде все ок"

