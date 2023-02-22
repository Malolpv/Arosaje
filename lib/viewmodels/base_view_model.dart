import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

abstract class BaseViewModel extends ChangeNotifier {
  //TODO extends ChangeNotifier

  //attributes

  //utils
  @protected
  bool isLoading = false;
  bool get getIsLoading => isLoading;

  //errors
  @protected
  String? errorMessage;
  String? get getErrorMessage => errorMessage;

  //methods
}
