import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/todo.dart';
import '../providers/todo_provider.dart';

class TodoDetailsScreen extends ConsumerWidget {
  final Todo todo;

  const TodoDetailsScreen({super.key, required this.todo});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Todo Details')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(todo.title, style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 8),
            if (todo.description != null && todo.description!.isNotEmpty)
              Text(todo.description!, style: Theme.of(context).textTheme.bodyLarge),
            const SizedBox(height: 16),
            if (todo.dueDate != null)
              Text('Due: ${todo.dueDate!.toLocal()}',
                  style: TextStyle(
                      color: todo.dueDate!.isBefore(DateTime.now())
                          ? Colors.red
                          : Colors.green)),
            const SizedBox(height: 16),
            Text('Category: ${todo.category}'),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              icon: const Icon(Icons.edit),
              label: const Text('Edit'),
              onPressed: () {
                // Implement edit functionality
              },
            ),
          ],
        ),
      ),
    );
  }
}
