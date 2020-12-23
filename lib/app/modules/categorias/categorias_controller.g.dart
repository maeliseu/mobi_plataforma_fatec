// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categorias_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $CategoriasController = BindInject(
  (i) => CategoriasController(i<CategoriasRepository>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CategoriasController on _CategoriasControllerBase, Store {
  final _$opcaoAtom = Atom(name: '_CategoriasControllerBase.opcao');

  @override
  String get opcao {
    _$opcaoAtom.reportRead();
    return super.opcao;
  }

  @override
  set opcao(String value) {
    _$opcaoAtom.reportWrite(value, super.opcao, () {
      super.opcao = value;
    });
  }

  final _$listvitrineAtom = Atom(name: '_CategoriasControllerBase.listvitrine');

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

  final _$_CategoriasControllerBaseActionController =
      ActionController(name: '_CategoriasControllerBase');

  @override
  void emprego() {
    final _$actionInfo = _$_CategoriasControllerBaseActionController
        .startAction(name: '_CategoriasControllerBase.emprego');
    try {
      return super.emprego();
    } finally {
      _$_CategoriasControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void estagio() {
    final _$actionInfo = _$_CategoriasControllerBaseActionController
        .startAction(name: '_CategoriasControllerBase.estagio');
    try {
      return super.estagio();
    } finally {
      _$_CategoriasControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
opcao: ${opcao},
listvitrine: ${listvitrine}
    ''';
  }
}
