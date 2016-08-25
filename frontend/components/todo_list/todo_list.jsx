import React from 'react';
import TodoListItem from './todo_list_item.jsx';
import TodoForm from './todo_form';


class TodoList extends React.Component {
  constructor(props) {
    super(props);
    this.props = props;
  }

  componentDidMount() {
    this.props.requestTodos();
  }

  render() {
    const todoItems = this.props.todos.map(todo => {
      return (
        <TodoListItem key={todo.id} item={todo} />
      );
    });
    return(
      <div>
        <ul>
          {todoItems}
        </ul>
        <TodoForm createTodo={this.props.createTodo}/>
      </div>
    );
  }
}

export default TodoList;
