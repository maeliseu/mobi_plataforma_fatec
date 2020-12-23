import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobi_plataforma_fatec/app/constants/constant.dart';
import 'package:mobi_plataforma_fatec/app/modules/vitrine/services/vitrine_service.dart';
import 'package:mobi_plataforma_fatec/app/modules/vitrine/vitrine_controller.dart';

class VitrinePage extends StatefulWidget {
  final String title;
  const VitrinePage({Key key, this.title = "Vitrine"}) : super(key: key);

  @override
  _VitrinePageState createState() => _VitrinePageState();
}

class _VitrinePageState extends State<VitrinePage> {
  final service = VitrineService();

  final vitrineController = Modular.get<VitrineController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title), actions: [
        IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              vitrineController.refresh();
            })
      ]),
      body: Observer(builder: (_) {
        if (vitrineController.listvitrine.error != null) {
          return Center(child: Text('Erro'));
        } else if (vitrineController.listvitrine.status.toString() !=
            'FutureStatus.fulfilled') {
          return Center(
              child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          ));
        } else {
          var list = vitrineController.listvitrine.value;

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
