import 'subpages/squad/squad_controller.dart';
import 'package:mobi_plataforma_fatec/app/app_controller.dart';

import 'home_controller.dart';
import 'home_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => SquadController()),
        Bind((i) => AppController()),
        Bind((i) => HomeController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => HomePage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
