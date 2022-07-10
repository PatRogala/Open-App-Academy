// Simple Timeout
window.setTimeout(() => alert('HAMMERTIME'), 5000);

// Timeout Plus Closure
function hammerTime(time) {
  window.setTimeout(() => alert(`${time} is hammertime!`), time);
}

// Some tea? Some biscuits?
const readline = require('readline');
const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

rl.question('Would you like a tea? ', (firstAns) => {
  console.log(`You said ${firstAns}`);
  rl.question('Would you like some biscuits? ', (secondAns) => {
    console.log(`So you ${firstAns} want tea and you ${secondAns} want coffee.`);
    rl.close();
  });
});
