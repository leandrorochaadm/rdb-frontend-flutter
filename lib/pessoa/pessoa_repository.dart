import 'package:dio/dio.dart';
import 'package:rdb/pessoa/pessoa_model.dart';

class PessoaRepository {
  var dio = Dio();

  PessoaRepository() {
    getPessoa();
  }

  Future<List<PessoaModel>> getPessoa() async {
    Response response = await dio.get('http://localhost:8080/pessoas');
    List<PessoaModel> list = [];
    for (var json in (response.data as List)) {
      list.add(PessoaModel.fromMap(json));
    }
    return list;
  }
}
