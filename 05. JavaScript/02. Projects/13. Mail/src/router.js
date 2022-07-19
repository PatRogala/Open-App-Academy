class Router {
  constructor(node) {
    this.node = node;
  }

  start() {
    this.render();
    window.addEventListener('hashchange', () => {
      this.render();
    });
  }

  render() {
    this.node.innerHTML = '';
    const route = this.activeRoute();
    let ele = document.createElement('p');
    ele.innerHTML = route;
    this.node.appendChild(ele);
  }

  activeRoute() {
    const hash = window.location.hash;
    return hash.slice(1);
  }
}

module.exports = Router;
