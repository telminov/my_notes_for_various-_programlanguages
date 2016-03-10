login = raw_input("Enter your name: ")

try:
    gogo = open ("/home/nicking/helloworld","a")
except:
    gogo = open ("/home/nicking/helloworld","w")

gogo.write("Hello, world!")
gogo.write(login)
gogo.close()
