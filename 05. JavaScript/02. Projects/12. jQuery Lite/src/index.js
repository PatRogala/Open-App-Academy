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

$l.extend = function(...args) {
  const obj = {};
  args.forEach(arg => {
    Object.assign(obj, arg);
  });
  return obj;
}

$l.ajax = function(options) {
  const defaults = {
    url: '',
    method: 'GET',
    data: {},
    contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
    success: () => {},
    error: () => {},
  };

  const settings = $l.extend(defaults, options);

  const xhr = new XMLHttpRequest();
  xhr.open(settings.method, settings.url);
  xhr.onload = () => {
    if (xhr.status === 200) {
      settings.success(xhr.response);
    } else {
      settings.error(xhr.response);
    }
  }
  xhr.send(JSON.stringify(settings.data));
}
