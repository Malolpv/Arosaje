import 'package:arosaje/viewmodels/home_view_model.dart';
import 'package:arosaje/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final HomeViewModel _viewModel;
  const HomeScreen(this._viewModel);

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
            //TODO IMPLEMENTER ICONE ACCOUNT
            onPressed: () => throw Exception(),
            icon: const Icon(Icons.account_circle),
          ),
          IconButton(
              onPressed: () => widget._viewModel.onLogout(),
              icon: const Icon(Icons.logout))
        ],
        centerTitle: true,
      ),
      body: Column(children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 50,
          decoration: const BoxDecoration(
              color: Colors.greenAccent,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50))),
          child: ElevatedButton(
              onPressed: () {},
              child: const Text(
                "+",
                style: TextStyle(fontSize: 30),
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
                          child: Text("Plante : $item"),
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
