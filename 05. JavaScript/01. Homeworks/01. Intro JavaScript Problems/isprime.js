function isPrime(n) {
  if (n < 2) {
    return false;
  }
  for (var i = 2; i < n; i++) {
    if (n % i === 0) {
      return false;
    }
  }
  return true;
}


function sumOfNPrimes(n) {
  var sum = 0;
  var primes = [];
  var i = 2;
  while (primes.length < n) {
    if (isPrime(i)) {
      primes.push(i);
    }
    i++;
  }
  return primes.reduce(function(a, b) {
    return a + b;
  });
}
