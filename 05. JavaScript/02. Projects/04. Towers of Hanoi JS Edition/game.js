class Game {
  constructor(reader) {
    this.towers = [[3, 2, 1], [], []];
    this.reader = reader;
  }

  promptMove(reader, callback) {
    this.print();
    reader.question("Enter a starting tower and an ending tower separated by a space: ", (str) => {
      const move = str.split(" ");
      const startTowerIdx = parseInt(move[0]);
      const endTowerIdx = parseInt(move[1]);
      callback(startTowerIdx, endTowerIdx);
    });
  }

  isValidMove(startTowerIdx, endTowerIdx) {
    if (startTowerIdx < 0 || startTowerIdx > 2) {
      return false;
    }
    if (endTowerIdx < 0 || endTowerIdx > 2) {
      return false;
    }
    if (this.towers[startTowerIdx].length === 0) {
      return false;
    }
    if (this.towers[endTowerIdx].length === 0) {
      return true;
    }
    if (this.towers[startTowerIdx][0] > this.towers[endTowerIdx][0]) {
      return false;
    }
    return true;
  }

  move(startTowerIdx, endTowerIdx) {
    if (!this.isValidMove(startTowerIdx, endTowerIdx)) {
      return false;
    }
    const disk = this.towers[startTowerIdx].pop();
    this.towers[endTowerIdx].push(disk);
    return true;
  }

  print() {
    console.log(JSON.stringify(this.towers));
  }

  isWon() {
    if (this.towers[0].length === 0 && this.towers[1].length === 0) {
      return true;
    }
    return false;
  }

  run(completionCallback) {
    this.promptMove(this.reader, (startTowerIdx, endTowerIdx) => {
      if (!this.move(startTowerIdx, endTowerIdx)) {
        console.log("Invalid move!");
      }

      if (!this.isWon()) {
        return this.run(completionCallback);
      }

      console.log('You win!');
      completionCallback();
    });
  }
}

module.exports = Game;
