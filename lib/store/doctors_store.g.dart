// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctors_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DoctorsStore on _DoctorsStore, Store {
  late final _$loadingAtom =
      Atom(name: '_DoctorsStore.loading', context: context);

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

  late final _$doctorNamesAtom =
      Atom(name: '_DoctorsStore.doctorNames', context: context);

  @override
  List<String> get doctorNames {
    _$doctorNamesAtom.reportRead();
    return super.doctorNames;
  }

  @override
  set doctorNames(List<String> value) {
    _$doctorNamesAtom.reportWrite(value, super.doctorNames, () {
      super.doctorNames = value;
    });
  }

  late final _$doctorIDAtom =
      Atom(name: '_DoctorsStore.doctorID', context: context);

  @override
  List<String> get doctorID {
    _$doctorIDAtom.reportRead();
    return super.doctorID;
  }

  @override
  set doctorID(List<String> value) {
    _$doctorIDAtom.reportWrite(value, super.doctorID, () {
      super.doctorID = value;
    });
  }

  late final _$fetchDoctorsAsyncAction =
      AsyncAction('_DoctorsStore.fetchDoctors', context: context);

  @override
  Future<void> fetchDoctors() {
    return _$fetchDoctorsAsyncAction.run(() => super.fetchDoctors());
  }

  @override
  String toString() {
    return '''
loading: ${loading},
doctorNames: ${doctorNames},
doctorID: ${doctorID}
    ''';
  }
}
