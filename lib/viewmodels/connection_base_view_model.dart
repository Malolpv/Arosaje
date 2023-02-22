import 'package:arosaje/viewmodels/base_view_model.dart';
import 'package:meta/meta.dart';

abstract class ConnectionBaseViewModel extends BaseViewModel {
  //attributes
  @protected
  String? email;
  @protected
  String? password;

  //accessors
  String? get getEmail => email;
  String? get getPassword => password;

  //utils

  //errors attributes & accessors
  @protected
  String? emailErrorMessage;
  @protected
  String? get getEmailErrorMessage => emailErrorMessage;

  String? passwordErrorMessage;
  String? get getPasswordErrorMessage => passwordErrorMessage;

  //methods
  void emailChanged(String? newEmail) {
    email = newEmail;
  }

  void passwordChanged(String? newPassword) {
    password = newPassword;
  }

  bool manageEmailValidation(String email) {
    bool isValid = false;

    if (email.isEmpty) {
      emailErrorMessage = "Email cannot be empty";
    } else if (!email.contains("@")) {
      emailErrorMessage = "Email must contain '@'";
    } else if (!RegExp(
            "/^[a-zA-Z0-9.!#\$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\\.[a-zA-Z0-9-]+)*\$/")
        .hasMatch(email)) {
      emailErrorMessage = "Invalid Email";
    } else {
      isValid = true;
    }

    return isValid;
  }

  bool managePasswordValidation(String password) {
    bool isValid = false;

    if (password.isEmpty) {
      passwordErrorMessage = "Password cannot be empty";
    } else {
      isValid = true;
    }

    return isValid;
  }

  void submit() async {
    isLoading = true;
    //notifyListeners();
    final email = this.email;
    final password = this.password;
    if (email != null && password != null) {
      if (manageEmailValidation(email) && managePasswordValidation(password)) {
        //TODO api call to retrieve user datas
        await Future.delayed(Duration(seconds: 2));
      }
    }

    isLoading = false;
    //notifyListeners();
  }
}
