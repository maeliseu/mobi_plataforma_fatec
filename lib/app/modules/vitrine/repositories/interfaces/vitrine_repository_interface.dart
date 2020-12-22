import 'package:flutter_modular/flutter_modular.dart';

abstract class IVitrineRepository implements Disposable {
  Future getAll();
}
