# FUNCTIONS
square = (x) -> x*x
cube = (x) -> square(x) * x


fill = (container, liquid = "coffee") ->
  #if (liquid == null) { liquid = "coffee";}
  "Filing the #{container} with #{liquid} " #return "Filling the " + container + " with " + liquid +...

# LIST
bitlist = [
  1, 0, 1,
  0, 0, 1,
  1, 1, 0,
]
# DICT
a =                 #a = {
  b: [10, 20, 30]         # b: [10, 20]
  vanya: "Ivan"
  fedya:                  #vanya: {name: "Max", age: 11},
    name: "Fedor"
    age: 8            #}

yearsOld = max: 10, ida: 9, tim: 11

#
$('.account').attr class: 'active'  #$('.account').attr({  "class": 'active' });
console.log(object.class)
console.log object.class  #TODO какой правильный
#log object.class TODO красным мигает  #log(object["class"]);

other = 1
changeNumbers = -> #  return outer = 10;
  inner = -1
  other = 10  #return outer = 10;

# IF ELSE UNLESS
mood = greatlyImproved if singing

if happy and knowsIt #if (happy && knowsIt) {
  clapsHands()
  chaChaCha()
else
  showIt()

date = if friday then sue else jill   #date = friday ? sue : jill;

healthy = 200 > cholesterol > 60

# Splats...  variable numbers of arguments.
awardMedals = (first, second, others...) -> # awardMedals = function() {
                    # var first, others, second;
                    # first = arguments[0], second = arguments[1],
                    # others = 3 <= arguments.length ? slice.call(arguments, 2) : [];
                    # gold = first; silver = second; return rest = others;};
  gold   = first
  silver = second
  rest   = others

# LOOPS
eat(food)    for food in ['toast', 'cheese', 'wine'] # or eat(food)

menu(i + 1, dish)    for dish, i  in courses

eat(food)    for food in foods     when food isnt 'chocolate'


countdown = (num for num in [10..1]) # return [10, 9, 8, .. 1]
alert(num) for num in [10..1]

evens = (x for x in [0..10] by 2)  # [0, 2, 4]

yearsOld = max: 10, ida: 9, tim: 11

ages = for child, age of yearsOld  # loop for dict
  "#{child} is #{age}"  # as a function of this


# while
if this.studyingEconomics
  buy()  while supply > demand
  sell() until supply > demand #  while (!(supply > demand))

num = 6
lyrics = while num -= 1 #5 - 1
  num

#LOOP do
list = [1,3,4,5]
for filename in list
  do (filename) ->
    alert filename

# SLICE
numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9]

start   = numbers[0..2] # start = numbers.slice(0, 3);
middle  = numbers[3...-2] #[4-7]
end     = numbers[-2..]  #[8.9]
copy    = numbers[..] #

# ELIF ELSE IF
grade = (student) ->
  if student.excellentWork
    "A+"
  else if student.okayStuff #  } else if (student.okayStuff) {
    if student.triedHard then "B" else "B-"
  else
    "C"

eldest = if 24 > 21 then "Liz" else "Ike" #eldest = 24 > 21 ? "Liz" : "Ike";

#
six = (one = 1) + (two = 2) + (three = 3)  # var one,six,three,two;   six = (one = 1) + (two = 2) + (three = 3);

globals = (name for name of window)[0...10]

#capture error
alert(
  try
    nonexistent / undefined
  catch error #} catch (error1) {
    "And the error is ... #{error}"
)

# MATCH
-7 % 5 == -2 # The remainder of 7 / 5

#CoffeeScript	          JavaScript
#is	                    ===
#isnt	                  !==
#not	                  !
#and	                  &&
#or	                    ||
#true,  yes, on	        true
#false, no, off	        false
#@, this	              this
#of	                    in
#in	                    no JS equivalent
#a ** b	                Math.pow(a, b)
#a // b	                Math.floor(a / b)
#a %% b	                (a % b + b) % b

launch() if ignition is on  # if (ignition === true) {

volume = 10 if band isnt SpinalTap

letTheWildRumpusBegin() unless answer is no   # if (answer !== false) {

if car.speed < limit then accelerate()

winner = yes if pick in [47, 92, 13]

print inspect "My name is #{@name}"

# CLASS
class Animal
  constructor: (@name) -> #assign @name

  move: (meters) -> # Animal.prototype.move = function(meters) {
    alert @name + " moved #{meters}m."

class Snake extends Animal
  move: ->
    alert "Slithering..."
    super 5

class Horse extends Animal
  move: ->
    alert "Galloping..."
    super 45

sam = new Snake "Sammy the Python"
tom = new Horse "Tommy the Palomino"
sam.move()
tom.move()

class Person
  constructor: (options) ->
    {@name, @age, @height = 'average'} = options

tim = new Person name: 'Tim', age: 4

# SWITCH
theBait   = 1000
theSwitch = 0
[theBait, theSwitch] = [theSwitch, theBait]

# list VARIABLES assign
[city, temp, forecast] = [1, "Berkeley, CA", 3]


Account = (customer, cart) ->
  @customer = customer
  @cart = cart

  $('.shopping_cart').on 'click', (event) =>  #$('.shopping_cart').on('click', (function(_this) {
    @customer.purchase @cart

# SWITCH KEY
switch day                        #switch (day) {
  when "Mon" then go work             #case "Mon": go(work); break;
  when "Tue" then go relax
  when "Thu" then go iceFishing
  when "Fri", "Sat"
    if day is bingoDay
      go bingo
      go dancing
  when "Sun" then go church
  else go work                    # default:

score = 76
grade = switch              #grade = (function() {switch (false) {
  when score < 60 then 'F'  #case !(score < 60):
  when score < 70 then 'D'
  when score < 80 then 'C'
  when score < 90 then 'B'
  else 'A'

#TRY CATCH FINALLY
try
  allHellBreaksLoose()
  catsAndDogsLivingTogether()
catch error
  print error
finally
  cleanUp()


# ITS FOR ME !!!!!!!!!!!!!!!!!!!!! can use js in coffee
hi = `function() {
  return [document.title, "Hello JavaScript"].join(": ");
}`

#html = "<strong>\n  cup of coffeescript\n</strong>";
html = """
       <strong>
         cup of coffeescript
       </strong>
       """

mobyDick = "Call me Ishmael. Some years ago --
  never mind how long precisely -- having little
  or no money in my purse, and nothing particular"
#mobyDick = "Call me Ishmael. Some years ago -- never mind how long precisely -- having little ..."

###                                                 /*
SkinnyMochaHalfCaffScript Compiler v1.0
Released under the MIT License
###                                            #    */

#Block Regular Expressions
OPERATOR = /// ^ (     # OPERATOR = /^(?:[-=]>|[-+*\/%<>&|^!?=]=|>>>=?|([-+:])\1|([&|<>])\2=?|\?\.|\.{2,3})/;
  ?: [-=]>             # function
   | [-+*/%<>&|^!?=]=  # compound assign / compare
   | >>>=?             # zero-fill right shift
   | ([-+:])\1         # doubles
   | ([&|<>])\2=?      # logic / shift
   | \?\.              # soak access
   | \.{2,3}           # range or splat
   ) ///