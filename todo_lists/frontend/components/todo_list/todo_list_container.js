import { connect } from 'react-redux';
import TodoList from './todo_list';
import {requestTodos, createTodo} from '../../actions/todo_actions';
import allTodos from '../../reducers/selector';

const mapStateToProps = state => ({
  todos: allTodos(state)
});
const mapDispatchToProps = dispatch => ({
  requestTodos: () => dispatch(requestTodos()),
  createTodo: (title, body) => dispatch(createTodo(title, body))
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(TodoList);
