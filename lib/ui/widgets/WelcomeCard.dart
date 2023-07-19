import 'package:app_notas/config/theme/app_theme.dart';
import 'package:flutter/material.dart';

class WelcomeCard extends StatelessWidget {
  final int completedCounter;
  final int pendingCounter;
  final int remindersCounter;

  const WelcomeCard(
      {super.key,
      required this.completedCounter,
      required this.pendingCounter,
      required this.remindersCounter});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(22),
          bottomRight: Radius.circular(22),
        ),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment(1, 0),
          colors: [
            Color(0xffF4C465),
            Color(0xffC63956),
          ],
        ),
      ),
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Image.asset(
            'assets/images/image_card.png',
            width: 150,
          ),
          Positioned(
            left: 0,
            bottom: 0,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 50, left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Hola Bruno 👋',
                    style: TextStyle(
                      fontSize: 28,
                    ),
                  ),
                  const Text(
                    'Tu día se ve así:',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 10),
                  TaskCounterCard(
                    iconData: Icons.calendar_month_rounded,
                    taskCounter: pendingCounter,
                    typeTask: 'pendientes',
                  ),
                  TaskCounterCard(
                    iconData: Icons.calendar_month_rounded,
                    taskCounter: completedCounter,
                    typeTask: 'completados',
                  ),
                  TaskCounterCard(
                    iconData: Icons.calendar_month_rounded,
                    taskCounter: remindersCounter,
                    typeTask: 'recordatorios',
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class TaskCounterCard extends StatelessWidget {
  final int taskCounter;
  final String typeTask;
  final IconData iconData;

  const TaskCounterCard(
      {super.key,
      required this.taskCounter,
      required this.typeTask,
      required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Container(
        height: 28,
        width: 160,
        decoration: BoxDecoration(
          color: AppTheme.colorTaskCounterCard,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                iconData,
                size: 16,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                '$taskCounter tasks $typeTask',
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
