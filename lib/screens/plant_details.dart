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
              margin: const EdgeInsets.only(top: 15),
              child: Column(
                //TODO CHANGER LA SOURCE DE L'IMAGE
                children: [
                  Image.asset(
                    widget._viewModel.plant.mainPicture,
                    height: MediaQuery.of(context).size.height / 3,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 50,
              width: 180,
              child: ElevatedButton(
                onPressed: () => widget._viewModel.pickImage(),
                child: const Text(
                  "+",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: FutureBuilder(
                  future: widget._viewModel.fetchPictures(),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: widget._viewModel.pictures.length,
                        scrollDirection: Axis.vertical,
                        padding: const EdgeInsets.only(top: 20),
                        itemBuilder: (context, index) {
                          if (index >= 0) {
                            final item = widget._viewModel.pictures[index];
                            if (item.path != "") {
                              //TODO changer la source de l'image
                              return Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  padding: const EdgeInsets.only(bottom: 15),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.grey.shade100,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(15))),
                                    padding: const EdgeInsets.all(10),
                                    margin: const EdgeInsets.only(
                                        left: 15, right: 15, top: 15),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Date : ${item.creationDate.toString().split(" ")[0]}",
                                          textAlign: TextAlign.start,
                                          style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(height: 15),
                                        //TODO CHANGER LA SOURCE DE L'IMAGE
                                        Image.asset(item.path),
                                      ],
                                    ),
                                  ));
                            } else {
                              return const Center(
                                child: Text("Impossible de charger l'image"),
                              );
                            }
                          } else {
                            return const Center(
                              child: Text("Pas de photo"),
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
