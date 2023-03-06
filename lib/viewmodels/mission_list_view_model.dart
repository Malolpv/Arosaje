import 'package:arosaje/viewmodels/base_view_model.dart';

abstract class MissionListRouter {
  displayPlants();
}

class MissionListViewModel extends BaseViewModel {
  final MissionListRouter _router;
  MissionListViewModel(this._router);
}
