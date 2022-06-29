// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'marcar_consulta_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MarcarConsultaStore on _MarcarConsultaStore, Store {
  Computed<bool>? _$isFilledComputed;

  @override
  bool get isFilled =>
      (_$isFilledComputed ??= Computed<bool>(() => super.isFilled,
              name: '_MarcarConsultaStore.isFilled'))
          .value;

  late final _$selectedSpecialtyAtom =
      Atom(name: '_MarcarConsultaStore.selectedSpecialty', context: context);

  @override
  List<dynamic> get selectedSpecialty {
    _$selectedSpecialtyAtom.reportRead();
    return super.selectedSpecialty;
  }

  @override
  set selectedSpecialty(List<dynamic> value) {
    _$selectedSpecialtyAtom.reportWrite(value, super.selectedSpecialty, () {
      super.selectedSpecialty = value;
    });
  }

  late final _$selectedDoctorAtom =
      Atom(name: '_MarcarConsultaStore.selectedDoctor', context: context);

  @override
  String get selectedDoctor {
    _$selectedDoctorAtom.reportRead();
    return super.selectedDoctor;
  }

  @override
  set selectedDoctor(String value) {
    _$selectedDoctorAtom.reportWrite(value, super.selectedDoctor, () {
      super.selectedDoctor = value;
    });
  }

  late final _$nameDoctorAtom =
      Atom(name: '_MarcarConsultaStore.nameDoctor', context: context);

  @override
  String get nameDoctor {
    _$nameDoctorAtom.reportRead();
    return super.nameDoctor;
  }

  @override
  set nameDoctor(String value) {
    _$nameDoctorAtom.reportWrite(value, super.nameDoctor, () {
      super.nameDoctor = value;
    });
  }

  late final _$specialtyDoctorAtom =
      Atom(name: '_MarcarConsultaStore.specialtyDoctor', context: context);

  @override
  String get specialtyDoctor {
    _$specialtyDoctorAtom.reportRead();
    return super.specialtyDoctor;
  }

  @override
  set specialtyDoctor(String value) {
    _$specialtyDoctorAtom.reportWrite(value, super.specialtyDoctor, () {
      super.specialtyDoctor = value;
    });
  }

  late final _$selectedDateAtom =
      Atom(name: '_MarcarConsultaStore.selectedDate', context: context);

  @override
  String get selectedDate {
    _$selectedDateAtom.reportRead();
    return super.selectedDate;
  }

  @override
  set selectedDate(String value) {
    _$selectedDateAtom.reportWrite(value, super.selectedDate, () {
      super.selectedDate = value;
    });
  }

  late final _$selectedHourAtom =
      Atom(name: '_MarcarConsultaStore.selectedHour', context: context);

  @override
  String get selectedHour {
    _$selectedHourAtom.reportRead();
    return super.selectedHour;
  }

  @override
  set selectedHour(String value) {
    _$selectedHourAtom.reportWrite(value, super.selectedHour, () {
      super.selectedHour = value;
    });
  }

  late final _$appointmentScheduledAtom =
      Atom(name: '_MarcarConsultaStore.appointmentScheduled', context: context);

  @override
  bool get appointmentScheduled {
    _$appointmentScheduledAtom.reportRead();
    return super.appointmentScheduled;
  }

  @override
  set appointmentScheduled(bool value) {
    _$appointmentScheduledAtom.reportWrite(value, super.appointmentScheduled,
        () {
      super.appointmentScheduled = value;
    });
  }

  late final _$loadingNewAppointmentPageAtom = Atom(
      name: '_MarcarConsultaStore.loadingNewAppointmentPage', context: context);

  @override
  bool get loadingNewAppointmentPage {
    _$loadingNewAppointmentPageAtom.reportRead();
    return super.loadingNewAppointmentPage;
  }

  @override
  set loadingNewAppointmentPage(bool value) {
    _$loadingNewAppointmentPageAtom
        .reportWrite(value, super.loadingNewAppointmentPage, () {
      super.loadingNewAppointmentPage = value;
    });
  }

  late final _$insertQueueAsyncAction =
      AsyncAction('_MarcarConsultaStore.insertQueue', context: context);

  @override
  Future<void> insertQueue() {
    return _$insertQueueAsyncAction.run(() => super.insertQueue());
  }

  late final _$_MarcarConsultaStoreActionController =
      ActionController(name: '_MarcarConsultaStore', context: context);

  @override
  void setSelectedSpecialty(List<dynamic> value) {
    final _$actionInfo = _$_MarcarConsultaStoreActionController.startAction(
        name: '_MarcarConsultaStore.setSelectedSpecialty');
    try {
      return super.setSelectedSpecialty(value);
    } finally {
      _$_MarcarConsultaStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelectedDoctor(String value) {
    final _$actionInfo = _$_MarcarConsultaStoreActionController.startAction(
        name: '_MarcarConsultaStore.setSelectedDoctor');
    try {
      return super.setSelectedDoctor(value);
    } finally {
      _$_MarcarConsultaStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setNameDoctor(String value) {
    final _$actionInfo = _$_MarcarConsultaStoreActionController.startAction(
        name: '_MarcarConsultaStore.setNameDoctor');
    try {
      return super.setNameDoctor(value);
    } finally {
      _$_MarcarConsultaStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSpecialtyDoctor(String value) {
    final _$actionInfo = _$_MarcarConsultaStoreActionController.startAction(
        name: '_MarcarConsultaStore.setSpecialtyDoctor');
    try {
      return super.setSpecialtyDoctor(value);
    } finally {
      _$_MarcarConsultaStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelectedDate(String value) {
    final _$actionInfo = _$_MarcarConsultaStoreActionController.startAction(
        name: '_MarcarConsultaStore.setSelectedDate');
    try {
      return super.setSelectedDate(value);
    } finally {
      _$_MarcarConsultaStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelectedHour(String value) {
    final _$actionInfo = _$_MarcarConsultaStoreActionController.startAction(
        name: '_MarcarConsultaStore.setSelectedHour');
    try {
      return super.setSelectedHour(value);
    } finally {
      _$_MarcarConsultaStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAppointmentScheduled(bool value) {
    final _$actionInfo = _$_MarcarConsultaStoreActionController.startAction(
        name: '_MarcarConsultaStore.setAppointmentScheduled');
    try {
      return super.setAppointmentScheduled(value);
    } finally {
      _$_MarcarConsultaStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearFieldsSpecialty() {
    final _$actionInfo = _$_MarcarConsultaStoreActionController.startAction(
        name: '_MarcarConsultaStore.clearFieldsSpecialty');
    try {
      return super.clearFieldsSpecialty();
    } finally {
      _$_MarcarConsultaStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearFieldsDoctor() {
    final _$actionInfo = _$_MarcarConsultaStoreActionController.startAction(
        name: '_MarcarConsultaStore.clearFieldsDoctor');
    try {
      return super.clearFieldsDoctor();
    } finally {
      _$_MarcarConsultaStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearFieldsDate() {
    final _$actionInfo = _$_MarcarConsultaStoreActionController.startAction(
        name: '_MarcarConsultaStore.clearFieldsDate');
    try {
      return super.clearFieldsDate();
    } finally {
      _$_MarcarConsultaStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<bool> clearAllFields() {
    final _$actionInfo = _$_MarcarConsultaStoreActionController.startAction(
        name: '_MarcarConsultaStore.clearAllFields');
    try {
      return super.clearAllFields();
    } finally {
      _$_MarcarConsultaStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedSpecialty: ${selectedSpecialty},
selectedDoctor: ${selectedDoctor},
nameDoctor: ${nameDoctor},
specialtyDoctor: ${specialtyDoctor},
selectedDate: ${selectedDate},
selectedHour: ${selectedHour},
appointmentScheduled: ${appointmentScheduled},
loadingNewAppointmentPage: ${loadingNewAppointmentPage},
isFilled: ${isFilled}
    ''';
  }
}
