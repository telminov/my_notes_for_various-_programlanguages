function Game(options) {
    this._intervalId = undefined;
    this.players = {};
    this.enemies = {};
    this.bullets = {};
    this.playground = undefined;
    this.fps = 40;
    this.lives = options['lives'];
    this.id = options['id'];
    this.health = options['health'];
    this.currentPlayer = options['currentPlayer'];
}

Game.prototype.start = function () {
    this._intervalId = setInterval(this.loop.bind(this), 1000 / this.fps);
};

Game.prototype.stop = function () {
    clearInterval(this._intervalId);
};

Game.prototype.loop = function () {

    var self = this;
    var healthes = [];

    self.playground.context.clearRect(0, 0, self.playground.canvas.width, self.playground.canvas.height);

    playground.parseWays(waysConst);

    for (var enemyId in self.enemies) {
        var enemy = self.enemies[enemyId];
        if (enemy.sprite.sprite_end === true) {
            self.health -= 1;
            delete self.enemies[enemyId];
        } else {
            enemy.move();
        }
        healthes.push(enemy.health);
    }

    document.getElementById('enemies').innerHTML = healthes;

    for (var player in self.players) {
        var towers = self.players[player].towers;
        for (var towerId in towers) {
            var tower = towers[towerId];
            tower.render();

            tower.currentTime = Date.now();

            if (tower.currentTime - tower.lastTime > tower.speed) {
                self.checkCollision(tower);
            }
        }
    }

    for (var bulletId in self.bullets) {
        var bullet = self.bullets[bulletId];
        if (bullet.sprite.sprite_end === true) {
            delete self.bullets[bulletId];
        } else {
            bullet.move();
        }
    }

    if (self.health <= 0) {
        self.stop();
        console.log('game stopped, loooser');
    }

};

Game.prototype.checkCollision = function (tower) {
    var self = this;

    for (var enemyId in self.enemies) {
        var enemy = self.enemies[enemyId];

        var dx = enemy.x - tower.x;
        var dy = enemy.y - tower.y;

        var distance = Math.sqrt(dx * dx + dy * dy);

        var collision = distance < tower.radius;
        if (collision) {
            tower.fire(enemy);
            tower.lastTime = Date.now();
            break;
        }
    }
};

Game.prototype.addPlayground = function (playground) {
    this.playground = playground;
};

Game.prototype.addEnemy = function (enemy) {
    this.enemies[enemy.id] = enemy;
};

Game.prototype.addPlayer = function (player) {
    this.players[player.id] = player;
};