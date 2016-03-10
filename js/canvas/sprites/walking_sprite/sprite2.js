function Sprite (options) {
    var self = this;

    // для update кадров
	self.frameIndex = 0;
    self.numberOfFrames = options.numberOfFrames || 1;

    // для way спрайта
    self.path_points = options.path_points; //точки перемещения спрайта
    self.i = 0; // индекс для пути (подробнее в Sprite.way)

    self.x_start = self.path_points[self.i][0];
    self.y_start = self.path_points[self.i][1];
    self.x_end = self.path_points[self.i+1][0];
    self.y_end = self.path_points[self.i+1][1];
    //для scorrer
	self.count = 0; /// счетчик для frames и передвижения

    //для render
	self.context = options.context;
	self.width = options.width;
	self.height = options.height;
	self.image = options.image;

    self.tickCount = 0;

    return self
}

// главная функция
Sprite.prototype.loop = function (){
    this.way(); // функция изменения расположения
    this.scorer(); // скорость перемещения (счетчик)
    this.render(); // отрисовка
    this.update(); // изменение кадра
};

// функция - счетчик для изменения кадров (и еще чего-нибудь)
Sprite.prototype.scorer = function () {

    var self = this;
    if (self.count < 50){ //может быть косяк в названии с переменной (такая же функция)
        self.count += 1;
    }
    else{
        self.count = 0;
    }
};

//функция изменения пути спрайта
Sprite.prototype.way = function() {
    var self = this;
    //если i < длинны массива, то будет выполняться
    if (self.i + 1 < self.path_points.length){ //если больше, то точка не будет перемещаться
        // перемещение точки по dx
        if (self.x_start < self.x_end) {
            self.x_start += 1;
        } //заменить < dx на определенный
        if (self.x_start > self.x_end) {
            self.x_start -= 1;
        }
        // по dy
        if (self.y_start < self.y_end) {
            self.y_start += 1;
        }
        if (self.y_start > self.y_end) {
            self.y_start -= 1;
        }

        if ((self.x_start == self.x_end) && (self.y_start == self.y_end)){
            self.i += 1;
            // i увеличилась, но x_end увеличивать нельзя, ибо некуда
            if (self.i + 1 < self.path_points.length) {
                self.x_start = self.path_points[self.i][0];
                self.y_start = self.path_points[self.i][1];
                self.x_end = self.path_points[self.i + 1][0];
                self.y_end = self.path_points[self.i + 1][1];
            }
        }
    }
};

Sprite.prototype.update = function () {
    var self = this;
    if (self.count % 4 == 0) { // задается скорость вращения
        self.frameIndex += 1;

        if (self.frameIndex > self.numberOfFrames - 1) {
            self.frameIndex = 1;
        }
    }
};

Sprite.prototype.render = function () {
    var self = this;
        self.context.drawImage(
            self.image,
            //выбор квадратика на общей картинке
            self.frameIndex * self.width / self.numberOfFrames,
            0,
            self.width / self.numberOfFrames,
            self.height,
            //выбор положения
            self.x_start, // координаты придут с функции по перемещению
            self.y_start,
            self.width / self.numberOfFrames,
            self.height
        );
};