import ReactDOM from 'react-dom';
import React from 'react';
import Root from './root';

document.addEventListener('DOMContentLoaded', function() {
  const root = document.getElementById('root');
  ReactDOM.render(
    <Root />, root);
});
