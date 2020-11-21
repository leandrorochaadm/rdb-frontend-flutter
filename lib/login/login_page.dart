import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:rdb/cart/cart_page.dart';
import 'package:rdb/pessoa/pessoa_page_crud.dart';
import 'package:rdb/pessoa/pessoa_page_list.dart';

import 'custom_icon_button.dart';
import 'custom_text_field.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  static const String tag = "login";

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginController loginController;

  ReactionDisposer disposer;

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    loginController = Provider.of<LoginController>(context);

    disposer = reaction((_) => loginController.loggedIn, (loggedIn) {
      if (loggedIn == true) {
        print("logou");
        Navigator.of(context).popAndPushNamed(CartPage.tag);
      } else {
        print("fail1");
        _onFail();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        body: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.all(32),
            child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 16,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      /* Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: Image.asset(
                          "assets/img/logo.png",
                          fit: BoxFit.contain,
                        ),
                      ),*/
                      Observer(
                        builder: (_) {
                          return CustomTextField(
                            hint: 'E-mail',
                            prefix: Icon(Icons.account_circle),
                            textInputType: TextInputType.emailAddress,
                            onChanged: loginController.setEmail,
                            enabled: !loginController.loading,
                          );
                        },
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Observer(
                        builder: (_) {
                          return CustomTextField(
                            hint: 'Senha',
                            prefix: Icon(Icons.lock),
                            obscure: !loginController.passwordVisible,
                            onChanged: loginController.setPassword,
                            enabled: !loginController.loading,
                            suffix: CustomIconButton(
                              radius: 32,
                              iconData: loginController.passwordVisible
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              onTap: loginController.togglePasswordVisibility,
                            ),
                          );
                        },
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Observer(
                        builder: (_) {
                          return SizedBox(
                            height: 44,
                            width: 150,
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32),
                              ),
                              child: loginController.loading
                                  ? CircularProgressIndicator(
                                      valueColor:
                                          AlwaysStoppedAnimation(Colors.white),
                                    )
                                  : Text('Entrar'),
                              color: Theme.of(context).primaryColor,
                              disabledColor:
                                  Theme.of(context).primaryColor.withAlpha(100),
                              textColor: Colors.white,
                              onPressed: loginController.loginPressed,
                            ),
                          );
                        },
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      SizedBox(
                        width: 150,
                        height: 44,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32),
                          ),
                          child: Text('Cadastra-se'),
                          color: Theme.of(context).primaryColor,
                          disabledColor:
                              Theme.of(context).primaryColor.withAlpha(100),
                          textColor: Colors.white,
                          onPressed: () {
                            Navigator.of(context).pushNamed(PessoaPageCrud.tag);
                          },
                        ),
                      ),
                    ],
                  ),
                )),
          ),
        ),
      ),
    );
  }

  void _onFail() {
    print("fail2");
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      backgroundColor: Colors.redAccent,
      content: Text(
        "Falha ao entrar!\nVerifique a senha e o email.",
        style: TextStyle(color: Colors.white),
      ),
      duration: Duration(seconds: 2),
    ));
  }

  @override
  void dispose() {
    disposer();
    super.dispose();
  }
}
