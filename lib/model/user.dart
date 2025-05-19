class User {
  String id;
  String title;
  String name;
  DateTime dob;
  String gender;
  String profilePictureUrl;
  DateTime lastLogin;
  String organization;
  int contactNumber;
  List<String> languages;
  String emailAddress;
  String fcmToken;

  User(
    this.id,
    this.title,
    this.name,
    this.dob,
    this.gender,
    this.profilePictureUrl,
    this.lastLogin,
    this.organization,
    this.contactNumber,
    this.languages,
    this.emailAddress,
    this.fcmToken,
  );
}
