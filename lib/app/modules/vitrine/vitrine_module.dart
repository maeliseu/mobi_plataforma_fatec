import 'package:dio/dio.dart';
import 'package:mobi_plataforma_fatec/app/app_controller.dart';

import 'repositories/vitrine_repository.dart';
import 'vitrine_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'vitrine_page.dart';

class VitrineModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
        Bind((i) => VitrineController(i.get())),
        Bind((i) => VitrineRepository(i.get())),
        Bind((i) => Dio()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => VitrinePage()),
      ];

  static Inject get to => Inject<VitrineModule>.of();
}
