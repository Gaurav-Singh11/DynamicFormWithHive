import 'package:flutter/material.dart';

class AppButtonWidget extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  final bool active;

  const AppButtonWidget({
    Key? key,
    required this.title,
    this.onPressed,
    this.active = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(200, 40),
        backgroundColor: Colors.blue.withOpacity(active ? 1 : 0.2),
      ),
      onPressed: onPressed ?? (){},
      child: Text(
        title,
        style: TextStyle(color: Colors.white.withOpacity(active ? 1 : 0.5)),
      ),
    );
  }
}
