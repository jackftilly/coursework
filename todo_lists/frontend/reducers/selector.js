const allTodos = (state) => {
  let keys = Object.keys(state.todos);
  if (keys.length === 0) {
    return [];
  }
  let todos = keys.map(id => {
    return state.todos[id];
  });
  return todos;
};

export default allTodos;
