function Game() {
  this.asteroids = [];
  this.addAsteroids();
}

Game.prototype.addAsteroids = function() {
  for (let i = 0; i < Game.NUM_ASTEROIDS; i++) {
    this.asteroids.push(new Asteroid({pos: this.randomPosition(), game: this}));
  }
}

Game.prototype.randomPosition = function() {
  return [
    Game.DIM_X * Math.random(),
    Game.DIM_Y * Math.random()
  ];
}

Game.prototype.draw = function(ctx) {
  ctx.clearRect(0, 0, Game.DIM_X, Game.DIM_Y);
  for (let i = 0; i < this.asteroids.length; i++) {
    this.asteroids[i].draw(ctx);
  }
}

Game.prototype.moveObjects = function() {
  for (let i = 0; i < this.asteroids.length; i++) {
    this.asteroids[i].move();
  }
}

Game.prototype.wrap = function(pos) {
  return [
    pos[0] > Game.DIM_X ? pos[0] % Game.DIM_X : pos[0] < 0 ? pos[0] + Game.DIM_X : pos[0],
    pos[1] > Game.DIM_Y ? pos[1] % Game.DIM_Y : pos[1] < 0 ? pos[1] + Game.DIM_Y : pos[1]
  ];
}

Game.DIM_X = 800;
Game.DIM_Y = 600;
Game.NUM_ASTEROIDS = 10;

module.exports = Game;
