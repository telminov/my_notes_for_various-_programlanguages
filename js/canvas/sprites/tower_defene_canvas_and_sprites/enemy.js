function Enemy(options) {

    var img = new Image();
    img.src = options['src'];

    this.id = getId();

    this.game = options['game'];
    this.playground = this.game.playground;
    this.context = this.game.playground.context;

    this.health = options['health'];

    this.sprite = new Sprite({
        context: this.context,
        width: options['spriteWidth'] || 700,//img.naturalWidth,
        height: options['spriteHeight'] || 100,//img.naturalHeight,
        image: img,
        numberOfFrames: options['numberOfFrames'] || 7,
        path_points: options['path_points'],
        moveSpeed: 5
    });

    this.x = this.sprite.x_start;
    this.y = this.sprite.y_start;
}

Enemy.prototype.damage = function (tower) {
    var self = this;
    self.health -= tower.damage;
    self.isAlive();
};

Enemy.prototype.isAlive = function () {
    if (this.checkAlive() === true) {
        this.destroy()
    }
};

Enemy.prototype.checkAlive = function () {
    return this.health <= 0
};

Enemy.prototype.move = function () {
    this.sprite.loop();
    this.x = this.sprite.x_start;
    this.y = this.sprite.y_start;
};


Enemy.prototype.destroy = function () {
    delete this.game.enemies[this.id]
};
