import 'package:arosaje/models/plant.dart';
import 'package:flutter/material.dart';

class PlantList extends StatefulWidget {
  const PlantList({super.key});

  @override
  State<PlantList> createState() => _PlantListState();
}

class _PlantListState extends State<PlantList> {
  //TODO REMPLACER PAR LE TYPE PLANT
  // List<Plant> _plants = [];
  List<String> _plants = [];

  _fetchListItems() async {
    setState(() {
      _plants = List<String>.generate(20, (i) => 'Item ${i + 1}');
    });
    return _plants;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _fetchListItems(),
        builder: (context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              itemCount: _plants.length,
              scrollDirection: Axis.vertical,
              padding: const EdgeInsets.only(top: 20),
              itemBuilder: (context, index) {
                final item = _plants[index];

                return GestureDetector(
                  onTap: () {
                    throw Exception("Not implemented");
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15))),
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.only(left: 15, right: 15, top: 15),
                    child: Text("Plante : $item"),
                  ),
                );
              },
            );
          }
        });
  }
}
