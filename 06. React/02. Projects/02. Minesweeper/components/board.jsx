import Tile from './tile.jsx';
import React from 'react';

class Board extends React.Component {
  constructor(props) {
    super(props);
    console.log(props.board.grid);
    window.grid = props.board.grid;
  }

  render() {
    return (
      <div>
        {this.props.board.grid.map((row, indexR) => {
          return (<div key={indexR}>
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
