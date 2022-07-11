const MovingObject = require('./moving_object');
const Util = require('./util');

function Bullet(options) {
  options.color = '#000';
  options.radius = 2;
  MovingObject.call(this, options);
}

Util.inherits(Bullet, MovingObject);

module.exports = Bullet;
