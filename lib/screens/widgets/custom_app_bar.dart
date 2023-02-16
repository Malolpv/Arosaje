import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({super.key, required this.title});

  @override
  Size get preferredSize => const Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.green,
      title: Text(
        title,
      ),
      actions: [
        IconButton(
          onPressed: () => throw Exception(),
          icon: Icon(Icons.account_circle),
        ),
        IconButton(onPressed: () => throw Exception(), icon: Icon(Icons.logout))
      ],
      centerTitle: true,
    );
  }
}
