const Util = require('./util');
const MovingObject = require('./moving_object');

function Asteroid(options) {
  options.color = '#00FF00';
  options.radius = 10;
  options.vel = Util.randomVec(10);
  MovingObject.call(this, options);
}

Util.inherits(Asteroid, MovingObject);

module.exports = Asteroid;
