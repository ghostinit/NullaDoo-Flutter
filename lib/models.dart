class Todo {
  final String id;
  final String text;
  final bool done;

  const Todo({required this.id, required this.text, this.done = false});

  Todo copyWith({String? id, String? text, bool? done}) {
    return Todo(
      id: id ?? this.id,
      text: text ?? this.text,
      done: done ?? this.done,
    );
  }
}

class TodoList {
  final String id;
  final String name;
  final List<Todo> todos;

  const TodoList({required this.id, required this.name, this.todos = const []});
}
