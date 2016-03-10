    <input value="Запрос мне!" onclick="send_request()" type="button" />

<script>
// javascript-код голосования из примера
function send_request() {
	// (1) создать объект для запроса к серверу
	var req = getXmlHttp();
	req.onreadystatechange = function() {
        // onreadystatechange активируется при получении ответа сервера
		if (req.readyState == 4) {
			if(req.status == 200) {
                 // если статус 200 (ОК) - выдать ответ пользователю
				alert("Ответ сервера: "+req.responseText);
			}
			// тут можно добавить else с обработкой ошибок запроса
		}
	};

       // (3) задать адрес подключения
	req.open('GET', '{{ map_url }}', true);
	//client . open(method, url [, async = true [, username = null [, password = null]]])
	    //req.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
        // (4)
	//req.send(JSON.stringify({}));

	// объект запроса подготовлен: указан адрес и создана функция onreadystatechange
	// для обработки ответа сервера

        // (4)
	req.send(null);  // отослать запрос
}

function getXmlHttp(){
    var xmlhttp;
    try {
        xmlhttp = new ActiveXObject("Msxml2.XMLHTTP");
    } catch (e) {
    try {
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    } catch (E) {
        xmlhttp = false;
    }
    }
    if (!xmlhttp && typeof XMLHttpRequest!='undefined') {
        xmlhttp = new XMLHttpRequest();
    }
    return xmlhttp;
}
</script>
