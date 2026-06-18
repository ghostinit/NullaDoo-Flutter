import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'store.dart';

void showAddModal(BuildContext context, String? listId) {
  final controller = TextEditingController();
  showDialog(
    context: context,
    builder: (dialogContext) => AlertDialog(
      title: Text(listId == null ? 'New List' : 'New Todo'),
      content: TextField(
        controller: controller,
        autofocus: true,
        decoration: InputDecoration(
          hintText: listId == null ? 'List Name' : 'Todo text',
        ),
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
              if (listId == null) {
                context.read<TodoStore>().addList(text);
              } else {
                context.read<TodoStore>().addTodo(listId, text);
              }
            }
            Navigator.pop(dialogContext);
          },
          child: const Text('Add'),
        ),
      ],
    ),
  );
}
