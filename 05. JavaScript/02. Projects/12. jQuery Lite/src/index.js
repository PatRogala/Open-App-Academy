document.addEventListener('DOMContentLoaded', function() {
  window.$l = function(selector) {
    const elements = document.querySelectorAll(selector);
    return Array.from(elements);
  }
});
