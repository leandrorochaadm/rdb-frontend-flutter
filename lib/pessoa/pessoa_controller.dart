import 'package:mobx/mobx.dart';

import 'pessoa_model.dart';
import 'pessoa_repository.dart';
part 'pessoa_controller.g.dart';

class PessoaController = _PessoaControllerBase with _$PessoaController;

abstract class _PessoaControllerBase with Store {
  _PessoaControllerBase() {
    final PessoaRepository repository = PessoaRepository();
  }
  @observable
  List<PessoaModel> listPessoas = [
    PessoaModel(email: "adsf@asdf.com", nome: "adfad"),
    PessoaModel(email: "poipi@asdf.com", nome: "poipi"),
  ];

  @observable
  String _nome = '';

  @action
  void setNome(String value) => _nome = value;

  @computed
  bool get nomeIsValid => _nome.isNotEmpty && _nome.length > 3;
  String get nomeError => nomeIsValid ? null : "Nome inválido";
}
