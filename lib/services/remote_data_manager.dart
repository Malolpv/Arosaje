import 'package:arosaje/models/picture.dart';
import 'package:arosaje/models/plant.dart';
import 'package:arosaje/models/user.dart';

class RemoteDataManager {
  final List<User> _usersUseCase = <User>[
    const User(1, "test@gmail.com", "test"),
    const User(2, "test2@gmail.com", "test")
  ];

  Future<User?> loadCurrentUser(int idUser) {
    //TODO UTILISER ID USER
    return Future.value(
        _usersUseCase.firstWhere((element) => element.id == idUser));
  }

  Future<User?> getUserByMailAndPass(String email, String pass) {
    return Future.value(_usersUseCase.firstWhere(
        (element) => element.email == email && element.pass == pass));
  }

  Future<List<Plant>> loadAllPlants(int idUser) {
    return Future.value(<Plant>[
      Plant(1, "hortensia", DateTime.now(), Picture(), <Picture>[]),
      Plant(1, "tulipe", DateTime.now(), Picture(), <Picture>[])
    ]);
  }
}
