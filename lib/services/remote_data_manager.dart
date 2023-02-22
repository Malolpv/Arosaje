import 'package:arosaje/models/picture.dart';
import 'package:arosaje/models/plant.dart';
import 'package:arosaje/models/user.dart';

class RemoteDataManager {
  Future<User?> loadCurrentUser(int idUser) {
    //TODO UTILISER ID USER
    return Future.value(const User(1, "test@gmail.com", "test"));
  }

  Future<List<Plant>> loadAllPlants(int idUser) {
    return Future.value(<Plant>[
      Plant(1, "hortensia", DateTime.now(), Picture(), <Picture>[]),
      Plant(1, "tulipe", DateTime.now(), Picture(), <Picture>[])
    ]);
  }
}
