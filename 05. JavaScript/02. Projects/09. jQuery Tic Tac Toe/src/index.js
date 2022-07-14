const View = require('./ttt-view');
const Game = require('./game');

  $(() => {
    const game = new Game();
    new View(game, $('.ttt'));
  });
