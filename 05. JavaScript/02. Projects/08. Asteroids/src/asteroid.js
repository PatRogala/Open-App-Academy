const Util = require('./util');
const MovingObject = require('./moving_object');
const Ship = require('./ship');
const Bullet = require('./bullet');

function Asteroid(options) {
  options.color = '#00FF00';
  options.radius = 30;
  options.vel = Util.randomVec(10);
  MovingObject.call(this, options);
}

Util.inherits(Asteroid, MovingObject);

Asteroid.prototype.collideWith = function(otherObject) {
  if (otherObject instanceof Ship) {
    otherObject.relocate();
    return true;
  } else if (otherObject instanceof Bullet) {
    this.game.remove(this);
    this.game.remove(otherObject);
    return true;
  }
}

module.exports = Asteroid;
