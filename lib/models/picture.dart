class Picture {
  final int id;
  final int plantId;
  final int? missionId;
  final String path;

  Picture(this.id, this.plantId, this.missionId,
      {this.path = "image_test_plant.jpg"});
}
