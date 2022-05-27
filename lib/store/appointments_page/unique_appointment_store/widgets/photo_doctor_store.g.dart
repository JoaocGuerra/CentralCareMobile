// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_doctor_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PhotoDoctorStore on _PhotoDoctorStore, Store {
  late final _$loadingAtom =
      Atom(name: '_PhotoDoctorStore.loading', context: context);

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

  late final _$linkPhotoAtom =
      Atom(name: '_PhotoDoctorStore.linkPhoto', context: context);

  @override
  String get linkPhoto {
    _$linkPhotoAtom.reportRead();
    return super.linkPhoto;
  }

  @override
  set linkPhoto(String value) {
    _$linkPhotoAtom.reportWrite(value, super.linkPhoto, () {
      super.linkPhoto = value;
    });
  }

  late final _$fetchPhotoDoctorAsyncAction =
      AsyncAction('_PhotoDoctorStore.fetchPhotoDoctor', context: context);

  @override
  Future<void> fetchPhotoDoctor(String codigoMedico) {
    return _$fetchPhotoDoctorAsyncAction
        .run(() => super.fetchPhotoDoctor(codigoMedico));
  }

  @override
  String toString() {
    return '''
loading: ${loading},
linkPhoto: ${linkPhoto}
    ''';
  }
}
