import { REQUEST_TODOS, RECEIVE_TODOS, CREATE_TODO, RECEIVE_TODO } from '../actions/todo_actions';
import {fetchTodos, createTodoItem} from '../util/todo_api_util';
import { receiveTodos, receiveTodo } from '../actions/todo_actions';

const TodoMiddleware = store => next => action => {
  switch(action.type) {
    case REQUEST_TODOS:
      const success = data => store.dispatch(receiveTodos(data));
      fetchTodos(success);
      break;
    case CREATE_TODO:
      const success2 = data => store.dispatch(receiveTodo(data));
      const error = {};
      createTodoItem(success2, error, action.title, action.body);
      break;
    default:
      return next(action);
  }
};

export default TodoMiddleware;
