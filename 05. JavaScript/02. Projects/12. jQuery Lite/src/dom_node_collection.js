class DOMNodeCollection {
  constructor(elementArray) {
    this.elements = elementArray;
  }

  html(string) {
    if (string) {
      this.elements.forEach(el => {
        el.innerHTML = string;
      });
      return;
    }

    return this.elements[0].innerHTML;
  }

  empty() {
    this.elements.forEach(el => {
      el.innerHTML = '';
    });
  }

  append(arg) {
    if (arg instanceof DOMNodeCollection) {
      this.elements.forEach(el => {
        arg.elements.forEach(child => {
          el.appendChild(child.cloneNode(true));
        });
      });
    } else if (arg instanceof HTMLElement) {
      this.elements.forEach(el => {
        el.appendChild(arg.cloneNode(true));
      });
    } else {
      this.elements.forEach(el => {
        el.innerHTML += arg;
      });
    }
  }

  attr(key, value) {
    if (value) {
      this.elements.forEach(el => {
        el.setAttribute(key, value);
      });
      return;
    }

    return this.elements[0].getAttribute(key);
  }

  addClass(className) {
    this.elements.forEach(el => {
      el.classList.add(className);
    });
  }

  removeClass(className) {
    this.elements.forEach(el => {
      el.classList.remove(className);
    });
  }

  children() {
    const children = [];
    this.elements.forEach(el => {
      children.push(...el.children);
    });
    return new DOMNodeCollection(children);
  }

  parent() {
    const parents = [];
    this.elements.forEach(el => {
      parents.push(el.parentElement);
    });
    return new DOMNodeCollection(parents);
  }

  find(selector) {
    const found = [];
    this.elements.forEach(el => {
      found.push(...el.querySelectorAll(selector));
    });
    return new DOMNodeCollection(found);
  }

  remove() {
    this.elements.forEach(el => {
      el.remove();
    });
  }
}

module.exports = DOMNodeCollection;
