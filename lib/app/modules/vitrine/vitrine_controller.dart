import 'package:mobi_plataforma_fatec/app/model/vitrine_model.dart';
import 'package:mobi_plataforma_fatec/app/modules/vitrine/repositories/vitrine_repository.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'vitrine_controller.g.dart';

@Injectable()
class VitrineController = _VitrineControllerBase with _$VitrineController;

abstract class _VitrineControllerBase with Store {
  final VitrineRepository repository;

  @observable
  ObservableFuture<List<VitrineModel>> listvitrine;

  _VitrineControllerBase(this.repository) {
    listvitrine = repository.getAll().asObservable();
  }

  @action
  void refresh() {
    listvitrine = repository.getAll().asObservable();
  }
}
