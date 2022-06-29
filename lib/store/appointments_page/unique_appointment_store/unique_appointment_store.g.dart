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

  late final _$codigoPacienteAtom =
      Atom(name: '_UniqueAppointmentStore.codigoPaciente', context: context);

  @override
  String get codigoPaciente {
    _$codigoPacienteAtom.reportRead();
    return super.codigoPaciente;
  }

  @override
  set codigoPaciente(String value) {
    _$codigoPacienteAtom.reportWrite(value, super.codigoPaciente, () {
      super.codigoPaciente = value;
    });
  }

  late final _$codigoMedicoAtom =
      Atom(name: '_UniqueAppointmentStore.codigoMedico', context: context);

  @override
  String get codigoMedico {
    _$codigoMedicoAtom.reportRead();
    return super.codigoMedico;
  }

  @override
  set codigoMedico(String value) {
    _$codigoMedicoAtom.reportWrite(value, super.codigoMedico, () {
      super.codigoMedico = value;
    });
  }

  late final _$diaMesAnoAtom =
      Atom(name: '_UniqueAppointmentStore.diaMesAno', context: context);

  @override
  String get diaMesAno {
    _$diaMesAnoAtom.reportRead();
    return super.diaMesAno;
  }

  @override
  set diaMesAno(String value) {
    _$diaMesAnoAtom.reportWrite(value, super.diaMesAno, () {
      super.diaMesAno = value;
    });
  }

  late final _$changeHoursAtom =
      Atom(name: '_UniqueAppointmentStore.changeHours', context: context);

  @override
  bool get changeHours {
    _$changeHoursAtom.reportRead();
    return super.changeHours;
  }

  @override
  set changeHours(bool value) {
    _$changeHoursAtom.reportWrite(value, super.changeHours, () {
      super.changeHours = value;
    });
  }

  late final _$newHourIniAtom =
      Atom(name: '_UniqueAppointmentStore.newHourIni', context: context);

  @override
  String get newHourIni {
    _$newHourIniAtom.reportRead();
    return super.newHourIni;
  }

  @override
  set newHourIni(String value) {
    _$newHourIniAtom.reportWrite(value, super.newHourIni, () {
      super.newHourIni = value;
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
      String codigoPaciente, String codigoMedico, String diaMesAno) {
    return _$fetchUniqueAppointmentAsyncAction.run(() =>
        super.fetchUniqueAppointment(codigoPaciente, codigoMedico, diaMesAno));
  }

  late final _$updateHourAsyncAction =
      AsyncAction('_UniqueAppointmentStore.updateHour', context: context);

  @override
  Future<void> updateHour() {
    return _$updateHourAsyncAction.run(() => super.updateHour());
  }

  late final _$deselectQueryAsyncAction =
      AsyncAction('_UniqueAppointmentStore.deselectQuery', context: context);

  @override
  Future<void> deselectQuery(
      String codigoPaciente, String codigoMedico, String diaMesAno) {
    return _$deselectQueryAsyncAction.run(
        () => super.deselectQuery(codigoPaciente, codigoMedico, diaMesAno));
  }

  late final _$_UniqueAppointmentStoreActionController =
      ActionController(name: '_UniqueAppointmentStore', context: context);

  @override
  void setChangeHours(bool value) {
    final _$actionInfo = _$_UniqueAppointmentStoreActionController.startAction(
        name: '_UniqueAppointmentStore.setChangeHours');
    try {
      return super.setChangeHours(value);
    } finally {
      _$_UniqueAppointmentStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelectedHour(String hour) {
    final _$actionInfo = _$_UniqueAppointmentStoreActionController.startAction(
        name: '_UniqueAppointmentStore.setSelectedHour');
    try {
      return super.setSelectedHour(hour);
    } finally {
      _$_UniqueAppointmentStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loadingScreen: ${loadingScreen},
codigoPaciente: ${codigoPaciente},
codigoMedico: ${codigoMedico},
diaMesAno: ${diaMesAno},
changeHours: ${changeHours},
newHourIni: ${newHourIni},
dataAppointment: ${dataAppointment}
    ''';
  }
}
