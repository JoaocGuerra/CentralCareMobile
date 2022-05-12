import 'package:firebase_auth/firebase_auth.dart';

class CurrentUser {
  String? getUserName() {
    return "TODO";
  }

  String? getUserEmail() {
    if (FirebaseAuth.instance.currentUser != null) {
      return FirebaseAuth.instance.currentUser?.email.toString();
    } else {
      return "No user logged";
    }
  }

  String? getUserDateBirthday() {
    return "TODO";
  }

  String? getUserSex() {
    return "TODO";
  }
}
