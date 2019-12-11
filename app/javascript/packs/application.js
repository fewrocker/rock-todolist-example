import "bootstrap";

import Vue from 'vue'
import App from '../app.vue'
import VueRouter from "vue-router";
import router from "./router.js";
Vue.use(VueRouter);

// Load application

import Application from "../app.vue";
if (document.querySelector("application"))
  new Vue(Object.assign({}, Application, { router }));
