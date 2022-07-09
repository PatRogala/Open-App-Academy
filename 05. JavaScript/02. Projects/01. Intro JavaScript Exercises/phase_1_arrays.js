Array.prototype.uniq = function() {
  let uniq = [];
  for (let i = 0; i < this.length; i++) {
    if (!uniq.includes(this[i])) {
      uniq.push(this[i]);
    }
  }
  return uniq;
}

Array.prototype.twoSum = function() {
  let pairs = [];
  for (let i = 0; i < this.length; i++) {
    for (let j = i + 1; j < this.length; j++) {
      if (this[i] + this[j] === 0) {
        pairs.push([i, j]);
      }
    }
  }
  return pairs;
}

Array.prototype.transpose = function() {
  let transposed = [];
  for (let i = 0; i < this.length; i++) {
    transposed.push([]);
  }
  for (let i = 0; i < this.length; i++) {
    for (let j = 0; j < this.length
      && j < this[i].length; j++) {
      transposed[j].push(this[i][j]);
    }
  }
}
