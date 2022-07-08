function fizzBuzz(array) {
  var result = [];
  for (var i = 0; i < array.length; i++) {
    if (array[i] % 3 === 0 && array[i] % 5 === 0) {
      result.push('FizzBuzz');
    } else if (array[i] % 3 === 0) {
      result.push('Fizz');
    } else if (array[i] % 5 === 0) {
      result.push('Buzz');
    } else {
      result.push(array[i]);
    }
  }
  return result;
}
