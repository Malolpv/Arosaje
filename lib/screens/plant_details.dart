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
    return Scaffold(
      appBar: CustomAppBar(title: widget._viewModel.plant.name),
      body: Center(
        child: Column(
          children: [
            Container(
              child: Column(
                //TODO CHANGER L'ICONE
                children: [
                  Image.asset("image_test_plant.jpg"),
                ],
              ),
            ),
            Expanded(
              child: FutureBuilder(
                  future: widget._viewModel.fetchPictures(),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      return ListView.builder(
                        itemCount: widget._viewModel.picturesNumber,
                        scrollDirection: Axis.vertical,
                        padding: const EdgeInsets.only(top: 20),
                        itemBuilder: (context, index) {
                          if (index > 0) {
                            final item =
                                widget._viewModel.plant.pictures[index];

                            return Image.network(item.path);
                          } else {
                            return const Center(
                              child: Text("Impossible de charger l'image"),
                            );
                          }
                        },
                      );
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
