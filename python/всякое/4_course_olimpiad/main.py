# -*- coding:utf-8 -*-
from __future__ import print_function

import os


CURENT_DIR = os.path.dirname(__file__)


def function_input():
    pass

def dir(list_tomov):
    for srtoka in list_tomov:
        print(srtoka)

def main():

    File = open('{0}/library/{1}'.format(CURENT_DIR, "INPUT.txt"), 'r')

    list_tomov = []
    for y, line in enumerate(File.readlines()):
        list_tomov.append(line)

    current_tom = list_tomov[0]
    print ('Привет\n')

    while(True):
        print ('{0}>'.format(current_tom))
        command = raw_input()
        if command == 'DIR':
            dir(list_tomov)
        elif command.startswith('VOLUME'):
            tom = command.split(' ')[1]
            current_tom = tom
            print (current_tom)
        elif command.startswith('LIST'):
            print(current_tom)
            tom = command.split(' ')[1]
            list_glav = []
            tom_file = open('{0}/library/{1}.txt'.format(CURENT_DIR, current_tom[0]), 'r')
            for line in tom_file:
                list_glav.append(line.split(' ')[0])
            dir(list_glav)
        elif command.startswith('TYPE'):
            tom_name = command.split(' ')[1]
            statya_name = command.split(' ')[2]

            tom_file = open('{0}/library/{1}.txt'.format(CURENT_DIR, current_tom[0]), 'r')
            for y, line in enumerate(tom_file.readlines()):
                if line.startswith(statya_name):
                    print (line.split(' ')[0] + ' - ' + line.split(' ')[1])

        elif command == 'REF':
            tom_name = command.split(' ')[1]
            statya_name = command.split(' ')[2]

            tom_file = open('{0}/library/{1}.txt'.format(CURENT_DIR, tom_name), 'r')
            for y, line in enumerate(tom_file.readlines()):
                if line.startswith(statya_name):
                    print (line.split(' ')[0] + ' - ' + line.split(' ')[1])
        elif command == 'CLS':
            os.system('clear')
        elif command == 'VERIFY':
            pass
        elif command == 'EXIT':
            SystemExit()





if __name__ == '__main__':
    main()































