const DOMNodeCollection = require('./dom_node_collection.js');

document.addEventListener('DOMContentLoaded', function() {
  window.$l = function(selector) {
    if (selector instanceof HTMLElement) {
      return new DOMNodeCollection([selector]);
    }

    const elements = document.querySelectorAll(selector);
    return new DOMNodeCollection(Array.from(elements));
  }
});
