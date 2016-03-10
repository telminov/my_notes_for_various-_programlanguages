# -*- coding:utf-8 -*-

massiv = ['а', 'б', 'в', 'г', 'д', 'е', 'ё']

phrase = 'абав'
key = 'баба'

def get_shifr(massiv, phrase, key):
    index_key = 0 # index
    shifr_text = ''
    for i in range(len(phrase)-1):
        if index_key >= len(key) - 1:
            index_key = 0

        index_letter_in_massiv = i #letter буква
        letter = massiv[i]
        shifr_text += massiv[i]

    return None


def get_index_and_letter_in_massiv_for_letter(index_phrase, phrase, massiv):
    for letter in massiv:
        if phrase[index_phrase] == letter:
            
            return letter,

def get_rashifr():
    return None

