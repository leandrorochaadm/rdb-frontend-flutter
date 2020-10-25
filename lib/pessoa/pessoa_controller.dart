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
  ObservableList<PessoaModel> _listPessoas;
  // List<PessoaModel> listPessoas = [];

  @action
  //void setListPessoas() => listPessoas = repository.getPessoa().asObservable();
  Future<void> setListPessoas() async {
    _listPessoas = ObservableList<PessoaModel>.of(await repository.getPessoa());
    // print("controller: $_listPessoas");
  }

  @computed
  List<PessoaModel> get listPessoas => _listPessoas;

  @observable
  int _id;

  @action
  void setId(int value) => _id = value;

  @computed
  int get id => _id;

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
  String get senhaError => senhaIsValid == true ? null : "Senha inválida";

  @observable
  String _telefone = '';

  @action
  void setTelefone(String value) => _telefone = value;

  @computed
  bool get telefoneIsValid => _telefone.trim().length > 7;
  String get telefoneError =>
      telefoneIsValid == true ? null : "Telefone inválido";

  @computed
  bool get allValid =>
      nomeIsValid && emailIsValid && senhaIsValid && telefoneIsValid;

  @action
  Future<bool> savePessoa() async {
    bool status = await repository.setPessoa(
      PessoaModel(
        email: _email,
        nome: _nome,
        senha: _senha,
        telefone: _telefone,
      ),
    );
    await setListPessoas();
    return status;
  }

  @action
  Future<bool> updatePessoa() async {
    bool status = await repository.updatePessoa(
      PessoaModel(
        id: _id,
        email: _email,
        nome: _nome,
        senha: _senha,
        telefone: _telefone,
      ),
    );
    await setListPessoas();
    return status;
  }

  @action
  Future<bool> deleteItem(PessoaModel pessoa) async {
    var status = false;
    status = await repository.deletePessoa(pessoa);
    await setListPessoas();
    return status;
  }
}
