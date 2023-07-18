import 'package:flutter/material.dart';

import 'package:app_notas/ui/widgets/widgets.dart';
// import '../widgets/CustomBottomBar.dart';
// import '../widgets/Task.dart';
// import '../widgets/WelcomeCard.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SafeArea(
        top: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            WelcomeCard(),
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                'Todas las tareas',
                style: TextStyle(
                  color: Color(0xff8C8C8C),
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Task(
                completed: true,
                description: 'Probando',
                id: '1',
                // onTapCheckBox: () {},
              ),
              // child: MediaQuery.removeViewPadding(
              //   removeTop: true,
              //   context: context,
              //   child: ListView.builder(
              //     padding: const EdgeInsets.only(top: 10),
              //     physics: const BouncingScrollPhysics(),
              //     itemBuilder: (BuildContext context, int index) {

              //     },
              //   ),
              // ),
            ),
            Expanded(
              child: Task(
                completed: true,
                description: 'Probando',
                id: '1',
                // onTapCheckBox: () {},
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomButtomBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
