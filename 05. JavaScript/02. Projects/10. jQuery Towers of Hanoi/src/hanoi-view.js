class HanoiView {
  constructor(game, $el) {
    this.game = game;
    this.$el = $el;
    this.setupTowers();
    this.render();
    this.clickTower();
  }

  setupTowers() {
    const $towers = $('<ul>');
    for (let i = 0; i < 3; i++) {
      const $tower = $('<li>');
      $tower.data('tower-idx', i);
      $tower.data('disc-count', this.game.towers[i].length);
      $tower.appendTo($towers);
    }
    $towers.appendTo(this.$el);
  }

  render() {
    const $towers = $('ul');
    $towers.empty();
    for (let i = 0; i < 3; i++) {
      const $tower = $('<li>');
      $tower.data('tower-idx', i);
      $tower.data('disc-count', this.game.towers[i].length);
      $tower.appendTo($towers);
    }
    $towers.appendTo(this.$el);
  }

  clickTower() {
    const $towers = $('ul');
    $towers.on('click', 'li', event => {
      const $tower = $(event.currentTarget);
      const towerIdx = $tower.data('tower-idx');
      const discCount = $tower.data('disc-count');
      if (discCount === 0) {
        alert('Invalid move!');
      } else {
        this.game.move(towerIdx);
        this.render();
        if (this.game.isWon()) {
          alert('You win!');
        }
      }
    });
  }
}

module.exports = HanoiView;
