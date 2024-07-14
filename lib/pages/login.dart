import 'package:flutter/material.dart';
import 'package:panchatapp/widgets/custom_fromfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
          _loginForm(context)
        ],
      ),
    ));
  }
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
        child: Column(
      children: [
        CustomFormField(),
      ],
    )),
  );
}
