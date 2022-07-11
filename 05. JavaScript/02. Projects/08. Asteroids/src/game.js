const Ship = require('./ship');

function Game() {
  this.asteroids = [];
  this.addAsteroids();
  this.ship = new Ship({game: this, pos: this.randomPosition()});
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
  const objects = this.allObjects();
  for (let i = 0; i < objects.length; i++) {
    objects[i].draw(ctx);
  }
}

Game.prototype.moveObjects = function() {
  const objects = this.allObjects();
  for (let i = 0; i < objects.length; i++) {
    objects[i].move();
  }
}

Game.prototype.wrap = function(pos) {
  return [
    pos[0] > Game.DIM_X ? pos[0] % Game.DIM_X : pos[0] < 0 ? pos[0] + Game.DIM_X : pos[0],
    pos[1] > Game.DIM_Y ? pos[1] % Game.DIM_Y : pos[1] < 0 ? pos[1] + Game.DIM_Y : pos[1]
  ];
}

Game.prototype.checkCollisions = function() {
  const objects = this.allObjects();
  for (let i = 0; i < objects.length; i++) {
    for (let j = i + 1; j < objects.length; j++) {
      if (objects[i].isCollidedWith(objects[j])) {
        objects[i].collideWith(objects[j]);
      }
    }
  }
}

Game.prototype.step = function() {
  this.moveObjects();
  this.checkCollisions();
}

Game.prototype.remove = function(asteroid) {
  const index = this.asteroids.indexOf(asteroid);
  this.asteroids.splice(index, 1);
}

Game.prototype.allObjects = function() {
  return this.asteroids.concat(this.ship);
}

Game.DIM_X = 800;
Game.DIM_Y = 600;
Game.NUM_ASTEROIDS = 10;

module.exports = Game;
