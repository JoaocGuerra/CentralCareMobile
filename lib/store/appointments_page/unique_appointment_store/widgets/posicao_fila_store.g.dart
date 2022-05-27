// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'posicao_fila_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PosicaoFilaStore on _PosicaoFilaStore, Store {
  late final _$loadingAtom =
      Atom(name: '_PosicaoFilaStore.loading', context: context);

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

  late final _$statusAtom =
      Atom(name: '_PosicaoFilaStore.status', context: context);

  @override
  String get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(String value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  late final _$fetchPositionQueueAsyncAction =
      AsyncAction('_PosicaoFilaStore.fetchPositionQueue', context: context);

  @override
  Future<void> fetchPositionQueue(
      String codigoMedico, String diaMesAno, String codigoPaciente) {
    return _$fetchPositionQueueAsyncAction.run(() =>
        super.fetchPositionQueue(codigoMedico, diaMesAno, codigoPaciente));
  }

  @override
  String toString() {
    return '''
loading: ${loading},
status: ${status}
    ''';
  }
}
