div = document.createElement('div')
div.className = "alert alert-success"
div.innerHTML = "<strong>good!</strong> HELLO"

document.body.appendChild(div)

textElem = document.createTextNode('Тут был я')
document.body.insertBefore(textElem, document.body.firstChild) #TODO


newLi = document.createElement('li')
newLi.innerHTML = 'Привет, мир!'
_ol = document.getElementById("_ol") || get.getElementsByTagName('ol') #document.getElementsByClassName('list')
console.log _ol
_ol.appendChild(newLi);
_ol.insertBefore(newLi, _ol.children[2]) #inster in begin


#создать копию узла
div2 = div.cloneNode(true)
#копию можно подправить
div2.querySelector('strong').innerHTML = 'Супер!'
#вставим её после текущего сообщения
div.parentNode.insertBefore(div2, div.nextSibling)


li = _ol.getElementsByTagName('li')
console.log li
li_2 = document.createElement('li')
li_2.innerHTML = 'Hello'
_ol.removeChild(li[0])
_ol.replaceChild(li_2, li[2])


first = document.body.children[0]
last = document.body.children[1]

#нет необходимости в предварительном removeChild(last)
document.body.insertBefore(last, first) # поменять местами

#поиск элементов
li = document.getElementsByTagName('ol')[0].getElementsByTagName('li')[0]
console.log li
#document.getElementsByName   form, input, a, select, textarea

#Методы для создания узлов:

#document.createElement(tag) – создает элемент
#document.createTextNode(value) – создает текстовый узел
#elem.cloneNode(deep) – клонирует элемент, если deep == true, то со всеми потомками, если false – без потомков.
#Вставка и удаление узлов:
#
#parent.appendChild(elem)
#parent.insertBefore(elem, nextSibling)
#parent.removeChild(elem)
#parent.replaceChild(newElem, elem)
#Все эти методы возвращают elem.



