import VueRouter from "vue-router";
import Vue from 'vue'

const lazy = (name) => () => Promise.resolve(Vue.component(name));

// Load all components in javascript/packs/components

const requireComponents = require.context("./components", true, /.vue$/);
const registeredComponents = []

requireComponents.keys().forEach((fileName) => {
  const component = requireComponents(fileName);
  const componentName = component.default.name;

  registeredComponents.push(componentName)

  if (component.default.el === "application") {
    return;
  }

  Vue.component(componentName, component.default || component);
});

const router = new VueRouter({
  mode: "history",
  routes: [
    // ---------------------------
    // Redirect logic
    // ---------------------------
    {
      path: '/',
      name: 'Redirect',
      redirect: function (to) {
        const path = to.query.redirect
        if (typeof path === 'undefined') {
          return {
            path: '/home',
            query: ''
          }
        } else if (registeredComponents.includes(path)) {
          return {
            path: to.query.redirect,
            query: ''
          }
        } else {
          return {
            path: '/page-not-found',
            query: ''
          }
        }
      }
    },
    // ---------------------------
    // Components
    // ---------------------------
    {
      path: "/home",
      component: lazy('home'),
      name: "home",
    },
    {
      path: "/page-not-found",
      component: lazy('page-not-found'),
      name: "page-not-found",
    },
  ],
});

export default router;
