Array.prototype.myEach = function(callback) {
  for (let i = 0; i < this.length; i++) {
    callback(this[i]);
  }
}

Array.prototype.myMap = function(callback) {
  let mapped = [];
  this.myEach(el => {
    mapped.push(callback(el));
  });
  return mapped;
}

Array.prototype.myReduce = function(callback, initialValue) {
  let accumulator = initialValue || this[0];
  this.myEach(el => {
    accumulator = callback(accumulator, el);
  });
  return accumulator;
}
