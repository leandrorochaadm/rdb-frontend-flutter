import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:rdb/pessoa/pessoa_repository.dart';

part 'login_controller.g.dart';

class LoginController = _LoginController with _$LoginController;

abstract class _LoginController with Store {
  @observable
  String email = "";

  @action
  void setEmail(String value) => email = value;

  @observable
  String password = "";

  @action
  void setPassword(String value) => password = value;

  @observable
  bool passwordVisible = false;

  @action
  void togglePasswordVisibility() => passwordVisible = !passwordVisible;

  @observable
  bool loading = false;

  @observable
  bool loggedIn = false;

  @computed
  bool get isEmailValid => RegExp(
          r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
      .hasMatch(email);

  @computed
  bool get isPasswordValid => password.length >= 6;

  @computed
  Function get loginPressed =>
      (isEmailValid && isPasswordValid && !loading) ? login : null;

  @action
  Future<void> login() async {
    loading = true;

    //await Future.delayed(Duration(seconds: 2));

    PessoaRepository pessoaRepository = PessoaRepository();
    if (await pessoaRepository.login(email, password) == true) {
      loggedIn = true;
    } else {
      loggedIn = false;
      // onfail;
    }
    loading = false;
    // email = "";
    // password = "";
  }

  @action
  void logout() {
    loggedIn = false;
  }
}