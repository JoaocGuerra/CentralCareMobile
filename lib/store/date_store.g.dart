// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'date_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DateStore on _DateStore, Store {
  late final _$loadingAtom = Atom(name: '_DateStore.loading', context: context);

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

  late final _$doctorDatesAtom =
      Atom(name: '_DateStore.doctorDates', context: context);

  @override
  List<String> get doctorDates {
    _$doctorDatesAtom.reportRead();
    return super.doctorDates;
  }

  @override
  set doctorDates(List<String> value) {
    _$doctorDatesAtom.reportWrite(value, super.doctorDates, () {
      super.doctorDates = value;
    });
  }

  late final _$mapDoctorDatesAtom =
      Atom(name: '_DateStore.mapDoctorDates', context: context);

  @override
  Map<String, dynamic> get mapDoctorDates {
    _$mapDoctorDatesAtom.reportRead();
    return super.mapDoctorDates;
  }

  @override
  set mapDoctorDates(Map<String, dynamic> value) {
    _$mapDoctorDatesAtom.reportWrite(value, super.mapDoctorDates, () {
      super.mapDoctorDates = value;
    });
  }

  late final _$fetchDateAsyncAction =
      AsyncAction('_DateStore.fetchDate', context: context);

  @override
  Future<void> fetchDate() {
    return _$fetchDateAsyncAction.run(() => super.fetchDate());
  }

  @override
  String toString() {
    return '''
loading: ${loading},
doctorDates: ${doctorDates},
mapDoctorDates: ${mapDoctorDates}
    ''';
  }
}
