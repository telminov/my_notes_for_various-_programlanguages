function Tower(options) {
    options = options || {};

    this.id = getId();

    this.game = options['game'];
    this.playground = this.game.playground;
    this.context = this.game.playground.context;

    this.tileX = options['tileX'];
    this.tileY = options['tileY'];

    this.x = this.tileX * this.playground.tileSize;
    this.y = this.tileY * this.playground.tileSize;

    this.radius = options['radius'];
    this.damage = options['damage'] || 1;
    this.speed = options['speed'];
    this.cost = options['cost'];

    this.isSelect = false;

    this.currentTime = Date.now();
    this.lastTime = this.currentTime - 3000;

    var img_tower = new Image();
    img_tower.src = options['src'];

    this.sprite = new Sprite({
        context: this.context,
        width: options['sprite_towerWidth'] || 2048,//img.naturalWidth,
        height: options['sprite_towerHeight'] || 179,//img.naturalHeight,
        image: img_tower,
        numberOfFrames: options['number_towerOfFrames'] || 12,
        points: [this.x, this.y] //расположение товерки
    });

}

Tower.prototype.fire = function (enemy) {
    var self = this;

    var b = new Bullet({
        game: self.game,
        src: 'banane.png',
        spriteWidth: 128,
        spriteHeight: 32,
        numberOfFrames: 4,

        enemy: enemy,
        tower: self,

        moveSpeed: 5

    });

    self.game.bullets[b.id] = b;

};

Tower.prototype.render = function () {
    this.sprite.loop();

    var centerX = this.x + this.playground.tileSize / 2;
    var centerY = this.y + this.playground.tileSize / 2;

    if (this.isSelect === true) { //TODO если не понра - убрать
        this.context.fillStyle = "black";
        this.context.strokeStyle = 'black';
        this.context.beginPath();
        this.context.arc(centerX, centerY, this.radius, 0, 2 * Math.PI, false);
        this.context.lineWidth = 1;
        this.context.stroke();
    }
};
