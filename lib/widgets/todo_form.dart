import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/todo.dart';
import '../providers/todo_provider.dart';
import 'package:uuid/uuid.dart';


class TodoForm extends ConsumerWidget {
  const TodoForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleController = TextEditingController();
    final descController = TextEditingController();

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 16,
        right: 16,
        top: 16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Add Todo', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          TextField(
            controller: titleController,
            decoration: const InputDecoration(labelText: 'Title'),
          ),
          TextField(
            controller: descController,
            decoration: const InputDecoration(labelText: 'Description'),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
              onPressed: () {
                ref.read(todoProvider.notifier).addTodo(
                  titleController.text,
                  descController.text,
                  null, // or pass selected dueDate if you have a date picker
                  'Personal', // or get this from a dropdown if needed
                );
                Navigator.pop(context);
              },

              child: const Text('Add Todo'),
          ),
        ],
      ),
    );
  }
}
