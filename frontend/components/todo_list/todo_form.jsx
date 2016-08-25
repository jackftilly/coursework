import React from 'react';

class TodoForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {title: '', body: ''};
    this.createTodo = this.createTodo.bind(this);
    this.setTitle = this.setTitle.bind(this);
    this.setBody = this.setBody.bind(this);
  }

  createTodo (e) {
    e.preventDefault();
    return this.props.createTodo(this.state.title, this.state.body);
  }

  setTitle (e) {
    return this.setState({title: e.currentTarget.value});
  }
  setBody (e) {
    return this.setState({body: e.currentTarget.value});
  }

  render() {
    return (
      <form onSubmit={this.createTodo}>
        <input onChange={this.setTitle} value={this.state.title} />
        <input onChange={this.setBody} value={this.state.body} />
        <input type="submit" value="Create Todo" />
      </form>
    );
  }
}

export default TodoForm;
