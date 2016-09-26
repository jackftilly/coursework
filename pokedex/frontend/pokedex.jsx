import React from 'react';
import ReactDOM from 'react-dom';
import fetchAllPokemon from './util/api_util';
import { receiveAllPokemon } from './actions/pokemon_actions';
import configureStore from './store/store.js';
import Root from './components/root';

let store = configureStore();

document.addEventListener("DOMContentLoaded", ()=> {
  let root = document.getElementById("root");
  ReactDOM.render(<Root store={store} />, root);
});
