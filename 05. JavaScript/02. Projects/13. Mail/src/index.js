const Sent = require('./sent');
const Inbox = require('./inbox');
const Router = require('./router');
const Compose = require('./compose');

const routes = {
  inbox: Inbox,
  sent: Sent,
  compose: Compose
}

document.addEventListener('DOMContentLoaded', function() {
  const listElements = document.querySelectorAll('.sidebar-nav li');
  const listItems = Array.from(listElements);
  listItems.forEach((item) => {
    item.addEventListener('click', () => {
      const text = item.innerText;
      window.location.hash = text.toLowerCase();
    });
  });

  const content = document.querySelector('.content');
  const router = new Router(content, routes);
  router.start();

  document.location.hash = 'inbox';


});
