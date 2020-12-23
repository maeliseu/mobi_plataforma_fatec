import 'package:flutter_modular/flutter_modular.dart';

abstract class IcategoriasRepository implements Disposable {
  Future getCategorias(String opcao);
}
