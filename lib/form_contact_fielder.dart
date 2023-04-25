import 'package:flutter/material.dart';
import 'package:contact_crud_hive/model/user.dart';

class FormContactFielder extends StatelessWidget {
  final TextEditingController controller;
  final String hintTextName;
  final IconData iconData;
  final TextInputType textInputType;

  FormContactFielder({
    required this.controller,
    required this.hintTextName,
    required this.iconData,
    this.textInputType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        icon: Icon(iconData),
        hintText: hintTextName,
        filled: true,
      ),
      keyboardType: textInputType,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por Favor Digite $hintTextName';
        }
        if (hintTextName == 'Email' && !validateEmail(value)) {
          return 'Digite um Email Válido';
        }
        if (hintTextName == 'Nome' && !validaApenasLetras(value)) {
          return 'Por favor, digite apenas letras';
        }
        if (hintTextName == 'Código' && !validaId(value)) {
          return 'Por favor, digite apenas números';
        }
        return null;
      },
    );
  }

  bool validateEmail(String email) {
    final emailReg = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
    return emailReg.hasMatch(email);
  }

  bool validaApenasLetras(String value) {
    final RegExp regex = RegExp(r'^[a-zA-Z]+$');
    return regex.hasMatch(value);
  }

  bool validaId(String id) {
    final RegExp regex = RegExp(r'^[0-9]+$');
    return regex.hasMatch(id);
  }
}

