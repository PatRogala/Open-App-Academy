// Simple Timeout
window.setTimeout(() => alert('HAMMERTIME'), 5000);

// Timeout Plus Closure
function hammerTime(time) {
  window.setTimeout(() => alert(`${time} is hammertime!`), time);
}
