import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final Icon? icon;
  final Color? color;
  final void Function()? onTap;

  const CustomIconButton({
    Key? key,
    this.icon,
    this.color,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(7),
      child: Material(
        color: color,
        child: InkWell(
          onTap: onTap,
          child: SizedBox(
            height: 33,
            width: 33,
            child: icon,
          ),
        ),
      ),
    );
  }
}
