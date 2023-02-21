import 'package:arosaje/viewmodels/base_view_model.dart';
abstract class ConnectionBaseViewModel extends BaseViewModel{
  
  
  //attributes
  String? _email;
  String? _password;
  
  //accessors
  String? get email => _email;
  String? get password => _password;
  
  //utils
  
  //errors attributes & accessors 
  String? _emailErrorMessage;
  String? get emailErrorMessage => _emailErrorMessage;
  
  String? _passwordErrorMessage;
  String? get passwordErrorMessage => _passwordErrorMessage;
  
  
  //methods
  void emailChanged(String? newEmail){
    _email = newEmail;
  }
  
  void passwordChanged(String? newPassword){
    _password = newPassword;
  }
  
  bool manageEmailValidation(String email){
    bool isValid = false;
    
    if(email.isEmpty){
       _emailErrorMessage = "Email cannot be empty";
    }
    else if(!email.contains("@")){
      _emailErrorMessage = "Email must contain '@'";
    }
    else if (!RegExp("/^[a-zA-Z0-9.!#\$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\\.[a-zA-Z0-9-]+)*\$/").hasMatch(email)){
      _emailErrorMessage = "Invalid Email";
    }
    else{
      isValid = true; 
    }
     
    return isValid;
  }
  
  bool managePasswordValidation(String password){
    bool isValid = false;
    
    if(password.isEmpty){
      _passwordErrorMessage = "Password cannot be empty"; 
    }
    else{
      isValid = true;
    }
    
    return isValid;
  }
  
  void submit() async {
    _isLoading = true;
    //notifyListeners();
    final email = _email;
    final password = _password;
    if(email != null && password != null){
      if(manageEmailValidation(email) && managePasswordValidation(password)){
        //TODO api call to retrieve user datas
        await Future.delayed(Duration(seconds: 2));
      }  
    }
    
    _isLoading = false;
    //notifyListeners();
  }
}
