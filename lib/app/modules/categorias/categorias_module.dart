import 'package:dio/dio.dart';
import 'package:mobi_plataforma_fatec/app/app_controller.dart';

import 'repositories/categorias_repository.dart';
import 'categorias_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'categorias_page.dart';

class CategoriasModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
        Bind((i) => CategoriasController(i.get())),
        Bind((i) => CategoriasRepository(i.get())),
        Bind((i) => Dio()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => CategoriasPage()),
      ];

  static Inject get to => Inject<CategoriasModule>.of();
}
