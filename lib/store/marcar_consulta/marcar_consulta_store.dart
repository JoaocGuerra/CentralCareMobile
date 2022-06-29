import 'package:centralcaremobile/repository/api/insert_queue_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';

part 'marcar_consulta_store.g.dart';

class MarcarConsultaStore = _MarcarConsultaStore with _$MarcarConsultaStore;

abstract class _MarcarConsultaStore with Store {
  @observable
  List<dynamic> selectedSpecialty = <dynamic>[];

  @action
  void setSelectedSpecialty(List<dynamic> value) {
    selectedSpecialty = value;
  }

  @observable
  String selectedDoctor = "";

  @action
  void setSelectedDoctor(String value) {
    selectedDoctor = value;
  }

  @observable
  String nameDoctor = "";

  @action
  void setNameDoctor(String value) {
    nameDoctor = value;
  }

  @observable
  String specialtyDoctor = "";

  @action
  void setSpecialtyDoctor(String value) {
    specialtyDoctor = value;
  }

  @observable
  String selectedDate = "";

  @action
  void setSelectedDate(String value) {
    selectedDate = value;
  }

  @observable
  String selectedHour = "";

  @action
  void setSelectedHour(String value) {
    selectedHour = value;
  }

  @observable
  bool appointmentScheduled = false;

  @action
  void setAppointmentScheduled(bool value) {
    appointmentScheduled = value;
  }

  @observable
  bool loadingNewAppointmentPage = false;

  @computed
  bool get isFilled {
    if ((selectedSpecialty.isEmpty) ||
        (selectedDoctor.isEmpty) ||
        (selectedDate.isEmpty) ||
        (selectedHour.isEmpty)) {
      return false;
    }
    return true;
  }

  @action
  void clearFieldsSpecialty() {
    setSelectedDoctor("");
    setNameDoctor("");
    setSelectedDate("");
    setSelectedHour("");
  }

  @action
  void clearFieldsDoctor() {
    setSelectedDate("");
    setSelectedHour("");
  }

  @action
  void clearFieldsDate() {
    setSelectedHour("");
  }

  @action
  Future<bool> clearAllFields() {
    setSelectedSpecialty([]);
    setSelectedDoctor("");
    setNameDoctor("");
    setSpecialtyDoctor("");
    setSelectedDate("");
    setSelectedHour("");
    return Future.value(true);
  }

  @action
  Future<void> insertQueue() async {
    try {
      loadingNewAppointmentPage = true;
      await InsertQueueRepository().insertQueue();
      loadingNewAppointmentPage = false;
    } catch (e) {
      loadingNewAppointmentPage = false;
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
