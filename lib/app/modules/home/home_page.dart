import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobi_plataforma_fatec/app/modules/categorias/categorias_module.dart';
import 'package:mobi_plataforma_fatec/app/modules/vitrine/vitrine_module.dart';
import 'home_controller.dart';
import 'package:mobi_plataforma_fatec/app/modules/home/subpages/squad/squad_page.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Mitrídates"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
          controller: controller.pageViewController,
          children: [
            RouterOutlet(module: VitrineModule()),
            RouterOutlet(module: CategoriasModule()),
            SquadPage(),
          ],
        ),
        bottomNavigationBar: AnimatedBuilder(
            animation: controller.pageViewController,
            builder: (context, snapshot) {
              return BottomNavigationBar(
                  currentIndex:
                      controller.pageViewController?.page?.round() ?? 0,
                  onTap: (index) {
                    controller.pageViewController.jumpToPage(index);
                  },
                  items: [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: 'Vitrine',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.category),
                      label: 'Categorias',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.shield),
                      label: 'Saquad',
                    ),
                  ]);
            }));
  }
}
