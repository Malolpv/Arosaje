import 'package:arosaje/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class PlantDetails extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PlantDetailState();
}

class _PlantDetailState extends State<PlantDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Details de ma plante"),
      body: Center(
        child: Text("Detail de ma plante"),
      ),
    );
  }
}
