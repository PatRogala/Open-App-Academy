import Tile from './tile.jsx';
import React from 'react';

class Board extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    return (
      <Tile board={this.props.board} updateGame={this.props.updateGame} />
    );
  }
}

export default Board;
