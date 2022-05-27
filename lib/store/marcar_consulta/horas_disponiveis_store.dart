import 'package:centralcaremobile/repository/api/hours_repository.dart';
import 'package:mobx/mobx.dart';
part 'horas_disponiveis_store.g.dart';

class HorasDisponiveisStore = _HorasDisponiveisStore with _$HorasDisponiveisStore;

abstract class _HorasDisponiveisStore with Store {

  @observable
  bool loading = true;

  @observable
  List<String> dataHoursDoctor = [];

  @action
  Future<void> fetchHoursDoctor(String doctor, String date) async {

    dataHoursDoctor = [];

    try{
      loading = true;
      final result = await HoursRepository().fetchHoursDoctor(doctor, date);

      int? tamanhoDoctorHours = result.length;

      for(int i=0; i < tamanhoDoctorHours ; i++){
        dataHoursDoctor = List.from(dataHoursDoctor..add(result[i]));
      }

      loading = false;
    }catch (e){
      loading = false;
      print(e);
    }
  }


}