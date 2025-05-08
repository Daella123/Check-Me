import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/todo.dart';
import '../providers/todo_provider.dart';
import '../screens/todo_details_screen.dart';

class TodoTile extends ConsumerWidget {
  final Todo todo;

  const TodoTile({super.key, required this.todo});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dismissible(
      key: Key(todo.id),
      onDismissed: (_) => ref.read(todoProvider.notifier).deleteTodo(todo.id),
      child: ListTile(
        title: Text(
          todo.title,
          style: TextStyle(
            decoration: todo.isDone ? TextDecoration.lineThrough : null,
            color: todo.isDone ? Colors.grey : null,
          ),
        ),
        subtitle: Text(todo.category),
        trailing: Checkbox(
          value: todo.isDone,
          onChanged: (_) => ref.read(todoProvider.notifier).toggleDone(todo.id),
        ),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => TodoDetailsScreen(todo: todo)),
        ),
      ),
    );
  }
}
