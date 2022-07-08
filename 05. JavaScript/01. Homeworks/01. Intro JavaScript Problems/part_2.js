function titleize(arr, callback) {
  const newArr = arr.map(function(name) {
    return `Mx. ${name} Jingleheimer Schmidt`;
  });
  callback(newArr);
}

function Elephant(name, height, tricks) {
  this.name = name;
  this.height = height;
  this.tricks = tricks;
}

Elephant.prototype.trumpet = function() {
  console.log(`${this.name} the elephant goes 'phrRRRRRRRR!!!!!!!'`);
}

Elephant.prototype.grow = function() {
  this.height += 12;
}

Elephant.prototype.addTrick = function(trick) {
  this.tricks.push(trick);
}

Elephant.prototype.play = function() {
  var trick = this.tricks[Math.floor(Math.random() * this.tricks.length)];
  console.log(`${this.name} is ${trick}!`);
}
