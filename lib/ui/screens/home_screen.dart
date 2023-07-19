import 'package:app_notas/config/provider/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/widgets.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(filteredTodosProvider);
    final completedCounter = ref.watch(completedcounterProvider);
    final titleTodoFilter = ref.watch(titleTodosStatusProvider);
    final pendingCounter = ref.watch(pendingcounterProvider);
    final remindersCounter = ref.watch(reminderscounterProvider);

    return Scaffold(
      body: SafeArea(
        top: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            WelcomeCard(
              completedCounter: completedCounter,
              pendingCounter: pendingCounter,
              remindersCounter: remindersCounter,
            ),

            // TODOS TITLE FILTER
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 10, top: 10),
              child: Text(
                '$titleTodoFilter tasks',
                style: GoogleFonts.roboto(
                  color: const Color(0xff8C8C8C),
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            //  TODOS LISTVIEW
            Expanded(
              child: MediaQuery.removePadding(
                removeTop: true,
                context: context,
                child: ListView.builder(
                  padding: const EdgeInsets.only(top: 10),
                  physics: const BouncingScrollPhysics(),
                  itemCount: todos.length,
                  itemBuilder: (BuildContext context, int index) {
                    final todo = todos[index];
                    return Task(
                      id: todo.id,
                      description: todo.description,
                      completed: todo.completed,
                      onTapCheckBox: () {
                        ref.read(todosProvider.notifier).toggleTodo(todo.id);
                      },
                      onTapDelete: () {
                        ref.read(todosProvider.notifier).deleteTodo(todo.id);
                        Navigator.of(context).pop();
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomButtomBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (BuildContext context) {
              return CustomDialogNewTodo(
                onPressedCreate: () {
                  final newTodo = ref.read(newTodoProvider);
                  if (newTodo.isNotEmpty) {
                    ref
                        .read(todosProvider.notifier)
                        .addTodo(description: newTodo);
                    ref.read(newTodoProvider.notifier).update((state) => '');
                    ref
                        .read(todoStatusFilterProvider.notifier)
                        .update((status) => 0);
                    Navigator.of(context).pop();
                  }
                },
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
