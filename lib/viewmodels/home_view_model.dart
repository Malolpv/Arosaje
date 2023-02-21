import 'package:arosaje/viewmodels/base_view_model.dart';

class HomeViewModel extends BaseViewModel{
  //TODO ADD SERVICE CALL TO RETRIEVE DATA
   
  
  //attributes
  List<Plant> _plantList = [];
  List<Plant> get plantList => _plantList;
  
  //errors
  
  
  //methods
  
  void plantTaped(int index){
    //TODO redirect to the detail page
    //Navigator.push(context,MaterialPageRoute(builder: (context) => const PlantDetailView(PlantDetailViewModel(_plantList[index])))
    
  }
  
  void refreshPlantList() async {
    _isLoading = true;
    //notifyListeners();
    
    fetchPlantList();
    
    _isLoading = false;
    //notifyListeners();
  }
  
  void fetchPlantList() async {
    //TODO EDIT WITH AN API CALL
    _plantList = [];
  }
  
  
}
