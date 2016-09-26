export const fetchTodos = (success, error) => {
  $.ajax({
    method: 'GET',
    url: 'api/todos',
    success,
    error
  });
};

export const createTodoItem = (success, error, title, body) => {
  $.ajax({
    method: 'POST',
    url: 'api/todos',
    data: {
      todo: {
        title: title,
        body: body
      }
    },
    success,
    error
  });
};
