const Board = require("./board");

class Game {
  constructor(reader) {
    this.reader = reader;
    this.board = new Board();
  }

  promptMove(callback) {
    this.reader.question("Where would you like to move? ", (answer) => {
      const pos = answer.split(",").map(str => parseInt(str));
      callback(pos);
    });
  }

  run(completionCallback) {
    this.promptMove((pos) => {
      if (this.board.won()) {
        return console.log(`${this.board.winner()} wins!`);
      }

      if (this.board.empty(pos)) {
        this.board.placeMark(pos, "X");
        this.board.print();
        this.run(completionCallback);
      }
    });
  }
}
