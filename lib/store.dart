import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';
import 'models.dart';

class TodoStore extends ChangeNotifier {
  final List<TodoList> _lists = [];

  List<TodoList> get lists => List.unmodifiable(_lists);

  void addList(String name) {
    final newList = TodoList(id: const Uuid().v4(), name: name);
    _lists.add(newList);
    notifyListeners();
  }

  void deleteList(String id) {
    _lists.removeWhere((list) => list.id == id);
    notifyListeners();
  }

  TodoList? listById(String id) {
    for (final list in _lists) {
      if (list.id == id) return list;
    }
    return null;
  }

  void addTodo(String listId, String text) {
    final index = _lists.indexWhere((list) => list.id == listId);
    if (index == -1) return;

    final oldList = _lists[index];
    final newTodo = Todo(id: const Uuid().v4(), text: text);

    _lists[index] = TodoList(
      id: oldList.id,
      name: oldList.name,
      todos: [...oldList.todos, newTodo],
    );

    notifyListeners();
  }

  void toggleTodo(String listId, String todoId) {
    final listIndex = _lists.indexWhere((list) => list.id == listId);
    if (listIndex == -1) return;

    final oldList = _lists[listIndex];
    final todoIndex = oldList.todos.indexWhere((todo) => todo.id == todoId);

    if (todoIndex == -1) return;
    final oldTodo = oldList.todos[todoIndex];

    final newTodo = oldTodo.copyWith(done: !oldTodo.done);

    _lists[listIndex] = TodoList(
      id: oldList.id,
      name: oldList.name,
      todos: [
        ...oldList.todos.sublist(0, todoIndex),
        newTodo,
        ...oldList.todos.sublist(todoIndex + 1),
      ],
    );

    notifyListeners();
  }

  void deleteTodo(String listId, String todoId) {
    final listIndex = _lists.indexWhere((list) => list.id == listId);
    if (listIndex == -1) return;

    final oldList = _lists[listIndex];
    final todoIndex = oldList.todos.indexWhere((todo) => todo.id == todoId);

    if (todoIndex == -1) return;

    _lists[listIndex] = TodoList(
      id: oldList.id,
      name: oldList.name,
      todos: [
        ...oldList.todos.sublist(0, todoIndex),
        ...oldList.todos.sublist(todoIndex + 1),
      ],
    );

    notifyListeners();
  }
}
