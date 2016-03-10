function BarGraph() {
    this.target = 'barGraph'; // тут задаем id canvasa
    this.canvas = undefined;
}

BarGraph.prototype.init = function () {
    var self = this;

    var canvas = document.getElementById(self.target);
    var context = canvas.getContext("2d");
    self.canvas = canvas;
    console.log(canvas);
    canvas.addEventListener("mousedown", self.click.bind(self), false);

    var k = 0; //TODO просто читер :D не знаю как, но работает
    $.ajax({
        url: '/mobil/report/request_loging/%k/graf/'%k,
        dataType: 'json',
        success: function (data) {
        self.data = data;
            console.log(data);
            for (var i = 0; i < data.count.length; i++) {
                var dx = i * data.column_width; // заменить!!! TODO
                var dy = -data.count[i]*data.column_length;
                console.log(dx, dy);
                // рисование линий
                context.strokeStyle="#5f9ea0";
                context.beginPath();
                context.moveTo(dx,data.dy_len);
                context.lineTo(dx,0);
                context.stroke();

                // рисование столбцов
                context.fillStyle="#8a2be2";
                context.fillRect(dx, data.dy_len , data.column_width, dy);
                context.strokeStyle="black";
                context.strokeRect(dx, data.dy_len , data.column_width, dy);

                //рисование i под столбцами
                context.fillStyle = "#black";
                //context.strokeStyle = "#black";
                context.font = "italic 10pt Arial";
                context.fillText(i, dx, data.dy_len+10);

            }
            context.beginPath();
                context.moveTo((i+1) * data.column_width-1,data.dy_len); // т.к. закончилось на последнем i
                context.lineTo((i+1) * data.column_width-1,0);
                context.stroke();
        }
    });

    //$(".picture").click(function () {
    //    self.drawImageSrc = $(this).attr("src");
    //    self.deletePictureMode = 0;
    //});
};

BarGraph.prototype.click = function (event) {
    var self = this;

    var x = event.x;
    var y = event.y;

    x -= self.canvas.offsetLeft;
    y -= self.canvas.offsetTop;

    var context = self.canvas.getContext("2d");

    var i = (x - x % self.data.column_width)/ self.data.column_width; // +1 ибо с нуля начинается
    percent = 100 *self.data.count[i]/self.data.max;
    console.log(100 *self.data.count[i]+'   '+self.data.max+ '   %'+percent);
    var text = 'i='+i+ '  кол-во='+self.data.count[i]+' ' +
        'процент='+percent+'%'+'       ' +self.data.column_width;
    $(document).ready(function () {
        $('description').html(text);
    });

};