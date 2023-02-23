import 'package:arosaje/viewmodels/plant_detail_view_model.dart';
import 'package:arosaje/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class PlantDetails extends StatefulWidget {
  final PlantDetailViewModel _viewModel;
  const PlantDetails(this._viewModel, {super.key});

  @override
  State<StatefulWidget> createState() => _PlantDetailState();
}

class _PlantDetailState extends State<PlantDetails> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: "Details de ma plante"),
      body: Center(
        child: Text("Detail de ma plante"),
      ),
    );
  }
}
