import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store.js';
import {requestTodos} from './actions/todo_actions';
import Root from './components/root';

const store = configureStore();

document.addEventListener("DOMContentLoaded", () => {
  let content = document.getElementById("content");
  ReactDOM.render(<Root store={store}/>, content);
});
