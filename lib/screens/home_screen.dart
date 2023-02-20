import 'package:arosaje/screens/widgets/custom_app_bar.dart';
import 'package:arosaje/screens/widgets/plant_list.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Mes Plantes"),
      body: PlantList(),
    );
  }
}
