function Player(options) {
    this.gold = options['gold'];
    this.towers = {};
    this.nickname = options['nickname'];
    this.id = options['id'];
}

Player.prototype.addTower = function (tower) {
    if (this.gold - tower.cost > 0) {
        this.gold -= tower.cost;
        this.towers[tower.id] = tower;
    }
};
