const Util = require('./util');
const MovingObject = require('./moving_object');
const Bullet = require('./bullet');

function Ship(options) {
  options.color = '#E66157';
  options.radius = 10;
  options.vel = [0, 0];
  MovingObject.call(this, options);
}

Util.inherits(Ship, MovingObject);

Ship.prototype.relocate = function() {
  this.pos = this.game.randomPosition();
  this.vel = [0, 0];
}

Ship.prototype.power = function(impulse) {
  this.vel[0] += impulse[0];
  this.vel[1] += impulse[1];
}

Ship.prototype.fireBullet = function() {
  const bullet = new Bullet({
    pos: [this.pos[0], this.pos[1]],
    vel: [this.vel[0], this.vel[1]],
    game: this.game
  });
  this.game.add(bullet);
}

module.exports = Ship;
