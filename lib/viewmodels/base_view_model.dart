abstract class BaseViewModel{
  //TODO extends ChangeNotifier
  
  //attributes
  
  //utils
  bool _isLoading = false;
  bool get isLoading => _isLoading; 

  //errors
  String? _errorMessage;
  String? get errorMessage => _errorMessage;
  
  //methods
  
}
