function Sprite (options) {
    var self = this;
	self.game = options['game'];

    // для update кадров
	self.frameIndex = 0;
    self.numberOfFrames = options['numberOfFrames'] || 1;

    self.enemy = options['enemy'];
    self.tower = options['tower'];
    self.points = options['points'];

    self.moveSpeed = options['moveSpeed'] || 1; //скорость передвижения
    // для way спрайта
    self.path_points = options.path_points; //точки перемещения спрайта
    self.i = 0; // индекс для пути (подробнее в Sprite.way)

    if (self.enemy && self.tower) {

        self.x_start = self.tower.x;
        self.y_start = self.tower.y;
        self.x_end = self.enemy.x;
        self.y_end = self.enemy.y;

    } else if (self.path_points){
        self.x_start = self.path_points[self.i][0];
        self.y_start = self.path_points[self.i][1];
        self.x_end = self.path_points[self.i+1][0];
        self.y_end = self.path_points[self.i+1][1];
    }
    else if (self.points) {
        self.x_start = self.points[0];
        self.y_start = self.points[1];
    }
    //для scorrer
	self.count = 0; /// счетчик для frames и передвижения

    //для render
	self.context = options.context;
	self.width = options.width;
	self.height = options.height;
	self.image = options.image;

    self.tickCount = 0; //TODO для чего это?

    return self
}

// главная функция
Sprite.prototype.loop = function (){
    var self = this;

    if (self.enemy && self.tower) {
        self.wayBullet();
    } else if (self.path_points) {
        self.way(); // функция изменения продвижения
    }
    self.scorer(); // скорость перемещения (счетчик)
    self.render(); // отрисовка
    self.update(); // изменение кадра
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
//Sprite.prototype.way = function() {
//    var self = this;
//    //если i < длинны массива, то будет выполняться
//    if (self.i + 1 < self.path_points.length){ //если больше, то точка не будет перемещаться
//        // перемещение точки по dx
//        if (self.x_start < self.x_end) {
//            self.x_start += 1;
//        } //заменить < dx на определенный
//        if (self.x_start > self.x_end) {
//            self.x_start -= 1;
//        }
//        // по dy
//        if (self.y_start < self.y_end) {
//            self.y_start += 1;
//        }
//        if (self.y_start > self.y_end) {
//            self.y_start -= 1;
//        }
//
//        if ((self.x_start == self.x_end) && (self.y_start == self.y_end)){
//            self.i += 1;
//            // i увеличилась, но x_end увеличивать нельзя, ибо некуда
//            if (self.i + 1 < self.path_points.length) {
//                self.x_start = self.path_points[self.i][0];
//                self.y_start = self.path_points[self.i][1];
//                self.x_end = self.path_points[self.i + 1][0];
//                self.y_end = self.path_points[self.i + 1][1];
//            }
//        }
//    }
//    else {
//        self.sprite_end = true;
//    }
//
//};

//функция изменения пути спрайта
Sprite.prototype.way = function() {
    var self = this;
    //если i < длинны массива, то будет выполняться
    if (self.i + 1 < self.path_points.length){ //если больше, то точка не будет перемещаться
        // перемещение точки по dx
        if (self.x_start < self.x_end) {
            // если dx входит в область от конца до dперемещения
            if (self.x_start >= self.x_end - self.moveSpeed){
                self.x_start = self.x_end;
            } else {
                self.x_start += self.moveSpeed;
            }
        }
        if (self.x_start > self.x_end) {
            if (self.x_start <= self.x_end + self.moveSpeed) {
                self.x_start = self.x_end;
            } else {
                self.x_start -= self.moveSpeed;
            }
        }
        // по dy
        if (self.y_start < self.y_end) {
            if (self.y_start >= self.y_end - self.moveSpeed){
                self.y_start = self.y_end;
            } else {
                self.y_start += self.moveSpeed;
            }
        }
        if (self.y_start > self.y_end) {
            if (self.y_start <= self.y_end + self.moveSpeed){
                self.y_start = self.y_end;
            } else {
                self.y_start -= self.moveSpeed;
            }
        }
        // если x_start с x_end совпадают
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
        //в след условии не попадет условие на то, что точки совпадают, так что можно спокойно проверять на область
        // условие, для снижения скорости при поворотах
        //else if ((self.x_end - self.moveSpeed <= self.x_start && self.x_start <= self.x_end + self.moveSpeed) &&
        //    (self.y_end - self.moveSpeed <= self.y_start && self.y_start <= self.y_end + self.moveSpeed)) {
        //    if (self.x_start < self.x_end) {
        //        //если меньше, то из кон точки вычитаем х_старт
        //        self.x_start += (Math.ceil(self.x_end - self.x_start / 2));
        //    } //заменить < dx на определенный
        //    if (self.x_start > self.x_end) {
        //        self.x_start += (Math.ceil(self.x_start - self.x_end / 2));
        //    }
        //    // по dy
        //    if (self.y_start < self.y_end) {
        //        self.y_start += (Math.ceil(self.y_end - self.y_start / 2));
        //    }
        //    if (self.y_start > self.y_end) {
        //        self.y_start += (Math.ceil(self.y_start - self.y_end / 2));
        //    }
        //}
    }
    else {
        self.sprite_end = true;
    }
};

Sprite.prototype.wayBullet = function () {
    var self = this;

    if (self.x_start < self.x_end) {
            self.x_start += self.moveSpeed;
        } //заменить < dx на определенный
        if (self.x_start > self.x_end) {
            self.x_start -= self.moveSpeed;
        }
        // по dy
        if (self.y_start < self.y_end) {
            self.y_start += self.moveSpeed;
        }
        if (self.y_start > self.y_end) {
            self.y_start -= self.moveSpeed;
        }

        //если пуля попадает в область от цели до половины скорости пули
        //т.к. если moveSpeed =! 1, то пуля может пролететь цель и летать возле нее
        //но если пуля в допустимом диапозоне, то считай она долетела до цели
        if ((self.x_end - self.moveSpeed <= self.x_start && self.x_start <= self.x_end + self.moveSpeed) &&
            (self.y_end - self.moveSpeed <= self.y_start && self.y_start <= self.y_end + self.moveSpeed)) {

            self.sprite_end = true;
            self.enemy.damage(self.tower);
        }

        self.x_end = self.enemy.x;
        self.y_end = self.enemy.y;
};

Sprite.prototype.update = function () {
    var self = this;
    if (self.count % 2 == 0) { // задается скорость вращения
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
        self.x_start, // координаты придут с функции по расположению
        self.y_start,
        playground.tileSize, //размер
        playground.tileSize // TODO кто такой playground?
        //self.width / self.numberOfFrames,
        //self.height
    );
};