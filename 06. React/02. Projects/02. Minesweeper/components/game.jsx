import * as Minesweeper from '../react_minesweeper.jsx';

class Game extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      board: new Minesweeper.Board(9, 10),
    };
    this.updateGame = this.updateGame.bind(this);
  }

  updateGame() {
    // TODO: update the game state
  }

  render() {
    return (
      <Board board={this.state.board} updateGame={this.updateGame} />
    );
  }
}

export default Game;
