class Picture {
  final int id;
  final int plantId;
  final int? missionId;
  final String path;
  final DateTime creationDate;
  Picture(this.id, this.plantId, this.missionId, this.creationDate,
      {this.path = "image_test_plant.jpg"});
}
