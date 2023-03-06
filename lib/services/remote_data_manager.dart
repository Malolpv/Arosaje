import 'dart:typed_data';

import 'package:arosaje/models/comment.dart';
import 'package:arosaje/models/mission.dart';
import 'package:arosaje/models/picture.dart';
import 'package:arosaje/models/plant.dart';
import 'package:arosaje/models/profile.dart';
import 'package:arosaje/models/user.dart';

class RemoteDataManager {
  final List<User> _usersUseCase = <User>[
    const User(1, "uid1", "test@gmail.com", "test", "access"),
    const User(2, "uid2", "test2@gmail.com", "test", "access")
  ];

  final List<Profile> _profileUseCase = <Profile>[
    Profile(1, "uid1", "Malo", ""),
    Profile(2, "uid2", "Alex", "")
  ];

  final List<Plant> _plantsUseCase = <Plant>[
    Plant(
        1,
        "hortensia",
        1,
        "/data/user/0/com.example.arosaje/cache/a438be7d-c86f-4996-8443-87fbc6b9581e/1000000033.jpg",
        <Comment>[],
        <Picture>[],
        <Mission>[]),
    Plant(
        2,
        "tulipe",
        1,
        "/data/user/0/com.example.arosaje/cache/23356cc2-06ba-4e95-b811-daf78ec2cce1/1000000037.jpg",
        <Comment>[],
        <Picture>[],
        <Mission>[])
  ];

  final List<Mission> _missionsUseCase = <Mission>[
    Mission(1, 1, 1, "garde d'hortensia", DateTime.now(),
        DateTime.now().add(const Duration(days: 7))),
    Mission(2, 1, 2, "garde de tulipe", DateTime.now(),
        DateTime.now().add(const Duration(days: 3))),
  ];

  final List<Picture> _picturesUseCase = <Picture>[
    Picture(1, 1, null, DateTime.now().subtract(const Duration(days: 1)),
        path:
            "/data/user/0/com.example.arosaje/cache/a438be7d-c86f-4996-8443-87fbc6b9581e/1000000033.jpg"),
    Picture(2, 1, 1, DateTime.now(),
        path:
            "/data/user/0/com.example.arosaje/cache/a438be7d-c86f-4996-8443-87fbc6b9581e/1000000033.jpg"),
    Picture(3, 2, 2, DateTime.now(),
        path:
            "/data/user/0/com.example.arosaje/cache/23356cc2-06ba-4e95-b811-daf78ec2cce1/1000000037.jpg")
  ];

  static final RemoteDataManager _instance =
      RemoteDataManager._privateConstructor();

  RemoteDataManager._privateConstructor();
  factory RemoteDataManager() {
    return _instance;
  }

  Future<User?> loadCurrentUser(int idUser) {
    return Future.value(
        _usersUseCase.firstWhere((element) => element.id == idUser));
  }

  Future<User?> checkUserCredentials(String email, String pass) {
    return Future.value(_usersUseCase.firstWhere(
        (element) => element.email == email && element.pass == pass));
  }

  Future<List<Plant>> loadAllPlants(int profileId) {
    return Future.value(_plantsUseCase
        .where((element) => element.profileId == profileId)
        .toList());
  }

  Future<Profile?> loadProfileByUserUid(String userUid) {
    return Future.value(
        _profileUseCase.firstWhere((element) => element.userUid == userUid));
  }

  Future<List<Mission>> loadMissions(int idProfile) {
    return Future.value(_missionsUseCase
        .where((element) => element.profileId == idProfile)
        .toList());
  }

  Future<List<Picture>> loadPlantPictures(int plantId) {
    return Future.value(_picturesUseCase
        .where((element) => element.plantId == plantId)
        .toList());
  }

  Future<List<Picture>> loadMissionPictures(int missionId) {
    return Future.value(_picturesUseCase
        .where((element) => element.missionId == missionId)
        .toList());
  }

  void savePicture(Uint8List image, {int plantId = 0, int missionId = 0}) {
    //TODO SAVE PICTURE
  }
  void savePictureLocal(String path, int plantId, int? missionId) {
    _picturesUseCase.add(Picture(
        _picturesUseCase[_picturesUseCase.length - 1].id,
        plantId,
        missionId,
        DateTime.now(),
        path: path));
  }

  void savePlant(String name, String path, int profileId) {
    int plantId =
        _instance._plantsUseCase[_instance._plantsUseCase.length - 1].id + 1;
    Picture picture = Picture(
        _instance._picturesUseCase[_instance._picturesUseCase.length - 1].id +
            1,
        plantId,
        null,
        DateTime.now(),
        path: path);
    _instance._picturesUseCase.add(picture);
    _instance._plantsUseCase.add(Plant(plantId, name, profileId, path,
        <Comment>[], <Picture>[picture], <Mission>[]));
  }
}
