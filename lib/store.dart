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
}
