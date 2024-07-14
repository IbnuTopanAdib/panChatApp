import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(border: OutlineInputBorder()),
    );
  }
}
