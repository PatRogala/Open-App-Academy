import React from 'react';

class Tile extends React.Component {
  constructor(props) {
    super(props);
    this.handleClick = this.handleClick.bind(this);
  }

  handleClick(e) {
    e.preventDefault();
    const altKeyed = e.altKey;
    this.props.updateGame(this.props.tile, altKeyed);
  }

  render() {
    const {tile} = this.props;
    const explored = tile.explored;
    const flagged = tile.flagged;
    const bombed = explored && tile.bombed;

    const styles = ['tile'];
    if (explored) {
      styles.push('explored');
    } else {
      styles.push('unexplored');
    }
    if (flagged) {
      styles.push('flagged');
    }
    if (bombed) {
      styles.push('bombed');
    }

    const value = explored ? bombed ? 'B' : tile.adjacentBombCount() : '';

    return (
      <div className={styles.join(" ")} onClick={this.handleClick}>{value}</div>
    );
  }
}

export default Tile;
