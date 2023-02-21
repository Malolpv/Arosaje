class SignUpViewModel extends ConnectionBaseViewModel{
  
  //attributes
  String? _name;
  
  //accessors
  String? get name => _name;
  
  //utils
  
  //methods
  void nameChanged(String? newName){
    _name = newName;
  }
  
  bool manageNameValidation(String name){
    bool isValid = false;
    
    if(name.isEmpty){
      _passwordErrorMessage = "name cannot be empty"; 
    }
    else{
      isValid = true;
    }
    
    return isValid;
  }
  
  @override
  void submit() async {
    _isLoading = true;
    //notifyListeners();
    
    final email = _email;
    final password = _password;
    final name = _name;
    if(email != null && password != null && name != null){
      if(manageEmailValidation(email) && managePasswordValidation(password) && manageNameValidation(name)){
        //TODO api call to retrieve user datas
        await Future.delayed(Duration(seconds: 2));
      }  
    }
    
    _isLoading = false;
    //notifyListeners();
  }
  
}
