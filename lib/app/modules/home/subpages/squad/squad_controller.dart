import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'squad_controller.g.dart';

@Injectable()
class SquadController = _SquadControllerBase with _$SquadController;

abstract class _SquadControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
