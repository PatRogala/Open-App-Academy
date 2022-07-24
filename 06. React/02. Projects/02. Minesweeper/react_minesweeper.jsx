import React from 'react';
import ReactDOM from 'react-dom';
import Game from './components/game';

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <Game />,
    document.getElementById('minesweeper')
  );
});
