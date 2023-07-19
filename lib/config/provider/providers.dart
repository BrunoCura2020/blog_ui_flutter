import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../../entities/todo.dart';

enum TodoFilter { all, completed, pending }

const uuid = Uuid();

final todoStatusFilterProvider = StateProvider<int>((ref) {
  return 0;
});

//Agrego la información en las tarjetas
// final todosProvider = StateProvider<List<Todo>>((ref) {
//   return [
//     Todo(id: uuid.v4(), description: 'Nota1', completed: true),
//     Todo(id: uuid.v4(), description: 'Nota2', completed: true),
//     Todo(id: uuid.v4(), description: 'Nota3', completed: false),
//   ];
// });

final titleTodosStatusProvider = StateProvider<String>((ref) {
  final todoFilter = ref.watch(todoStatusFilterProvider);

  switch (todoFilter) {
    case 0:
      return 'All';
    case 1:
      return 'Completed';
    case 2:
      return 'Pending';
    case 3:
      return 'Reminders';
  }
  return 'All';
});

// Información de Card
final completedcounterProvider = StateProvider<int>((ref) {
  final todos = ref.watch(todosProvider);
  final completed = todos.where((todo) => todo.completed).toList();
  return completed.length;
});

final pendingcounterProvider = StateProvider<int>((ref) {
  final todos = ref.watch(todosProvider);
  final pending = todos.where((todo) => !todo.completed).toList();
  return pending.length;
});

final reminderscounterProvider = StateProvider<int>((ref) {
  return 0;
});
// Fín de Información de Card

final filteredTodosProvider = Provider<List<Todo>>((ref) {
  final filter = ref.watch(todoStatusFilterProvider);
  final todos = ref.watch(todosProvider);

  switch (filter) {
    case 0:
      return todos;
    case 1:
      final completed = todos.where((todo) => todo.completed).toList();
      return completed;
    case 2:
      final pending = todos.where((todo) => !todo.completed).toList();
      return pending;
    case 3:
      final reminders = <Todo>[];
      return reminders;
  }
  return todos;
});

final todosProvider =
    StateNotifierProvider<TodosNotifier, List<Todo>>((ref) {
  return TodosNotifier();
});

class TodosNotifier extends StateNotifier<List<Todo>> {
  TodosNotifier() : super([]);

  void addTodo({required String description}) {
    final Todo newtodo = Todo(
      id: uuid.v4(),
      description: description,
      completed: false,
    );
    state = [newtodo, ...state];
  }

  void toggleTodo(String id) {
    state = state.map((todo) {
      if (todo.id != id) return todo;
      return todo.copyWith(completed: !todo.completed);
    }).toList();
  }

  void deleteTodo(String id) {
    state = state.where((todo) => todo.id != id).toList();
  }
}

final newTodoProvider = StateProvider<String>((ref) {
  return '';
});