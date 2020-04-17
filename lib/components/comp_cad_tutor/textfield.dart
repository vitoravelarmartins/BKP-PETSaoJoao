import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:masked_text/masked_text.dart';

Widget textFielNome(controller, filled, label) {
  return Container(
      padding: EdgeInsets.only(
        left: 15,
        right: 15,
      ),
      child: TextFormField(
        keyboardType: TextInputType.text,
        controller: controller, //nameController,
        decoration: InputDecoration(
          fillColor: Colors.red[100],
          filled: filled, //erroNome,
          prefixIcon: Icon(Icons.person),
          labelText: label, //'Nome completo',
          border: OutlineInputBorder(),
          //helperText: 'Digite nome Completo',
        ),
      ));
}

Widget textFieldDoc(controller, mask, length, filled, label, helptext) {
  return Container(
      padding: EdgeInsets.only(
        left: 15,
        right: 15,
      ),
      child: MaskedTextField(
          maskedTextFieldController: controller, //rgcontroller,
          escapeCharacter: 'x',
          mask: mask, //"xx.xxx.xxx",
          maxLength: length, //10,
          keyboardType: TextInputType.number,
          inputDecoration: InputDecoration(
              fillColor: Colors.red[100],
              filled: filled, //erroRG,
              prefixIcon: Icon(Icons.picture_in_picture),
              labelText: label, //'RG',
              border: OutlineInputBorder(),
              helperText: helptext //'Opcional',
              )));
}
