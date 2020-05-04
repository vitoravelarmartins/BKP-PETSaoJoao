import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:masked_text/masked_text.dart';

Widget textFielNomePet(onEditing, controller, filled, label) {
  return Container(
      padding: EdgeInsets.only(
        left: 15,
        right: 15,
      ),
      child: TextFormField(
        onEditingComplete: onEditing,
        keyboardType: TextInputType.text,
        controller: controller, //nameController,
        decoration: InputDecoration(
          fillColor: Colors.red[100],
          filled: filled, //erroNome,
          prefixIcon: Icon(FontAwesomeIcons.bone),
          labelText: label, //'Nome completo',
          border: OutlineInputBorder(),
          //helperText: 'Digite nome Completo',
        ),
      ));
}

Widget textFieldDoc(focus, controller, mask, length, filled, label, helptext) {
  return Container(
      padding: EdgeInsets.only(
        left: 15,
        right: 15,
      ),
      child: MaskedTextField(
          focusNode: focus,
          maskedTextFieldController: controller, //rgcontroller,
          escapeCharacter: 'x',
          mask: mask, //"xx.xxx.xxx",
          maxLength: length, //10,
          keyboardType: TextInputType.number,
          inputDecoration: InputDecoration(
              counterText: "",
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
              counterText: "",
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

Widget textFieldEmail(
    onEditing, enable, focus, controller, filled, label, helptext) {
  return Container(
      padding: EdgeInsets.only(
        left: 15,
        right: 15,
      ),
      child: TextFormField(
          onEditingComplete: onEditing,
          enabled: enable,
          focusNode: focus,
          controller: controller,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            fillColor: Colors.red[100],
            filled: filled, //erroRG,
            prefixIcon: Icon(Icons.email),
            labelText: label, //'RG',
            border: OutlineInputBorder(),
            helperText: helptext, //'Opcional',
          )));
}

Widget textFieldWhatsapp(mask, length, controller, filled, label, helptext) {
  return Container(
      padding: EdgeInsets.only(
        left: 15,
        right: 15,
      ),
      child: MaskedTextField(
          escapeCharacter: 'x',
          mask: mask,
          maxLength: length,
          maskedTextFieldController: controller,
          keyboardType: TextInputType.number,
          inputDecoration: InputDecoration(
            counterText: "",
            fillColor: Colors.red[100],
            filled: filled, //erroRG,
            prefixIcon: Icon(
              FontAwesomeIcons.whatsapp,
            ),
            labelText: label, //'RG',
            border: OutlineInputBorder(),
            helperText: helptext, //'Opcional',
          )));
}

Widget textFieldTelefone(
    focus, mask, length, controller, filled, label, helptext) {
  return Container(
      padding: EdgeInsets.only(
        left: 15,
        right: 15,
      ),
      child: MaskedTextField(
          focusNode: focus,
          escapeCharacter: 'x',
          mask: mask,
          maxLength: length,
          maskedTextFieldController: controller,
          keyboardType: TextInputType.number,
          inputDecoration: InputDecoration(
            counterText: "",
            fillColor: Colors.red[100],
            filled: filled, //erroRG,
            prefixIcon: Icon(Icons.phone),
            labelText: label, //'RG',
            border: OutlineInputBorder(),
            helperText: helptext, //'Opcional',
          )));
}
