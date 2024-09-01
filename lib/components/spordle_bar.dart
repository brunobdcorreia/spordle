import 'package:flutter/material.dart';

class SpordleBar extends StatelessWidget implements PreferredSizeWidget {
  const SpordleBar({Key? key, required this.title, this.actions})
      : super(key: key);

  final String title;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      automaticallyImplyLeading: false,
      title: Text(title,
          style: TextStyle(
              color: Theme.of(context).colorScheme.primary, fontSize: 20)),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
