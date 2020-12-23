// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vitrine_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $VitrineController = BindInject(
  (i) => VitrineController(i<VitrineRepository>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$VitrineController on _VitrineControllerBase, Store {
  final _$listvitrineAtom = Atom(name: '_VitrineControllerBase.listvitrine');

  @override
  ObservableFuture<List<VitrineModel>> get listvitrine {
    _$listvitrineAtom.reportRead();
    return super.listvitrine;
  }

  @override
  set listvitrine(ObservableFuture<List<VitrineModel>> value) {
    _$listvitrineAtom.reportWrite(value, super.listvitrine, () {
      super.listvitrine = value;
    });
  }

  final _$_VitrineControllerBaseActionController =
      ActionController(name: '_VitrineControllerBase');

  @override
  void refresh() {
    final _$actionInfo = _$_VitrineControllerBaseActionController.startAction(
        name: '_VitrineControllerBase.refresh');
    try {
      return super.refresh();
    } finally {
      _$_VitrineControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listvitrine: ${listvitrine}
    ''';
  }
}
