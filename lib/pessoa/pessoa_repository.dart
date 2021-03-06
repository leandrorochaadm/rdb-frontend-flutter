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
      //print(json);
    }
    //  print("repository: $list");
    return list;
  }

  Future<bool> setPessoa(PessoaModel pessoa) async {
    print("Salvar pessoa: ${pessoa.toString()}");
    try {
      Response response = await dio.post('http://localhost:8080/pessoas',
          data: pessoa.toJson());
      return response.statusCode == 201;
    } catch (e) {
      print("Erro post pessoa: $e");
      return false;
    }
  }

  Future<bool> updatePessoa(PessoaModel pessoa) async {
    print("Update pessoa: ${pessoa.toString()}");
    try {
      Response response = await dio.put(
          'http://localhost:8080/pessoas/${pessoa.id}',
          data: pessoa.toJson());
      return response.statusCode == 202;
    } catch (e) {
      print("Erro put pessoa: $e");
      return false;
    }
  }

  Future<bool> deletePessoa(PessoaModel pessoa) async {
    // print("delete: $pessoa");
    Response response =
        await dio.delete('http://localhost:8080/pessoas/${pessoa.id}');
  }

  Future<bool> login(String email, String senha) async {
    Response response = await dio
        .get('http://localhost:8080/pessoas/login?email=$email&senha=$senha');
    return response.statusCode == 200 ? true : false;
  }
}
