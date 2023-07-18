import 'package:app_notas/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';

class Task extends StatelessWidget {
  final String id;
  final String description;
  final bool completed;
  final void Function()? onTapCheckBox;
  final void Function()? onTapDelete;

  const Task(
      {super.key,
      required this.id,
      required this.description,
      required this.completed,
      this.onTapCheckBox,
      this.onTapDelete});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              spreadRadius: 0,
              offset: Offset(0, 0),
            )
          ],
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              CustomIconButton(
                icon: Icon(
                  (completed)
                      ? Icons.check_box_rounded
                      : Icons.check_box_outline_blank_rounded,
                  color: Colors.blue,
                ),
                color: Colors.blue.withOpacity(0.3),
                onTap: onTapCheckBox,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    description,
                    style: TextStyle(
                      color: const Color(0xff6C6868),
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      decoration: completed ? TextDecoration.lineThrough : null,
                      decorationThickness: completed ? 2.0 : null,
                      decorationColor: completed ? Colors.blue : null,
                    ),
                  ),
                ),
              ),
              CustomIconButton(
                icon: const Icon(
                  Icons.disabled_by_default_rounded,
                  color: Colors.red,
                  size: 23,
                ),
                color: Colors.red.withOpacity(0.3),
              )
            ],
          ),
        ),
      ),
    );
  }
}
