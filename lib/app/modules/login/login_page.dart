import 'package:flutter/material.dart';
import 'package:personal_finances/app/modules/login/login_module.dart';
import 'package:personal_finances/app/shared/style/app_colors.dart';
import 'package:personal_finances/app/shared/utils/custom_snackbar.dart';
import 'package:personal_finances/app/shared/widgets/custom_button.dart';
import 'package:personal_finances/app/shared/widgets/custom_text_field_widget.dart';

import 'login_bloc.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _loginBloc = LoginModule.to.getBloc<LoginBloc>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _loading = false;

  void _onTap() async {
    setState(() => _loading = true);
    final response = await _loginBloc.submit();
    setState(() => _loading = false);

    response.fold(
      (error) => CustomSnackbar().error(context, message: error),
      (result) {
        if (result) {
          Navigator.pushReplacementNamed(context, '/home-module');
        } else {
          CustomSnackbar().error(context, message: "Error desconhecido");
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.turquoise,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            padding: EdgeInsets.all(15),
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: <Widget>[
                StreamBuilder(
                  stream: _loginBloc.email,
                  builder: (context, snapshot) {
                    return CustomTextFieldWidget(
                      controller: _emailController,
                      hintText: "e-mail",
                      onChanged: _loginBloc.changeEmail,
                      keyboardType: TextInputType.emailAddress,
                      textError: snapshot.error,
                    );
                  },
                ),
                SizedBox(height: 10),
                StreamBuilder(
                  stream: _loginBloc.password,
                  builder: (context, snapshot) {
                    return CustomTextFieldWidget(
                      controller: _passwordController,
                      hintText: "password",
                      onChanged: _loginBloc.changePassword,
                      textError: snapshot.error,
                      obscureText: true,
                    );
                  },
                ),
                SizedBox(height: 10),
                StreamBuilder(
                  stream: _loginBloc.submitIsValid,
                  builder: (context, snapshot) {
                    return CustomButtonWidget(
                      onTap: snapshot.hasData ? _onTap : null,
                      text: "Login",
                      isLoading: _loading,
                      color: AppColors.danger,
                    );
                  },
                ),
              ],
            ),
          ),
          FlatButton(
            child: Text("Registrar-se"),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
