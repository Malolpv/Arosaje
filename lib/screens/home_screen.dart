import 'dart:io';

import 'package:arosaje/viewmodels/home_view_model.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final HomeViewModel _viewModel;
  const HomeScreen(this._viewModel, {super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          "Mes Plantes",
        ),
        actions: [
          IconButton(
              onPressed: () => widget._viewModel.addPlant(),
              icon: const Icon(Icons.add)),
          IconButton(
              onPressed: () => widget._viewModel.onLogout(),
              icon: const Icon(Icons.logout))
        ],
        centerTitle: true,
      ),
      body: Column(children: [
        const SizedBox(
          height: 15,
        ),
        Container(
          width: MediaQuery.of(context).size.width / 2,
          height: 40,
          child: ElevatedButton(
              onPressed: () => widget._viewModel.displayMissions(),
              child: const Text(
                "Mes missions",
                style: TextStyle(fontSize: 20),
              )),
        ),
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: FutureBuilder(
              future: widget._viewModel.fetchPlantList(),
              builder: (context, AsyncSnapshot snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return ListView.builder(
                    itemCount: widget._viewModel.plantList.length,
                    scrollDirection: Axis.vertical,
                    padding: const EdgeInsets.only(top: 20),
                    itemBuilder: (context, index) {
                      final item = widget._viewModel.plantList[index];

                      return GestureDetector(
                        onTap: () {
                          widget._viewModel.onPlantTaped(index);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15))),
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.only(
                              left: 15, right: 15, top: 15),
                          child: Row(children: [
                            Container(
                              decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15))),
                              child: Image.file(
                                File(item.mainPicture),
                                height: 100,
                                width: 100,
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Text(
                              item.name,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            )
                          ]),
                        ),
                      );
                    },
                  );
                }
              }),
        ),
      ]),
    );
  }
}
