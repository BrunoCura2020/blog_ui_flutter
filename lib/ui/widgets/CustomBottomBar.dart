import 'package:app_notas/config/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:stylish_bottom_bar/model/bar_items.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

class CustomButtomBar extends StatelessWidget {
  const CustomButtomBar({super.key});

  @override
  Widget build(BuildContext context) {
    const selectedColor = AppTheme.selectedColorBar;
    const unSelectedColor = AppTheme.unSelectedColorBar;

    return StylishBottomBar(
      items: [
        BottomBarItem(
          icon: const Icon(
            Icons.house_outlined,
          ),
          selectedIcon: const Icon(Icons.house_rounded),
          selectedColor: selectedColor,
          unSelectedColor: unSelectedColor,
          title: const Text('All'),
        ),
        BottomBarItem(
          icon: const Icon(
            Icons.house_outlined,
          ),
          selectedIcon: const Icon(Icons.house_rounded),
          selectedColor: selectedColor,
          unSelectedColor: unSelectedColor,
          title: const Text('Completed'),
        ),
        BottomBarItem(
          icon: const Icon(
            Icons.style_outlined,
          ),
          selectedIcon: const Icon(
            Icons.style,
          ),
          selectedColor: selectedColor,
          unSelectedColor: unSelectedColor,
          title: const Text('Pending'),
        ),
        BottomBarItem(
          icon: const Icon(
            Icons.style_outlined,
          ),
          selectedIcon: const Icon(
            Icons.style,
          ),
          selectedColor: selectedColor,
          unSelectedColor: unSelectedColor,
          title: const Text('Reminders'),
        ),
      ],
      hasNotch: true,
      fabLocation: StylishBarFabLocation.center,
      currentIndex: 0,
      option: AnimatedBarOptions(
        // iconSize: 32,
        barAnimation: BarAnimation.fade,
        iconStyle: IconStyle.Default,
        // opacity: 0.3,
      ),
    );
  }
}
