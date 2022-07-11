function GameView(game, ctx) {
  this.game = game;
  this.ctx = ctx;
}

GameView.prototype.start = function() {
  this.bindKeyHandlers();
  setInterval(() => {
    this.game.step();
    this.game.draw(this.ctx);
  }, 20);
}

GameView.prototype.bindKeyHandlers = function() {
  key('space', () => {
    this.game.ship.fireBullet();
  }
  );
  key('w', () => {
    this.game.ship.power([0, -1]);
  }
  );
  key('a', () => {
    this.game.ship.power([-1, 0]);
  }
  );
  key('s', () => {
    this.game.ship.power([0, 1]);
  }
  );
  key('d', () => {
    this.game.ship.power([1, 0]);
  }
  );
}

module.exports = GameView;
