import * as Minesweeper from '../minesweeper.js';
import Board from './board.jsx';
import React from 'react';

class Game extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      board: new Minesweeper.Board(9, 10)
    };
    this.updateGame = this.updateGame.bind(this);
    this.resetGame = this.resetGame.bind(this);
  }

  updateGame(tile, altKeyed) {
    altKeyed ? tile.toggleFlag() : tile.explore();
    this.setState({ board: this.state.board })
  }

  resetGame(e) {
    e.preventDefault();
    this.setState({ board: new Minesweeper.Board(9, 10) });
  }

  render() {
    const {board} = this.state;
    return (
      <div>
        <div className={`modal-screen ${board.lost() || board.won() ? 'visible' : ''}`}><div class="modal-content"><p>Its over!</p><button onClick={this.resetGame}>Play Again</button></div></div>
        <Board board={this.state.board} updateGame={this.updateGame} />
      </div>
    );
  }
}

export default Game;
