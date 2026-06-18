import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'store.dart';

class TodosScreen extends StatelessWidget {
  final String listId;
  const TodosScreen({super.key, required this.listId});

  void _showAddTodo(BuildContext context, String listId) {
    final controller = TextEditingController();
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('New Todo'),
        content: TextField(
          controller: controller,
          autofocus: true,
          decoration: const InputDecoration(hintText: 'Todo text'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              final text = controller.text.trim();
              if (text.isNotEmpty) {
                context.read<TodoStore>().addTodo(listId, text);
              }
              Navigator.pop(dialogContext);
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final list = context.watch<TodoStore>().listById(listId);
    if (list == null) {
      return const Scaffold(body: Center(child: Text('List not found')));
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(list.name),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _showAddTodo(context, list.id),
          ),
        ],
      ),
      body: list.todos.isEmpty
          ? const Center(child: Text('No todos yet'))
          : ListView(
              children: list.todos
                  .map((todo) => ListTile(title: Text(todo.text)))
                  .toList(),
            ),
    );
  }
}
