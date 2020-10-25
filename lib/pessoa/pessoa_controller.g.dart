// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pessoa_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PessoaController on _PessoaControllerBase, Store {
  Computed<List<PessoaModel>> _$listPessoasComputed;

  @override
  List<PessoaModel> get listPessoas => (_$listPessoasComputed ??=
          Computed<List<PessoaModel>>(() => super.listPessoas,
              name: '_PessoaControllerBase.listPessoas'))
      .value;
  Computed<int> _$idComputed;

  @override
  int get id => (_$idComputed ??=
          Computed<int>(() => super.id, name: '_PessoaControllerBase.id'))
      .value;
  Computed<bool> _$nomeIsValidComputed;

  @override
  bool get nomeIsValid =>
      (_$nomeIsValidComputed ??= Computed<bool>(() => super.nomeIsValid,
              name: '_PessoaControllerBase.nomeIsValid'))
          .value;
  Computed<bool> _$emailIsValidComputed;

  @override
  bool get emailIsValid =>
      (_$emailIsValidComputed ??= Computed<bool>(() => super.emailIsValid,
              name: '_PessoaControllerBase.emailIsValid'))
          .value;
  Computed<bool> _$senhaIsValidComputed;

  @override
  bool get senhaIsValid =>
      (_$senhaIsValidComputed ??= Computed<bool>(() => super.senhaIsValid,
              name: '_PessoaControllerBase.senhaIsValid'))
          .value;
  Computed<bool> _$telefoneIsValidComputed;

  @override
  bool get telefoneIsValid =>
      (_$telefoneIsValidComputed ??= Computed<bool>(() => super.telefoneIsValid,
              name: '_PessoaControllerBase.telefoneIsValid'))
          .value;
  Computed<bool> _$allValidComputed;

  @override
  bool get allValid =>
      (_$allValidComputed ??= Computed<bool>(() => super.allValid,
              name: '_PessoaControllerBase.allValid'))
          .value;

  final _$_listPessoasAtom = Atom(name: '_PessoaControllerBase._listPessoas');

  @override
  ObservableList<PessoaModel> get _listPessoas {
    _$_listPessoasAtom.reportRead();
    return super._listPessoas;
  }

  @override
  set _listPessoas(ObservableList<PessoaModel> value) {
    _$_listPessoasAtom.reportWrite(value, super._listPessoas, () {
      super._listPessoas = value;
    });
  }

  final _$_idAtom = Atom(name: '_PessoaControllerBase._id');

  @override
  int get _id {
    _$_idAtom.reportRead();
    return super._id;
  }

  @override
  set _id(int value) {
    _$_idAtom.reportWrite(value, super._id, () {
      super._id = value;
    });
  }

  final _$_nomeAtom = Atom(name: '_PessoaControllerBase._nome');

  @override
  String get _nome {
    _$_nomeAtom.reportRead();
    return super._nome;
  }

  @override
  set _nome(String value) {
    _$_nomeAtom.reportWrite(value, super._nome, () {
      super._nome = value;
    });
  }

  final _$_emailAtom = Atom(name: '_PessoaControllerBase._email');

  @override
  String get _email {
    _$_emailAtom.reportRead();
    return super._email;
  }

  @override
  set _email(String value) {
    _$_emailAtom.reportWrite(value, super._email, () {
      super._email = value;
    });
  }

  final _$_senhaAtom = Atom(name: '_PessoaControllerBase._senha');

  @override
  String get _senha {
    _$_senhaAtom.reportRead();
    return super._senha;
  }

  @override
  set _senha(String value) {
    _$_senhaAtom.reportWrite(value, super._senha, () {
      super._senha = value;
    });
  }

  final _$_telefoneAtom = Atom(name: '_PessoaControllerBase._telefone');

  @override
  String get _telefone {
    _$_telefoneAtom.reportRead();
    return super._telefone;
  }

  @override
  set _telefone(String value) {
    _$_telefoneAtom.reportWrite(value, super._telefone, () {
      super._telefone = value;
    });
  }

  final _$setListPessoasAsyncAction =
      AsyncAction('_PessoaControllerBase.setListPessoas');

  @override
  Future<void> setListPessoas() {
    return _$setListPessoasAsyncAction.run(() => super.setListPessoas());
  }

  final _$savePessoaAsyncAction =
      AsyncAction('_PessoaControllerBase.savePessoa');

  @override
  Future<bool> savePessoa() {
    return _$savePessoaAsyncAction.run(() => super.savePessoa());
  }

  final _$updatePessoaAsyncAction =
      AsyncAction('_PessoaControllerBase.updatePessoa');

  @override
  Future<bool> updatePessoa() {
    return _$updatePessoaAsyncAction.run(() => super.updatePessoa());
  }

  final _$deleteItemAsyncAction =
      AsyncAction('_PessoaControllerBase.deleteItem');

  @override
  Future<bool> deleteItem(PessoaModel pessoa) {
    return _$deleteItemAsyncAction.run(() => super.deleteItem(pessoa));
  }

  final _$_PessoaControllerBaseActionController =
      ActionController(name: '_PessoaControllerBase');

  @override
  void setId(int value) {
    final _$actionInfo = _$_PessoaControllerBaseActionController.startAction(
        name: '_PessoaControllerBase.setId');
    try {
      return super.setId(value);
    } finally {
      _$_PessoaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setNome(String value) {
    final _$actionInfo = _$_PessoaControllerBaseActionController.startAction(
        name: '_PessoaControllerBase.setNome');
    try {
      return super.setNome(value);
    } finally {
      _$_PessoaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String value) {
    final _$actionInfo = _$_PessoaControllerBaseActionController.startAction(
        name: '_PessoaControllerBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_PessoaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSenha(String value) {
    final _$actionInfo = _$_PessoaControllerBaseActionController.startAction(
        name: '_PessoaControllerBase.setSenha');
    try {
      return super.setSenha(value);
    } finally {
      _$_PessoaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTelefone(String value) {
    final _$actionInfo = _$_PessoaControllerBaseActionController.startAction(
        name: '_PessoaControllerBase.setTelefone');
    try {
      return super.setTelefone(value);
    } finally {
      _$_PessoaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listPessoas: ${listPessoas},
id: ${id},
nomeIsValid: ${nomeIsValid},
emailIsValid: ${emailIsValid},
senhaIsValid: ${senhaIsValid},
telefoneIsValid: ${telefoneIsValid},
allValid: ${allValid}
    ''';
  }
}
