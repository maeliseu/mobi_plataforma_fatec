import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobi_plataforma_fatec/app/model/vitrine_model.dart';
import 'package:mobi_plataforma_fatec/app/modules/categorias/repositories/interfaces/categorias_repository_interface.dart';

part 'categorias_repository.g.dart';

@Injectable()
class CategoriasRepository implements IcategoriasRepository {
  final Dio dio;

  CategoriasRepository(this.dio);

  Future<List<VitrineModel>> getCategorias(String opicao) async {
    // var response = await dio.get('http://18.231.178.234/api/vitrine/');
    Response response;
    List list;
    response = await dio.get(
        'https://plataforma-fatec-araras-api.herokuapp.com/api/vitrine/tipo/$opicao/');
    list = (response.data as List).map((item) {
      return VitrineModel.fromJson(item);
    }).toList();

    return list;
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
