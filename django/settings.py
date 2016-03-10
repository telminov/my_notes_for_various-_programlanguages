# -*- coding: utf8 -*-
# Django settings for mis_lmk project.

from settings_default import *
import sys
DEBUG = True
# переменная для работы в режиме локальной/стационарной системы. true, для выездов, false для стационара
STAND_ALONE = False

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'mis_mm',
        'USER': 'root',
        'HOST': 'localhost',
        'PORT': None,
        'PASSWORD': '1',
        'CHARSET': 'utf8',
        'TEST_CHARSET': 'utf8',
        'OPTIONS': {'init_command': 'SET storage_engine=MyISAM'},
    },
    'report_replica': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'mis_mm',
        'USER': 'root',
        'HOST': 'localhost',
        'PORT': None,
        'PASSWORD': '1',
        'CHARSET': 'utf8',
        'TEST_CHARSET': 'utf8',
        'OPTIONS': {'init_command': 'SET storage_engine=MyISAM'},
    },
    'dump_replica': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'mis_mm',
        'USER': 'root',
        'HOST': 'localhost',
        'PORT': None,
        'PASSWORD': '1',
        'CHARSET': 'utf8',
        'TEST_CHARSET': 'utf8',
        'OPTIONS': {'init_command': 'SET storage_engine=MyISAM'},
    },
}
# настройки коннекта к MongoDB
MONGODB = {
    'NAME': 'mis_mm',
    'HOST': 'localhost',
    'PORT': None,
    'USER': None,
    'PASSWORD': None,
}

import mongoengine
mongoengine.connect(MONGODB['NAME'], host='mongodb://%s/%s' % (MONGODB['HOST'], MONGODB['NAME']))
mongoengine.register_connection('local', MONGODB['NAME'], host='mongodb://%s/%s' % ('localhost', MONGODB['NAME']))

# if 'test' in sys.argv:
#     DATABASES = {
#         'default': {
#         'ENGINE': 'django.db.backends.sqlite3',
#         'NAME': 'test_db'
#         }
#     }
if 'test' in sys.argv:
    DATABASES = {
        'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'test_db',
        'USER': 'root',
        'HOST': 'localhost',
        'PORT': None,
        'PASSWORD': '1',
        'CHARSET': 'utf8',
        'TEST_CHARSET': 'utf8',
        'OPTIONS': {'init_command': 'SET storage_engine=MyISAM'},
        }
    }

# путь к утилитам mysql
MYSQL_BIN_PATH = '/usr/bin/'
MYSQLDUMP_PATH  = MYSQL_BIN_PATH + 'mysqldump'
MYSQL_PATH      = MYSQL_BIN_PATH + 'mysql'

# путь к программе gzip/gunzip
GZIP_PATH = '/bin/gzip'
GUNZIP_PATH = '/bin/gunzip'

FOP_PATH = '/home/mis_mm/fop-1.0'

MC_ID = 2   # идентификатор мед центра
IS_DELIVERY_MASTER = False  # осуществлет ли мед центр доставку

# настройки аттестации
FGUZ_CODE = u'МЦ-8'
FGUZ_ID = 24
# минимальное и максимальное значение регистрационного номера для данной инсталляции
FGUZ_MIN_REG_NUM = 0
FGUZ_MAX_REG_NUM = 499999
#ID клиентов ФГУЗа
FGUZ_MIN_LMK_CLIENT_ID = 0
FGUZ_MAX_LMK_CLIENT_ID = 499999
# Человек ФБУЗ, ставящий подписи на бланке ЛМК
FGUZ_MEN = 'ФГУЗМЕН Т.Т.'

# формат печати бланка ЛМК. Поддерживаются два формата 'format1' и 'format2'
LMK_BLANK_PRINT_FORMAT = 'format1'

SMS_LOGIN = 'mobilmed'
SMS_PASSWD = ''

# настройки для печати справки 086
CERT086 = {
    'dermatologist': {
        'lname': u'Мартыленко',
        'fname': u'Наталия',
        'mname':  u'Петровна',
        },
    'phthisiatrician': {
        'lname': u'Палоцкая',
        'fname': u'Лилия',
        'mname':  u'Ивановна',
        },
    'expert_in_narcology': {
        'fname': u'Акмеев',
        'lname': u'Константин',
        'mname':  u'Рафаилович',
        },

    'chief_doctor': u'Мачикин В.П.',
}
