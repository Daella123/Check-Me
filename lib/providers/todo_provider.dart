import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/todo.dart';
import 'dart:math';

class TodoNotifier extends StateNotifier<List<Todo>> {
  TodoNotifier() : super([]);

  void addTodo(String title, String? description, DateTime? dueDate, String category) {
    final newTodo = Todo(
      id: Random().nextDouble().toString(),
      title: title,
      description: description,
      dueDate: dueDate,
      category: category,
      createdAt: DateTime.now(),
    );
    state = [...state, newTodo];
  }

  void toggleDone(String id) {
    state = [
      for (final todo in state)
        if (todo.id == id)
          todo.copyWith(isDone: !todo.isDone)
        else
          todo
    ];
  }

  void deleteTodo(String id) {
    state = state.where((todo) => todo.id != id).toList();
  }

  void updateTodo(Todo updatedTodo) {
    state = [
      for (final todo in state)
        if (todo.id == updatedTodo.id)
          updatedTodo
        else
          todo
    ];
  }
}

final todoProvider = StateNotifierProvider<TodoNotifier, List<Todo>>((ref) => TodoNotifier());
