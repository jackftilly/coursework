import {merge} from 'lodash';
import { RECEIVE_TODOS, RECEIVE_TODO } from '../actions/todo_actions';

const TodosReducer = (state = {}, action) => {
  switch(action.type) {
    case RECEIVE_TODOS:
      return merge({}, state, action.todos);
    case RECEIVE_TODO:
      let idx = Object.keys(state).length;
      return merge({}, state, {idx: action.todo});
    default:
      return state;
  }
};


export default TodosReducer;
