import 'package:mobi_plataforma_fatec/app/app_controller.dart';
import 'package:mobi_plataforma_fatec/app/modules/categorias/categorias_controller.dart';
import 'package:mobi_plataforma_fatec/app/modules/categorias/categorias_module.dart';
import 'package:mobi_plataforma_fatec/app/modules/categorias/repositories/categorias_repository.dart';
import 'package:mobi_plataforma_fatec/app/modules/vitrine/repositories/vitrine_repository.dart';
import 'package:mobi_plataforma_fatec/app/modules/vitrine/vitrine_controller.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:mobi_plataforma_fatec/app/app_widget.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
        Bind((i) => VitrineController(i.get())),
        Bind((i) => VitrineRepository(i.get())),
        Bind((i) => CategoriasController(i.get())),
        Bind((i) => CategoriasRepository(i.get())),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, module: CategoriasModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
