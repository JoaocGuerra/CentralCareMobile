// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'especialidades_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$EspecialidadesStore on _EspecialidadesStore, Store {
  late final _$dataSpecialtysAtom =
      Atom(name: '_EspecialidadesStore.dataSpecialtys', context: context);

  @override
  List<String> get dataSpecialtys {
    _$dataSpecialtysAtom.reportRead();
    return super.dataSpecialtys;
  }

  @override
  set dataSpecialtys(List<String> value) {
    _$dataSpecialtysAtom.reportWrite(value, super.dataSpecialtys, () {
      super.dataSpecialtys = value;
    });
  }

  late final _$mapSpecialtyAtom =
      Atom(name: '_EspecialidadesStore.mapSpecialty', context: context);

  @override
  Map<String, dynamic> get mapSpecialty {
    _$mapSpecialtyAtom.reportRead();
    return super.mapSpecialty;
  }

  @override
  set mapSpecialty(Map<String, dynamic> value) {
    _$mapSpecialtyAtom.reportWrite(value, super.mapSpecialty, () {
      super.mapSpecialty = value;
    });
  }

  late final _$fetchSpecialtyAsyncAction =
      AsyncAction('_EspecialidadesStore.fetchSpecialty', context: context);

  @override
  Future<void> fetchSpecialty() {
    return _$fetchSpecialtyAsyncAction.run(() => super.fetchSpecialty());
  }

  @override
  String toString() {
    return '''
dataSpecialtys: ${dataSpecialtys},
mapSpecialty: ${mapSpecialty}
    ''';
  }
}
