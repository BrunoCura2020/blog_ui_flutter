class Todo {
  final String id;
  final String description;
  final bool completed;

  Todo({
    required this.id,
    required this.description,
    required this.completed,
  });

  Todo copyWith({
    String? id,
    String? description,
    bool? completed,
  }) =>
    Todo(
    id: id ?? this.id,
    description: description ?? this.description,
    completed: completed ?? this.completed,
  );
}
