// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unique_appointment_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UniqueAppointmentStore on _UniqueAppointmentStore, Store {
  late final _$loadingScreenAtom =
      Atom(name: '_UniqueAppointmentStore.loadingScreen', context: context);

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

  late final _$dataAppointmentAtom =
      Atom(name: '_UniqueAppointmentStore.dataAppointment', context: context);

  @override
  Map<String, dynamic> get dataAppointment {
    _$dataAppointmentAtom.reportRead();
    return super.dataAppointment;
  }

  @override
  set dataAppointment(Map<String, dynamic> value) {
    _$dataAppointmentAtom.reportWrite(value, super.dataAppointment, () {
      super.dataAppointment = value;
    });
  }

  late final _$fetchUniqueAppointmentAsyncAction = AsyncAction(
      '_UniqueAppointmentStore.fetchUniqueAppointment',
      context: context);

  @override
  Future<void> fetchUniqueAppointment(
      String codigo_paciente, String codigo_medico, String dia_mes_ano) {
    return _$fetchUniqueAppointmentAsyncAction.run(() => super
        .fetchUniqueAppointment(codigo_paciente, codigo_medico, dia_mes_ano));
  }

  late final _$deselectQueryAsyncAction =
      AsyncAction('_UniqueAppointmentStore.deselectQuery', context: context);

  @override
  Future<void> deselectQuery(
      String codigo_paciente, String codigo_medico, String dia_mes_ano) {
    return _$deselectQueryAsyncAction.run(
        () => super.deselectQuery(codigo_paciente, codigo_medico, dia_mes_ano));
  }

  @override
  String toString() {
    return '''
loadingScreen: ${loadingScreen},
dataAppointment: ${dataAppointment}
    ''';
  }
}
