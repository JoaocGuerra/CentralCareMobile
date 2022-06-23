// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserStore on _UserStore, Store {
  late final _$loadingAtom = Atom(name: '_UserStore.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$dataUserAtom =
      Atom(name: '_UserStore.dataUser', context: context);

  @override
  UserModel? get dataUser {
    _$dataUserAtom.reportRead();
    return super.dataUser;
  }

  @override
  set dataUser(UserModel? value) {
    _$dataUserAtom.reportWrite(value, super.dataUser, () {
      super.dataUser = value;
    });
  }

  late final _$updateUserAsyncAction =
      AsyncAction('_UserStore.updateUser', context: context);

  @override
  Future<void> updateUser() {
    return _$updateUserAsyncAction.run(() => super.updateUser());
  }

  late final _$_UserStoreActionController =
      ActionController(name: '_UserStore', context: context);

  @override
  Future<bool> clearAllFields() {
    final _$actionInfo = _$_UserStoreActionController.startAction(
        name: '_UserStore.clearAllFields');
    try {
      return super.clearAllFields();
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
dataUser: ${dataUser}
    ''';
  }
}
