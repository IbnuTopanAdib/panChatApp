import 'package:flutter/material.dart';
import 'package:panchatapp/consts.dart';
import 'package:panchatapp/services/auth_services.dart';
import 'package:panchatapp/widgets/custom_formfield.dart';
import 'package:get_it/get_it.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GetIt _getIt = GetIt.instance;
  final GlobalKey<FormState> _loginFormKey = GlobalKey();
  String? email, password;
  late AuthServices _authServices;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _authServices = _getIt.get<AuthServices>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _buildUi(context),
    );
  }

  Widget _buildUi(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Column(
        children: [
          _headerText(context),
          _loginForm(context),
          _createAccountLink(context)
        ],
      ),
    ));
  }

  Widget _headerText(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Hi Welcome back!",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
          ),
          Text(
            "Hello again!, yo have been missed",
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.deepPurple),
          ),
        ],
      ),
    );
  }

  Widget _loginForm(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.40,
      margin: EdgeInsets.symmetric(
          vertical: MediaQuery.sizeOf(context).height * 0.05),
      child: Form(
          key: _loginFormKey,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomFormField(
                hintText: "Email",
                height: MediaQuery.sizeOf(context).height * 0.1,
                validationRegex: EMAIL_VALIDATION_REGEX,
                onSaved: (value) {
                  setState(() {
                    email = value;
                  });
                },
              ),
              CustomFormField(
                hintText: "Password",
                height: MediaQuery.sizeOf(context).height * 0.1,
                validationRegex: PASSWORD_VALIDATION_REGEX,
                obscureText: true,
                onSaved: (value) {
                  setState(() {
                    password = value;
                  });
                },
              ),
              _loginButton(context)
            ],
          )),
    );
  }

  Widget _loginButton(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: MaterialButton(
        onPressed: () async {
          if (_loginFormKey.currentState?.validate() ?? false) {
            _loginFormKey.currentState?.save();
            bool result = await _authServices.login(email!, password!);
            if (result) {}else{}
          }
        },
        color: Theme.of(context).colorScheme.primary,
        child: Text(
          "Login",
          style: TextStyle(color: Colors.white30),
        ),
      ),
    );
  }

  Widget _createAccountLink(BuildContext context) {
    return Expanded(
        child: Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text("don't have an account",
            style: TextStyle(color: Theme.of(context).colorScheme.primary)),
        Text("Sign up",
            style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w700)),
      ],
    ));
  }
}
