class Board {
  constructor() {
    this.grid = this.makeGrid();
  }

  makeGrid() {
    const grid = [];
    for (let i = 0; i < 3; i++) {
      grid.push([]);
      for (let j = 0; j < 3; j++) {
        grid[i].push(null);
      }
    }
    return grid;
  }

  print() {
    this.grid.forEach(row => {
      console.log(row.join(" | "));
    });
  }

  won() {
    const winningCombos = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6]
    ];
    for (let i = 0; i < winningCombos.length; i++) {
      const [a, b, c] = winningCombos[i];
      if (
        this.grid[a][0] &&
        this.grid[a][0] === this.grid[b][0] &&
        this.grid[a][0] === this.grid[c][0]
      ) {
        return this.grid[a][0];
      }
    }
    return false;
  }

  winner() {
    this.won();
  }

  empty(pos) {
    return this.grid[pos[0]][pos[1]] === null;
  }

  placeMark(pos, mark) {
    if (!this.empty(pos)) {
      return false;
    }

    this.grid[pos[0]][pos[1]] = mark;
  }
}

module.exports = Board;
