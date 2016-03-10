Простейший пример запроса:

function addScript(src) {
  var elem = document.createElement("script");
  elem.src = src;
  document.head.appendChild(elem);
}

addScript('user?id=123');
Такой вызов добавит в <head> документа тег:

<script src="/user?id=123"></script>
