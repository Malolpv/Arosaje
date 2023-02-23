import 'package:arosaje/models/picture.dart';
import 'package:arosaje/models/plant.dart';
import 'package:arosaje/models/user.dart';
import 'package:arosaje/viewmodels/base_view_model.dart';

abstract class HomeRouter {
  displayPlantDetails();
}

class HomeViewModel extends BaseViewModel {
  //TODO ADD SERVICE CALL TO RETRIEVE DATA

  //attributes
  final User _user;
  List<Plant> _plantList = [];
  List<Plant> get plantList => _plantList;

  //utils
  final HomeRouter _router;

  //constructors
  HomeViewModel(this._user, this._router);

  //errors

  //methods

  void onPlantTaped(int index) {
    _router.displayPlantDetails();
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
