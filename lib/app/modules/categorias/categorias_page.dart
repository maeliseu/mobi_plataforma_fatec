import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobi_plataforma_fatec/app/constants/constant.dart';
import 'package:mobi_plataforma_fatec/app/modules/categorias/categorias_controller.dart';
import 'package:mobi_plataforma_fatec/app/modules/categorias/services/categorias_service.dart';

class CategoriasPage extends StatefulWidget {
  final String title;
  const CategoriasPage({Key key, this.title = "Categorias"}) : super(key: key);

  @override
  _CategoriasPageState createState() => _CategoriasPageState();
}

class _CategoriasPageState extends State<CategoriasPage> {
  final service = CategoriasService();

  final categoriasController = Modular.get<CategoriasController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        bottom: PreferredSize(
          preferredSize: Size.square(28.0),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                RaisedButton(
                  onPressed: () {
                    print('emprego press');
                    categoriasController.emprego();
                  },
                  child: new Text("Emprego"),
                ),
                RaisedButton(
                  onPressed: () {
                    print('estagio press');
                    categoriasController.estagio();
                  },
                  child: new Text("Estágio"),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Observer(builder: (_) {
        if (categoriasController.listvitrine.error != null) {
          return Center(child: Text('Erro'));
        } else if (categoriasController.listvitrine.status.toString() !=
            'FutureStatus.fulfilled') {
          return Center(
              child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          ));
        } else {
          var list = categoriasController.listvitrine.value;

          return ListView.builder(
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 6,
                  child: ClipPath(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          left: BorderSide(
                            color: Colors.blueAccent,
                            width: 8,
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(list[index].tipoVaga,
                                  style: TextStyle(
                                      fontFamily: 'Nunito',
                                      fontSize: 24,
                                      fontWeight: FontWeight.w900)),
                              SizedBox(
                                height: 8,
                              ),
                              Divider(height: 1, color: kDisabledColor),
                              SizedBox(
                                height: 16,
                              ),
                              Text('Aluno: ${list[index].aluno}',
                                  style: TextStyle(
                                      fontFamily: 'Nunito',
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500)),
                              SizedBox(
                                height: 8,
                              ),
                              Text('Curso: ${list[index].curso}',
                                  style: TextStyle(
                                      fontFamily: 'Nunito',
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500)),
                              SizedBox(
                                height: 16,
                              ),
                              Text(list[index].descricao,
                                  style: TextStyle(fontFamily: 'Nunito')),
                              ButtonBar(
                                children: [
                                  (list[index].linkedin.isNotEmpty)
                                      ? IconButton(
                                          icon: Icon(
                                            FontAwesomeIcons.linkedin,
                                            color: kPrimaryColor,
                                          ),
                                          onPressed: () {
                                            var url = list[index].linkedin;
                                            service.launchUrl(url);
                                          })
                                      : Text(""),
                                  (list[index].github.isNotEmpty)
                                      ? IconButton(
                                          icon: Icon(
                                            FontAwesomeIcons.github,
                                            color: kPrimaryColor,
                                          ),
                                          onPressed: () {
                                            if (list[index].github.isNotEmpty) {
                                              var url = list[index].github;
                                              service.launchUrl(url);
                                            }
                                          },
                                        )
                                      : Text(""),
                                ],
                              )
                            ]),
                      ),
                    ),
                    clipper: ShapeBorderClipper(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        }
      }),
    );
  }
}
