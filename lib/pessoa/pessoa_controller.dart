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
  bool get nomeIsValid => _nome.trim().length > 3;
  String get nomeError => nomeIsValid == true ? null : "Nome inválido";

  @observable
  String _email = '';

  @action
  void setEmail(String value) => _email = value;

  @computed
  bool get emailIsValid => _email.trim().length > 3;
  String get emailError => emailIsValid == true ? null : "Email inválido";

  @observable
  String _senha = '';

  @action
  void setSenha(String value) => _senha = value;

  @computed
  bool get senhaIsValid => _senha.trim().length > 3;
  String get senhaError => senhaIsValid == true ? null : "Senha inválido";

  @observable
  String _telefone = '';

  @action
  void setTelefone(String value) => _telefone = value;

  @computed
  bool get telefoneIsValid => _telefone.trim().length > 3;
  String get telefoneError =>
      telefoneIsValid == true ? null : "Telefone inválido";

  @computed
  bool get allValid =>
      nomeIsValid && emailIsValid && senhaIsValid && telefoneIsValid;

  @action
  void SavePessoa() {
    if (allValid) {
      repository.setPessoa(PessoaModel(
        email: _email,
        id: null,
        nome: _nome,
        senha: _senha,
        telefone: _telefone,
      ));
    }
    setListPessoas();
  }
}
