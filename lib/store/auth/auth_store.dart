import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStore with _$AuthStore;

abstract class _AuthStore with Store {

  @observable
  User? user;

  @observable
  String? userId;

  @action
  setUser(User user){
    this.user = user;
  }

  @action
  Future<void> fetchUser()async {
    user = FirebaseAuth.instance.currentUser;
    FirebaseAuth.instance.authStateChanges().listen((snapshot) {
      if(snapshot?.uid!=null){
        userId = snapshot?.uid;
      }
    });
  }

}