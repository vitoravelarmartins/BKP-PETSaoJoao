import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:petsaojoao/components/foundation_form/appbar_foundation.dart';
import 'package:petsaojoao/components/foundation_form/body_foundation.dart';
import 'package:petsaojoao/components/register_tutor/data_security_info.dart';
import 'package:petsaojoao/models/validators/cep_validator.dart';
import 'package:via_cep/via_cep.dart';

var _cepController = new MaskedTextController(mask: '00000-000');
TextEditingController _streetController = new TextEditingController();

class AndressInfo extends StatefulWidget {
  @override
  _AndressInfoState createState() => _AndressInfoState();
}

class _AndressInfoState extends State<AndressInfo> {
  String steps = "2 de 3";
  String questionTittle = "Onde você mora?";
  var arrowBackIcon = Icons.arrow_back;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            child: AppBarFoundation(arrowBackIcon),
            preferredSize: Size.fromHeight(50.0)),
        body: ListView(children: <Widget>[
          BodyFoundation(steps, questionTittle),
          SizedBox(height: 10.0),
          DataSecurityInfo(),
          SizedBox(height: 10.0),
          Container(
            padding: EdgeInsets.only(
              left: 15,
              right: 15,
            ),
            child: FormAndress(),
          ),
        ]));
  }
}

class FormAndress extends StatefulWidget {
  void setAndress(street) {
    _streetController.text = street;
  }

  @override
  _FormAndressState createState() => _FormAndressState();
}

class _FormAndressState extends State<FormAndress> {
  final _andressFormKey = GlobalKey<FormState>();

  final _labelCep = "CEP";
  final _labelLogradouro = "Logradouro";

  FocusNode focusCepForNumero;

  void initState() {
    super.initState();

    focusCepForNumero = FocusNode();
  }

  void dispose() {
    super.dispose();

    focusCepForNumero.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Form(
      key: _andressFormKey,
      child: Column(children: <Widget>[
        TextFormField(
          validator: (value) {
            return null;
          },
          onChanged: (value) {
            CepValidador().validate(
              value,
            );
          },
          keyboardType: TextInputType.number,
          controller: _cepController,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.place),
            suffixIcon: IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  CepValidador().validate(
                    _cepController.text,
                  );
                }),
            labelText: _labelCep,
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 20),
        TextFormField(
          validator: (value) {
            return null;
          },
          readOnly: true,
          keyboardType: TextInputType.number,
          controller: _streetController,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.place),
            // suffixIcon: ,
            labelText: _labelLogradouro,
            border: OutlineInputBorder(),
          ),
        ),
      ]),
    ));
  }
}
