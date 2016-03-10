function Playground(options) {
    this.target = options['target'];
    this.tileSize = options['tileSize'];
    this.xTiles = options['xTiles'];
    this.yTiles = options['yTiles'];
    this.background = options['background'];
    this.ways = {};
    this.canvas = undefined;
    this.context = undefined;
}

Playground.prototype.init = function () {
    var self = this;
    var canvas = document.createElement("canvas");
    canvas.width = self.xTiles * self.tileSize;
    canvas.height = self.yTiles * self.tileSize;
    canvas.style.border = '1px solid black';
    canvas.style.background = 'url('+self.background+')';
    document.getElementById(self.target).appendChild(canvas);
    self.canvas = canvas;
    self.context = canvas.getContext('2d');
};


Playground.prototype.parseWays = function (ways) {
    var self = this;

    for (var wayId in ways) {
        var way = ways[wayId];

        way.forEach(function(coords){

            var tileX = coords[0];
            var tileY = coords[1];

            var tileCenterX = tileX * self.tileSize + (self.tileSize / 2);
            var tileCenterY = tileY * self.tileSize + (self.tileSize / 2);

            self.context.fillRect(tileCenterX, tileCenterY, 3, 3);
        });
    }
};
