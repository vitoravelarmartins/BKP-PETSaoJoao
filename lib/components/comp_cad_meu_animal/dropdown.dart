import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget dropdown(
    controller, filled, icon, label, helper, items, functionOnPress) {
  return Container(
      padding: EdgeInsets.only(
        left: 15,
        right: 15,
      ),
      child: TextFormField(
          enabled: true,
          controller: controller,
          readOnly: true, //rgcontroller,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            fillColor: Colors.red[100],
            filled: filled, //erroRG,
            prefixIcon: Icon(icon), //FontAwesomeIcons.paw),
            labelText: label, //'RG',
            border: OutlineInputBorder(),
            helperText: helper,
            suffixIcon: Container(
                width: 200,
                child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                        iconSize: 40,
                        items: items,
                        onChanged: functionOnPress))),
            //'Opcional',
          )));
}
