class Todo {
  final String id;
  final String title;
  final String? description;
  final DateTime? dueDate;
  final bool isDone;
  final String category;
  final DateTime createdAt;

  Todo({
    required this.id,
    required this.title,
    this.description,
    this.dueDate,
    this.isDone = false,
    this.category = 'Personal',
    required this.createdAt,
  });

  Todo copyWith({
    String? id,
    String? title,
    String? description,
    DateTime? dueDate,
    bool? isDone,
    String? category,
    DateTime? createdAt,
  }) {
    return Todo(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      dueDate: dueDate ?? this.dueDate,
      isDone: isDone ?? this.isDone,
      category: category ?? this.category,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
