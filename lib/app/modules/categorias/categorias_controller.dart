import 'package:mobi_plataforma_fatec/app/model/vitrine_model.dart';
import 'package:mobi_plataforma_fatec/app/modules/categorias/repositories/categorias_repository.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'categorias_controller.g.dart';

@Injectable()
class CategoriasController = _CategoriasControllerBase
    with _$CategoriasController;

abstract class _CategoriasControllerBase with Store {
  final CategoriasRepository repository;
  @observable
  String opcao = '0';

  @observable
  ObservableFuture<List<VitrineModel>> listvitrine;

  _CategoriasControllerBase(this.repository) {
    listvitrine = repository.getCategorias(opcao).asObservable();
  }

  @action
  void emprego() {
    opcao = '0';
    listvitrine = repository.getCategorias(opcao).asObservable();
  }

  @action
  void estagio() {
    opcao = '1';
    listvitrine = repository.getCategorias(opcao).asObservable();
  }
}
