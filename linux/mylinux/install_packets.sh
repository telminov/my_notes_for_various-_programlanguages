#!/bin/bash
echo "Я надеюсь вы запустили скрипт от админа ^^ "
echo "Добро пожаловать в установку всякого шлака для работы вашего танчика"
echo "Введите имя пользователя" 

read NAME
echo "Господин, " $NAME ", как ваши дела?"

apt-get update 
apt-get -y --force-yes dist-upgrade 

PACKAGES="htop docker python-dev python-setuptools ipython ipython-notebook python-nose python-sympy arduino 
git python-virtualenv virtualenvwrapper python-pip openjdk-7-jdk nano gedit python python-tk idle python-pmw python-imaging
zsh npm nodejs libzmq-dev scrot ansible python python-tk idle python-pmw arduino python-imaging libssl-dev openssl 
libgdal-dev dh-autoreconf htop docker gdal-bin python-numpy python-scipy liblapack-dev libatlas-dev python-dev python-setuptools gfortran python-pandas python-matplotlib ipython ipython-notebook python-nose python-sympy curl tree postgresql postgresql-server-dev-9.3 postgresql-client libblas-dev nginx nginx-full terminator git git-core git-flow python-virtualenv virtualenvwrapper python-pip subversion openjdk-7-jdk nano build-essential protobuf-compiler libprotobuf-dev python-pip python-dev virtualenvwrapper zsh mysql-client npm nodejs sublime-txt gconf-editor supervisor libzmq-dev scrot mysql-server phpmyadmin make libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev" 

apt-get -y --force-yes install $PACKAGES

############################################
usermod -a -G tty $NAME 
usermod -a -G dialout $NAME
########################################
# npm install -g coffee-script
# npm install --save coffee-script
###########################
cd ~
# .bashrc  и .zshrcе
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel
source /usr/local/bin/virtualenvwrapper.sh
###########################
# не забудь
# skype, teamviewer
