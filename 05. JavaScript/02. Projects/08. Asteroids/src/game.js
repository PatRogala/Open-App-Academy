const Ship = require('./ship');
const Bullet = require('./bullet');
const Asteroid = require('./asteroid');

function Game() {
  this.asteroids = [];
  this.addAsteroids();
  this.ship = new Ship({game: this, pos: this.randomPosition()});
  this.bullets = [];
}

Game.prototype.addAsteroids = function() {
  for (let i = 0; i < Game.NUM_ASTEROIDS; i++) {
    this.add(new Asteroid({pos: this.randomPosition(), game: this}));
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
        const collision = objects[i].collideWith(objects[j]);
        if (collision) return;
      }
    }
  }
}

Game.prototype.step = function() {
  this.moveObjects();
  this.checkCollisions();
}

Game.prototype.remove = function(object) {
  if (object instanceof Asteroid) {
    this.asteroids.splice(this.asteroids.indexOf(object), 1);
  } else if (object instanceof Bullet) {
    this.bullets.splice(this.bullets.indexOf(object), 1);
  }
}

Game.prototype.allObjects = function() {
  return [].concat(this.asteroids, this.ship, this.bullets);
}

Game.prototype.add = function(object) {
  if (object instanceof Asteroid) {
    this.asteroids.push(object);
  } else if (object instanceof Ship) {
    this.ship = object;
  } else if (object instanceof Bullet) {
    this.bullets.push(object);
  }
}

Game.prototype.isOutOfBounds = function(pos) {
  return (pos[0] > Game.DIM_X || pos[0] < 0 || pos[1] > Game.DIM_Y || pos[1] < 0);
}

Game.DIM_X = 800;
Game.DIM_Y = 600;
Game.NUM_ASTEROIDS = 10;

module.exports = Game;
