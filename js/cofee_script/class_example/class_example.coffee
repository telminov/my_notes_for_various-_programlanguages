class Animal

    constructor: (@name, @age) ->

    voice: ->
        console.log 'HI im' + @name

    move: (x) ->
        console.log x
        @x = x

    alert_x: ->
        console.log @x
        this.voice()

animal = new Animal('Petya', 10)
console.log animal
animal.voice()
animal.move(12)
animal.alert_x()


class Cat extends Animal

    meyou: ->
        alert 'my_name is' + @name

cat = new Cat('Vasya', 100500)
cat.meyou()
cat.move(123)

class Person
  constructor: (options) ->
    {@name, @age, @height = 'average'} = options

class Person
    constructor: (options) ->
        {@name, @age, @height='100300'} = options

tim = new Person name: 'Tim', age: 4
console.log tim

timy = new Person(name: 'Timy', age: 4, height: 12)
console.log timy

# TODO BAD
Account = (customer, cart) ->
  @customer = customer
  @cart = cart
  voice: ->
    console.log(123)

ac = Account(12, 32)
console.log(ac)
console.log(ac.voice())

