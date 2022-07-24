import Tile from './tile.jsx';
import React from 'react';

class Board extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    return (
      <div id="board">
        {this.props.board.grid.map((row, indexR) => {
          return (<div className="row" key={indexR}>
            {row.map((tile, indexC) => {
              return (<Tile tile={tile} updateGame={this.props.updateGame} key={[indexR, indexC]}/>)
            })}
          </div>)
        })}
      </div>
    );
  }
}

export default Board;
