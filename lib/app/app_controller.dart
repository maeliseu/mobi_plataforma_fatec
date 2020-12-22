import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'app_controller.g.dart';

@Injectable()
class AppController = _AppControllerBase with _$AppController;

abstract class _AppControllerBase with Store {
  final kPrimaryColor = Color(0xFF4e73df);
  final kPrimaryColorDark = Color(0xFF3B56A8);
  final kDisabledColor = Colors.grey.shade500;
  final kBackgroundColor = Color(0xFF858796);
  final kTextStylePadaro = TextStyle(color: Colors.amber);

  // @observable
  // int value = 0;

  // @action
  // void increment() {
  //   value++;
  // }
}
