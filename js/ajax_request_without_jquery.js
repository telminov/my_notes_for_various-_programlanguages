ajax_request = function (url, method) {
		// запрос к серверу и возварщает (не json данные)

	var req = getXmlHttp();
    req.open(method, url, false);
	req.send(null);  // отослать запрос TODO запрос странный получается django не понимает его как request.is_ajax() но сам запрос проходит.

    req.onreadystatechange = function() {
		// onreadystatechange активируется при получении ответа сервера

		if (req.readyState == 4) {
			// если запрос закончил выполняться
			console.log(req);
			if(req.status == 200) {
				return req.responseText;//JSON.parse(req.responseText);
			}
			else
				console.log('Error get data');
		}
	};
};

getXmlHttp = function (){
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
};