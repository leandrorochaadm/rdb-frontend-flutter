// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pessoa_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PessoaController on _PessoaControllerBase, Store {
  Computed<bool> _$nomeIsValidComputed;

  @override
  bool get nomeIsValid =>
      (_$nomeIsValidComputed ??= Computed<bool>(() => super.nomeIsValid,
              name: '_PessoaControllerBase.nomeIsValid'))
          .value;

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

  final _$_PessoaControllerBaseActionController =
      ActionController(name: '_PessoaControllerBase');

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
  String toString() {
    return '''
nomeIsValid: ${nomeIsValid}
    ''';
  }
}
