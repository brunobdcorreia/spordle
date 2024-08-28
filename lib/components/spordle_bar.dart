import 'package:flutter/material.dart';

class SpordleBar extends StatelessWidget implements PreferredSizeWidget {
  const SpordleBar({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        automaticallyImplyLeading: false,
        title: Text(title,
            style: TextStyle(
                color: Theme.of(context).colorScheme.primary, fontSize: 20)));
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
