import 'package:arosaje/viewmodels/mission_details_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MissionDetails extends StatefulWidget {
  final MissionDetailsViewModel _viewModel;
  const MissionDetails(this._viewModel, {super.key});

  @override
  State<StatefulWidget> createState() => _MissionDetailsState();
}

class _MissionDetailsState extends State<MissionDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(centerTitle: true, title: const Text("Details de la mission")),
      body: Center(
        child: Column(
          children: [
            Image.asset(widget._viewModel.plant.mainPicture),
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(15)),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget._viewModel.mission.startDate.toString(),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    widget._viewModel.mission.endDate.toString(),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(15)),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              width: MediaQuery.of(context).size.width,
              child: Text(widget._viewModel.mission.description),
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text("+"),
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
                        itemCount: widget._viewModel.pictures.length,
                        scrollDirection: Axis.vertical,
                        padding: const EdgeInsets.only(top: 20),
                        itemBuilder: (context, index) {
                          if (index > 0) {
                            final item = widget._viewModel.pictures[index];
                            //TODO changer la source de l'image
                            return Image.asset(item.path);
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
