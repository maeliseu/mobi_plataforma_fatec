import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobi_plataforma_fatec/app/model/vitrine_model.dart';
import 'interfaces/vitrine_repository_interface.dart';

part 'vitrine_repository.g.dart';

@Injectable()
class VitrineRepository implements IVitrineRepository {
  final Dio dio;

  VitrineRepository(this.dio);

  Future<List<VitrineModel>> getAll() async {
    // var response = await dio.get('http://18.231.178.234/api/vitrine/');
    Response response;
    response = await dio
        .get('https://plataforma-fatec-araras-api.herokuapp.com/api/vitrine/');
    var list = (response.data as List).map((item) {
      return VitrineModel.fromJson(item);
    }).toList();

    return list;
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
