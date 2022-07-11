function MovingObject(options) {
  this.pos = options.pos;
  this.vel = options.vel;
  this.radius = options.radius;
  this.color = options.color;
  this.game = options.game;
}

MovingObject.prototype.draw = function(ctx) {
  ctx.fillStyle = this.color;
  ctx.beginPath();
  ctx.arc(this.pos[0], this.pos[1], this.radius, 0, 2 * Math.PI, false);
  ctx.fill();
}

MovingObject.prototype.move = function() {
  const newPos = [this.pos[0] + this.vel[0], this.pos[1] + this.vel[1]];
  if (this.game.isOutOfBounds(newPos)) {
    if (this.isWrappable) {
      this.pos = this.game.wrap(newPos);
      return;
    } else {
      this.game.remove(this);
      return;
    }
  }

  this.pos = newPos;
}

MovingObject.prototype.isCollidedWith = function(otherObject) {
  const centerDist = Math.sqrt(
    Math.pow(this.pos[0] - otherObject.pos[0], 2) +
    Math.pow(this.pos[1] - otherObject.pos[1], 2)
  );
  return centerDist < (this.radius + otherObject.radius);
}

MovingObject.prototype.collideWith = function(otherObject) {
  // default do nothing
}

MovingObject.prototype.isWrappable = true;

module.exports = MovingObject;
