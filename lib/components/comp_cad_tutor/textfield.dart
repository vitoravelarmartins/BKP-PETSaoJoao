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

Widget textFieldCEP(onEditing, onChange, controller, length, filled, label,
    helptext, buttonAction) {
  return Container(
      padding: EdgeInsets.only(
        left: 15,
        right: 15,
      ),
      child: TextFormField(
          onEditingComplete: onEditing,
          onChanged: onChange,
          controller: controller,
          //focusNode: FocusNode(),
          maxLength: 8, //10,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
              fillColor: Colors.red[100],
              filled: filled, //erroRG,
              prefixIcon: Icon(Icons.place),
              labelText: label,
              border: OutlineInputBorder(),
              helperText: helptext,
              suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: buttonAction) //'Opcional',
              )));
}

Widget textFieldEndereco(
    enable, controller, readOnly, filled, label, helptext, buttonAction) {
  return Container(
      padding: EdgeInsets.only(
        left: 15,
        right: 15,
      ),
      child: TextFormField(
          enabled: enable,
          //focusNode: FocusNode(),
          controller: controller,
          readOnly: readOnly, //rgcontroller,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
              fillColor: Colors.red[100],
              filled: filled, //erroRG,
              prefixIcon: Icon(Icons.place),
              labelText: label, //'RG',
              border: OutlineInputBorder(),
              helperText: helptext,
              suffixIcon: IconButton(
                  icon: Icon(Icons.edit), onPressed: buttonAction) //'Opcional',
              )));
}

Widget textFieldEnderecoNumero(enable, focus, controller, readOnly, filled,
    label, helptext, buttonAction) {
  return Container(
      padding: EdgeInsets.only(
        left: 15,
        right: 15,
      ),
      child: TextFormField(
          enabled: enable,
          focusNode: focus,
          controller: controller,
          readOnly: readOnly, //rgcontroller,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            fillColor: Colors.red[100],
            filled: filled, //erroRG,
            prefixIcon: Icon(Icons.place),
            labelText: label, //'RG',
            border: OutlineInputBorder(),
            helperText: helptext, //'Opcional',
          )));
}

Widget textFieldEnderecoComplemento(enable, focus, controller, readOnly, filled,
    label, helptext, buttonAction) {
  return Container(
      padding: EdgeInsets.only(
        left: 15,
        right: 15,
      ),
      child: TextFormField(
          enabled: enable,
          focusNode: focus,
          controller: controller,
          readOnly: readOnly, //rgcontroller,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            fillColor: Colors.red[100],
            filled: filled, //erroRG,
            prefixIcon: Icon(Icons.place),
            labelText: label, //'RG',
            border: OutlineInputBorder(),
            helperText: helptext, //'Opcional',
          )));
}
