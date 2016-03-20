    <input value="Запрос мне!" onclick="send_request()" type="button" />

<script>
function send_request(url, type='GET') {
	var req = getXmlHttp();
	req.onreadystatechange = function() {
		if (req.readyState == 4) {
			if(req.status == 200) {
				alert("Ответ сервера: "+req.responseText);
			}
		}
	};
	req.open(type, url, true);
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
