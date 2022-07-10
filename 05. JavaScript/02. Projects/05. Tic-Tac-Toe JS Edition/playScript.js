const Game = require('./game');
const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function completionCallback() {
  reader.close();
}

const game = new Game(reader);
game.run(completionCallback);
