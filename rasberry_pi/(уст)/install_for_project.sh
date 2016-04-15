#!/bin/bash

echo "Я надеюсь вы запустили скрипт от админа ^^ "
echo "Добро пожаловать в установку всякого шлака для работы вашего танчика"
echo "Введите имя пользователя вашей распбери" 

read NAME
echo "Господин, " $NAME ", как ваши дела?"

apt-get update
apt-get -y --force-yes dist-upgrade
# apt-get upgrade  # старая версия

PACKAGES="htop docker python-dev python-setuptools ipython ipython-notebook python-nose python-sympy 
git python-virtualenv virtualenvwrapper python-pip openjdk-7-jdk nano gedit
zsh npm nodejs libzmq-dev scrot ansible python python-tk idle python-pmw arduino python-imaging libssl-dev openssl" 

apt-get -y --force-yes install $PACKAGES

# ----------старая версия
#apt-get install  htop docker python-dev python-setuptools ipython ipython-notebook python-nose python-sympy 
#git python-virtualenv virtualenvwrapper python-pip openjdk-7-jdk nano gedit
#zsh npm nodejs libzmq-dev scrot ansible  &&

# установка прав вашему пользователю для работы с ардуинкой apt-get install arduino && 
usermod -a -G tty $USER  usermod -a -G dialout $USER 

# для виртауленва (при пользовании bash - не обязательно)#
# .bashrc  и .zshrcе
cd ~ 
export WORKON_HOME=$HOME/.virtualenvs 
export PROJECT_HOME=$HOME/Devel 
source /usr/local/bin/virtualenvwrapper.sh 

# install python3.5.1  под судо ----------------------------------
# cd /opt 
# wget https://www.python.org/ftp/python/3.5.1/Python-3.5.1.tgz 
# tar -xzvf Python-3.5.1.tgz 
# rm Python-3.5.1.tgz 
# cd Python-3.5.1 
# ./configure --prefix=/usr/bin/python3.5.1 # /usr/local/lib/python3.5 иначе установит в эту директорию
# sudo find / 3.5.1 -type d -name 'python3.5'  - способ найти куда меня установили
# make 
# make install
# cd .. 
# rm -rf Python-3.5.1

# виртуальное окружение
# mkvirtualenv

# ------------------pyenv  install python
git clone git://github.com/yyuu/pyenv.git ~/.pyenv &&
mkdir -p ~/.pyenv/plugins &&
git clone git://github.com/yyuu/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv &&
git clone git://github.com/yyuu/pyenv-virtualenvwrapper.git ~/.pyenv/plugins/pyenv-virtualenvwrapper &&
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc &&
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc &&
echo 'eval "$(pyenv init -)"' >> ~/.bashrc &&
#bash && ###############################__________________________________когда перезагружает консольку остальные действия могу не производится
. ~/.bashrc &&
pyenv install 3.5.1 && 
pyenv virtualenv 3.5.1 myenv3.5.1 && #  вирт окружение myenv3.5.1
pyenv local myenv3.5.1


 || echo 'Ошибка pyenv пожалуйста сделайте pyenv install 3.5.1!'


echo "ПОЛУ КЛЮЧИК ssh"
ssh-keygen &&
cat ~/.ssh/id_rsa.pub 


###########################
echo "Вроде все ок"

