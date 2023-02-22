import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({super.key, required this.title});

  @override
  Size get preferredSize => const Size.fromHeight(60.0);

  @override
  State<StatefulWidget> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  Future openLogOutDialog(BuildContext context) async => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: const Text("Déconnexion"),
            content: const Text("Êtes vous sûr de vouloir vous déconnecter ?"),
            actions: [
              TextButton(
                  onPressed: (() => Navigator.of(context).pop()),
                  child: const Text("Cancel")),
              TextButton(
                  onPressed: () async {
                    //TODO SETUP DECONNECTION
                    Navigator.of(context).pop();
                  },
                  child: const Text("Ok"))
            ],
          ));

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.green,
      title: Text(
        widget.title,
      ),
      actions: [
        IconButton(
          //TODO IMPLEMENTER ICONE ACCOUNT
          onPressed: () => throw Exception(),
          icon: Icon(Icons.account_circle),
        ),
        IconButton(
            onPressed: () => openLogOutDialog(context),
            icon: Icon(Icons.logout))
      ],
      centerTitle: true,
    );
  }
}
