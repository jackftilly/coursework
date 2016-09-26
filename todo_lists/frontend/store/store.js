<<<<<<< HEAD
import {createStore} from 'redux';
import rootReducer from "../reducers/index.js";


const configureStore = () => (

  createStore(rootReducer)
);
=======
import { createStore } from 'redux';
import RootReducer from '../reducers/root_reducer';
import MasterMiddleware from '../middleware/master_middleware';

const configureStore = () => createStore(RootReducer, MasterMiddleware);
>>>>>>> old_i/master

export default configureStore;
