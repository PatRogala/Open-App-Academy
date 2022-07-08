function titleize(arr, callback) {
  const newArr = arr.map(function(name) {
    return `Mx. ${name} Jingleheimer Schmidt`;
  });
  callback(newArr);
}
