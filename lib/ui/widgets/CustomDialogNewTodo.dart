import 'dart:ui';

import 'package:app_notas/config/provider/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomDialogNewTodo extends ConsumerWidget {
  final void Function()? onPressedCreate;
  const CustomDialogNewTodo({
    Key? key,
    required this.onPressedCreate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FocusNode focusNode = FocusNode();

    return BackdropFilter(
      //Crear un desenfoque
      filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
      child: AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Column(
          children: [
            Container(
              height: 45,
              width: 45,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 20,
                    spreadRadius: 0,
                    offset: Offset(0, 0),
                  )
                ],
                color: Colors.white,
              ),
              child: const Icon(
                Icons.note_alt_outlined,
                color: Color.fromARGB(255, 143, 128, 128),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                'Nueva tarea',
                style: TextStyle(
                  fontSize: 23,
                  color: Color.fromARGB(255, 143, 128, 128),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        content: SizedBox(
          height: 80,
          child: TextField(
              focusNode: focusNode,
              maxLines: null,
              expands: true,
              style: const TextStyle(
                color: Color.fromARGB(255, 128, 124, 124),
              ),
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                filled: false,
                hintText: '¿Cúal es tu nueva nota?',
                hintStyle: const TextStyle(
                  color: Color(0xff9C9A9A),
                ),
              ),
              onChanged: (value) {
                ref.read(newTodoProvider.notifier).update((state) => value);
              },
              onTapOutside: (event) {
                focusNode.unfocus();
              }),
        ),
        actionsAlignment: MainAxisAlignment.spaceEvenly,
        actions: <Widget>[
          TextButton(
            child: const Text(
              "Cancelar",
              style: TextStyle(
                fontSize: 15,
                color: Colors.red,
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            onPressed: onPressedCreate,
            child: const Text(
              "Crear",
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
