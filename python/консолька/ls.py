import os

os.listdir('/home')
#or
os.listdir('.')

#or
a = os.listdir('.')

for b in a:
    print b

#or
import subprocess
n = subprocess.Popen(['ls'])

