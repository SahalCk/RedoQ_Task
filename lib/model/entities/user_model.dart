class UserModel {
  final String userId;
  String userName;
  String userAge;
  final List<UserModel>? child;

  UserModel(
      {required this.userId,
      required this.userName,
      required this.userAge,
      this.child});
}
