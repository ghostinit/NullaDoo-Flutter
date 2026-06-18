import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'store.dart';
import 'package:go_router/go_router.dart';
import 'todos_screen.dart';

final _router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const ListsScreen()),
    GoRoute(
      path: '/lists/:id',
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        return TodosScreen(listId: id);
      },
    ),
  ],
);

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TodoStore(),
      child: const NullaDoo(),
    ),
  );
}

class NullaDoo extends StatelessWidget {
  const NullaDoo({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'NullaDoo',
      theme: ThemeData(
        colorScheme: ColorScheme.dark(
          surface: const Color(0xFF0A0F0A),
          primary: const Color(0xFF39FF14),
          secondary: const Color(0xFF1FAA3F),
          onSurface: const Color(0xFF39FF14),
        ),
        scaffoldBackgroundColor: const Color(0xFF0A0F0A),
      ),
      routerConfig: _router,
    );
  }
}

class ListsScreen extends StatelessWidget {
  const ListsScreen({super.key});

  Future<bool> _confirmDelete(
    BuildContext context,
    String id,
    String listName,
  ) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text('Really Delete "$listName"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              context.read<TodoStore>().deleteList(id);
              Navigator.pop(dialogContext, true);
            },
            child: const Text('Confirm'),
          ),
        ],
      ),
    );
    return result ?? false;
  }

  void _showAddDialog(BuildContext context) {
    final controller = TextEditingController();
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('New List'),
        content: TextField(
          controller: controller,
          autofocus: true,
          decoration: const InputDecoration(hintText: 'List name'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              final name = controller.text.trim();
              if (name.isNotEmpty) {
                context.read<TodoStore>().addList(name);
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('NullaDoo'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _showAddDialog(context),
          ),
        ],
      ),
      body: Builder(
        builder: (context) {
          final lists = context.watch<TodoStore>().lists;
          return ListView(
            children: lists
                .map(
                  (list) => Dismissible(
                    key: ValueKey(list.id),
                    direction: DismissDirection.endToStart,
                    onDismissed: (_) =>
                        context.read<TodoStore>().deleteList(list.id),
                    confirmDismiss: (_) =>
                        _confirmDelete(context, list.id, list.name),
                    background: Container(
                      color: Colors.red,
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.only(right: 20),
                      child: const Icon(Icons.delete, color: Colors.white),
                    ),
                    child: ListTile(
                      title: Text(list.name),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () => context.push('/lists/${list.id}'),
                    ),
                  ),
                )
                .toList(),
          );
        },
      ),
    );
  }
}
