class Profile {
  final int id;
  final String userUid;
  final String userName;
  final String pictureUrl;
  final bool isBotaniste;

  Profile(this.id, this.userUid, this.userName, this.pictureUrl,
      {this.isBotaniste = false});
}
