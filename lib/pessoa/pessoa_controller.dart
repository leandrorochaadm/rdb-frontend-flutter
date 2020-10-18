import 'package:mobx/mobx.dart';

import 'pessoa_model.dart';
import 'pessoa_repository.dart';
part 'pessoa_controller.g.dart';

class PessoaController = _PessoaControllerBase with _$PessoaController;

abstract class _PessoaControllerBase with Store {
  final PessoaRepository repository;

  _PessoaControllerBase(this.repository) {
    setListPessoas();
  }

  @observable
  ObservableFuture<List<PessoaModel>> listPessoas;

  @action
  void setListPessoas() => listPessoas = repository.getPessoa().asObservable();

  @observable
  String _nome = '';

  @action
  void setNome(String value) => _nome = value;

  @computed
  bool get nomeIsValid => _nome.isNotEmpty && _nome.length > 3;
  String get nomeError => nomeIsValid ? null : "Nome inválido";
}
