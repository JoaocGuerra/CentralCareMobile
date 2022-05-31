// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointments_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AppointmentsStore on _AppointmentsStore, Store {
  late final _$loadingScreenAtom =
      Atom(name: '_AppointmentsStore.loadingScreen', context: context);

  @override
  bool get loadingScreen {
    _$loadingScreenAtom.reportRead();
    return super.loadingScreen;
  }

  @override
  set loadingScreen(bool value) {
    _$loadingScreenAtom.reportWrite(value, super.loadingScreen, () {
      super.loadingScreen = value;
    });
  }

  late final _$listAppointmentsProgressAtom = Atom(
      name: '_AppointmentsStore.listAppointmentsProgress', context: context);

  @override
  List<dynamic> get listAppointmentsProgress {
    _$listAppointmentsProgressAtom.reportRead();
    return super.listAppointmentsProgress;
  }

  @override
  set listAppointmentsProgress(List<dynamic> value) {
    _$listAppointmentsProgressAtom
        .reportWrite(value, super.listAppointmentsProgress, () {
      super.listAppointmentsProgress = value;
    });
  }

  late final _$listAppointmentsCompletedAtom = Atom(
      name: '_AppointmentsStore.listAppointmentsCompleted', context: context);

  @override
  List<dynamic> get listAppointmentsCompleted {
    _$listAppointmentsCompletedAtom.reportRead();
    return super.listAppointmentsCompleted;
  }

  @override
  set listAppointmentsCompleted(List<dynamic> value) {
    _$listAppointmentsCompletedAtom
        .reportWrite(value, super.listAppointmentsCompleted, () {
      super.listAppointmentsCompleted = value;
    });
  }

  late final _$listAppointmentsAtom =
      Atom(name: '_AppointmentsStore.listAppointments', context: context);

  @override
  List<dynamic> get listAppointments {
    _$listAppointmentsAtom.reportRead();
    return super.listAppointments;
  }

  @override
  set listAppointments(List<dynamic> value) {
    _$listAppointmentsAtom.reportWrite(value, super.listAppointments, () {
      super.listAppointments = value;
    });
  }

  late final _$fetchAppointmentsAsyncAction =
      AsyncAction('_AppointmentsStore.fetchAppointments', context: context);

  @override
  Future<void> fetchAppointments() {
    return _$fetchAppointmentsAsyncAction.run(() => super.fetchAppointments());
  }

  @override
  String toString() {
    return '''
loadingScreen: ${loadingScreen},
listAppointmentsProgress: ${listAppointmentsProgress},
listAppointmentsCompleted: ${listAppointmentsCompleted},
listAppointments: ${listAppointments}
    ''';
  }
}
