import React from "react";
import ReactDOM from 'react-dom';
import Note from './util/note';
import configureStore from './store/store.js';
import Root from './components/root.jsx';

let store = configureStore();

ReactDOM.render(<Root store={store}/>, document.getElementById('root'));
