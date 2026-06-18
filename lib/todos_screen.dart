import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'store.dart';
import 'add_modal.dart';

class TodosScreen extends StatelessWidget {
  final String listId;
  const TodosScreen({super.key, required this.listId});

  // void _showAddTodo(BuildContext context, String listId) {
  //   final controller = TextEditingController();
  //   showDialog(
  //     context: context,
  //     builder: (dialogContext) => AlertDialog(
  //       title: const Text('New Todo'),
  //       content: TextField(
  //         controller: controller,
  //         autofocus: true,
  //         decoration: const InputDecoration(hintText: 'Todo text'),
  //       ),
  //       actions: [
  //         TextButton(
  //           onPressed: () => Navigator.pop(dialogContext),
  //           child: const Text('Cancel'),
  //         ),
  //         TextButton(
  //           onPressed: () {
  //             final text = controller.text.trim();
  //             if (text.isNotEmpty) {
  //               context.read<TodoStore>().addTodo(listId, text);
  //             }
  //             Navigator.pop(dialogContext);
  //           },
  //           child: const Text('Add'),
  //         ),
  //       ],
  //     ),
  //   );
  // }

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
            onPressed: () => showAddModal(context, list.id),
          ),
        ],
      ),
      body: list.todos.isEmpty
          ? const Center(child: Text('No todos yet'))
          : ListView(
              children: list.todos
                  .map(
                    (todo) => Dismissible(
                      key: ValueKey(todo.id),
                      direction: DismissDirection.endToStart,
                      onDismissed: (_) => context.read<TodoStore>().deleteTodo(
                        list.id,
                        todo.id,
                      ),
                      background: Container(
                        color: Colors.red,
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.only(right: 20),
                        child: const Icon(Icons.delete, color: Colors.white),
                      ),
                      child: ListTile(
                        leading: Checkbox(
                          value: todo.done,
                          onChanged: (_) => context
                              .read<TodoStore>()
                              .toggleTodo(list.id, todo.id),
                        ),
                        title: AnimatedOpacity(
                          duration: const Duration(milliseconds: 300),
                          opacity: todo.done ? 0.4 : 1.0,
                          child: AnimatedDefaultTextStyle(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                            style: TextStyle(
                              color: const Color(0xFF39FF14),
                              decoration: todo.done
                                  ? TextDecoration.lineThrough
                                  : TextDecoration.none,
                              decorationColor: const Color(0xFF39FF14),
                            ),
                            child: Text(todo.text),
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
    );
  }
}
