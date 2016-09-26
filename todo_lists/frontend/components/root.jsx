import React from 'react';
<<<<<<< HEAD
import { Provider } from 'react-redux';
import App from './app.jsx';


const Root = ({ store }) => (
  <Provider store={store}>
    <App/>
  </Provider>

);
=======
import {Provider} from 'react-redux';
import App from './app';

const Root = ({ store }) => (
  <Provider store={store}>
    <App />
  </Provider>
);

>>>>>>> old_i/master
export default Root;
