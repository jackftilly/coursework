import React from 'react';

class TodoListItem extends React.Component {
  constructor(props) {
    super(props);
    this.item = props.item;
  }

  render() {
    return (<li>{this.item.title}</li>);
  }
}
export default TodoListItem;
