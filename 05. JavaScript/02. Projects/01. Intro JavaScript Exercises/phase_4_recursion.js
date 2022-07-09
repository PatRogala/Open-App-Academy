function range(start, end) {
  if (start === end) {
    return [start];
  }
  return [start].concat(range(start + 1, end));
}

function sumRec(arr) {
  if (arr.length === 1) {
    return arr[0];
  }
  return arr[0] + sumRec(arr.slice(1));
}

function exponent(base, exp){
  if (exp === 0) {
    return 1;
  }
  return base * exponent(base, exp - 1);
}

function fibonacci(n) {
  if (n === 0) {
    return [];
  }
  if (n === 1) {
    return [0];
  }
  if (n === 2) {
    return [0, 1];
  }
  let prev = fibonacci(n - 1);
  prev.push(prev[prev.length - 1] + prev[prev.length - 2]);
  return prev;
}

function deepDup(arr) {
  if (!Array.isArray(arr)) {
    return arr;
  }
  let dup = [];
  for (let i = 0; i < arr.length; i++) {
    dup.push(deepDup(arr[i]));
  }
  return dup;
}

function bsearch(arr, target) {
  if (arr.length === 0) {
    return -1;
  }
  let mid = Math.floor(arr.length / 2);
  if (arr[mid] === target) {
    return mid;
  }
  if (arr[mid] > target) {
    return bsearch(arr.slice(0, mid), target);
  }
  return bsearch(arr.slice(mid + 1), target) + mid + 1;
}
