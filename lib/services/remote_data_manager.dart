import 'package:arosaje/models/mission.dart';
import 'package:arosaje/models/picture.dart';
import 'package:arosaje/models/plant.dart';
import 'package:arosaje/models/profile.dart';
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

  Future<Profile> LoadProfileByUserId(int idUser) {
    return Future.value(Profile());
  }

  Future<List<Mission>> LoadMissions(int idProfile) {
    return Future.value(<Mission>[
      Mission(
          1, DateTime.now(), DateTime.now().add(const Duration(days: 7)), []),
      Mission(
          2, DateTime.now(), DateTime.now().add(const Duration(days: 14)), [])
    ]);
  }
}
