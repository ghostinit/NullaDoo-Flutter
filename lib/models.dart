class Todo {
  final String id;
  final String text;
  final bool done;

  const Todo({required this.id, required this.text, this.done = false});
}

class TodoList {
  final String id;
  final String name;
  final List<Todo> todos;

  const TodoList({required this.id, required this.name, this.todos = const []});
}
