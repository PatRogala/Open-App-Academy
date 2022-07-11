const Util = require('./util');
const MovingObject = require('./moving_object');

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

module.exports = Ship;
