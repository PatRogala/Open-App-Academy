Function.prototype.inherits = function(ParentClass) {
  function Surrogate() {}
  Surrogate.prototype = ParentClass.prototype;
  this.prototype = new Surrogate();
  this.prototype.constructor = this;
}
