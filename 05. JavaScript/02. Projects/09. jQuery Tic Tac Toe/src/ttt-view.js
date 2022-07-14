class View {
  constructor(game, $el) {
    this.game = game;
    this.$el = $el;
    this.setupBoard();
    this.bindEvents();
  }

  bindEvents() {
    this.$el.on('click', '.square', (e) => {
      const $square = $(e.currentTarget);
      this.makeMove($square);
    });
  }

  makeMove($square) {
    const move = $square.data('pos');
    try {
      this.game.playMove(move);
      $square.addClass('occupied');
      $square.text(this.game.board.grid[move[0]][move[1]]);
    } catch (e) {
      alert(e.msg);
    }

    if (this.game.isOver()) {
      this.$el.off('click');
      alert(`Game Over! ${this.game.winner()} wins!`);
    }
  }

  setupBoard() {
    const $ul = $('<ul>');
    $ul.addClass('board');
    this.$el.append($ul);

    for (let i = 0; i < 3; i++) {
      for (let j = 0; j < 3; j++) {
        const $li = $('<li>');
        $li.addClass('square');
        $li.data('pos', [i, j]);
        $ul.append($li);
      }
    }
  }
}

module.exports = View;
