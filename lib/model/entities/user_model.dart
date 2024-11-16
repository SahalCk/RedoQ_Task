class UserModel {
  final String userId;
  final String userName;
  final String userAge;
  final List<UserModel>? child;

  UserModel(
      {required this.userId,
      required this.userName,
      required this.userAge,
      this.child});
}
