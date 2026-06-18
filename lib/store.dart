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
}
