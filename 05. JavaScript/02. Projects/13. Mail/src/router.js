class Router {
  constructor(node, routes) {
    this.node = node;
    this.routes = routes;
  }

  start() {
    this.render();
    window.addEventListener('hashchange', () => {
      this.render();
    });
  }

  render() {
    const component = this.activeRoute();
    this.node.innerHTML = '';

    if (component === undefined) {
      return;
    }

    const node = component.render();
    this.node.appendChild(node);
  }

  activeRoute() {
    const hash = window.location.hash;
    const routerName = hash.slice(1);
    return this.routes[routerName];
  }
}

module.exports = Router;
