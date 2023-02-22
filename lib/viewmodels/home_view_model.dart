import 'package:arosaje/models/picture.dart';
import 'package:arosaje/models/plant.dart';
import 'package:arosaje/viewmodels/base_view_model.dart';
import 'package:arosaje/widgets/plant_list.dart';

class HomeViewModel extends BaseViewModel {
  //TODO ADD SERVICE CALL TO RETRIEVE DATA

  //attributes
  List<Plant> _plantList = [];
  List<Plant> get plantList => _plantList;

  //errors

  //methods

  void plantTaped(int index) {
    //TODO redirect to the detail page
    //Navigator.push(context,MaterialPageRoute(builder: (context) => const PlantDetailView(PlantDetailViewModel(_plantList[index])))
  }

  void refreshPlantList() async {
    isLoading = true;
    notifyListeners();

    fetchPlantList();

    isLoading = false;
    notifyListeners();
  }

  Future<List<Plant>> fetchPlantList() async {
    //TODO EDIT WITH AN API CALL
    _plantList = [
      Plant(1, "test", DateTime.now(), Picture(), List.from(<Picture>[]))
    ];
    notifyListeners();
    return Future.value(_plantList);
  }
}
