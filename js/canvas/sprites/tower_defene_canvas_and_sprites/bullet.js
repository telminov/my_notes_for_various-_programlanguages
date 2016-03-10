function Bullet(options) {
    var img = new Image();
    img.src = options['src'];

    this.x = undefined;
    this.y = undefined;
    this.id = getId();

    this.enemy = options['enemy']; // цель пульки
    this.tower = options['tower']; // цель пульки

    this.game = options['game'];
    this.playground = this.game.playground;
    this.context = this.game.playground.context;

    this.sprite = new Sprite({
        context: this.context,
        width: options['spriteWidth'] || 700,
        height: options['spriteHeight'] || 100,
        image: img,
        numberOfFrames: options['numberOfFrames'] || 7,
        path_points: options['path_points'],
        game: options['game'],
        enemy: options['enemy'],
        tower: options['tower'],
        moveSpeed: options['moveSpeed'] || 1 //TODO убрать если не понра
    });
}


Bullet.prototype.move = function () {

    this.sprite.loop();

    this.x = this.sprite.x_start;
    this.y = this.sprite.y_start;
};


Bullet.prototype.destroy = function () {
    delete this.game.enemies[this.id]
};
