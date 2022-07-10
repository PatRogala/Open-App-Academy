const MovingObject = require('./moving_object');
const Asteroid = require('./asteroid');
const Game = require('./game');
const GameView = require('./game_view');

// For test
window.MovingObject = MovingObject;
window.Asteroid = Asteroid;
window.Game = Game;
window.GameView = GameView;
// TODO: delete later

window.addEventListener('DOMContentLoaded', () => {
  const canvas = document.getElementById("game-canvas");
  const ctx = canvas.getContext("2d");
  ctx.height = Game.DIM_Y;
  ctx.width = Game.DIM_X;

  const game = new Game();
  const gameView = new GameView(game, ctx);
  gameView.start();
});
