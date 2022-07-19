const DOMNodeCollection = require('./dom_node_collection.js');

window.$l = function(selector) {
  if (selector instanceof HTMLElement) {
    return new DOMNodeCollection([selector]);
  }

  if (selector instanceof Function) {
    document.addEventListener('DOMContentLoaded', selector);
  }

  const nodes = document.querySelectorAll(selector);
  return new DOMNodeCollection(Array.from(nodes));
}
