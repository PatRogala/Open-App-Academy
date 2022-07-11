const Game = require('./game');
const GameView = require('./game_view');

window.addEventListener('DOMContentLoaded', () => {
  const canvas = document.getElementById("game-canvas");
  const ctx = canvas.getContext("2d");
  canvas.height = Game.DIM_Y;
  canvas.width = Game.DIM_X;

  const game = new Game();
  const gameView = new GameView(game, ctx);
  gameView.start();
});
