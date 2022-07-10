const MovingObject = require('./moving_object');
const Asteroid = require('./asteroid');

// For test
window.MovingObject = MovingObject;
window.Asteroid = Asteroid;
// TODO: delete later

window.addEventListener('DOMContentLoaded', () => {
  const canvas = document.getElementById("game-canvas");
  const ctx = canvas.getContext("2d");
});
