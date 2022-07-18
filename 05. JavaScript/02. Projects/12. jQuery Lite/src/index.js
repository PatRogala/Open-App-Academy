const DOMNodeCollection = require('./dom_node_collection.js');

document.addEventListener('DOMContentLoaded', function() {
  window.$l = function(selector) {
    const elements = Array.from(document.querySelectorAll(selector));
    return new DOMNodeCollection(elements);
  }
});
