import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:petsaojoao/components/comp_cad_tutor/text_label.dart';
import 'package:petsaojoao/components/comp_cad_tutor/textfield.dart';
import 'package:petsaojoao/components/comp_publico/alert.dart';
import 'package:petsaojoao/components/comp_publico/button.dart';
import 'package:petsaojoao/components/comp_publico/sizebox.dart';
import 'package:petsaojoao/pages/cad_tutor/fim_cad_tutor.dart';

TextEditingController _emailController = new TextEditingController();
TextEditingController _telefoneController = new TextEditingController();
TextEditingController _whatsController = new TextEditingController();

class InfoContato extends StatefulWidget {
  @override
  _InfoContatoState createState() => _InfoContatoState();
}

class _InfoContatoState extends State<InfoContato> {
  bool erroEmail = false;
  bool erroTel = false;
  bool erroWhats = false;

  FocusNode myFocusNode;

  void validaForm(String numero, bool erro) {
    var numeroCasa = validaNumeroTel(numero);
    var erroEmail = erro;

    if (erroEmail == false && numeroCasa == true) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => FimCadastroTutor()));
    }
  }

  bool validaNumeroTel(String numero) {
    String patttern = r'(^[0-9 ()\-]*$)';
    RegExp regExp = new RegExp(patttern);
    if (!regExp.hasMatch(numero) || numero.isEmpty) {
      setState(() {
        erroTel = true;
      });
      alertaErro(context, Icons.phone, "Número Inválido",
          "Por favor, digite um  número de Telefone válido,");
      return false;
    } else {
      setState(() {
        erroTel = false;
        return true;
      });
    }
    return true;
  }

  void validaEmail() {
    var text = _emailController.text;
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (!regExp.hasMatch(text)) {
      alertaErro(context, Icons.email, "Email inválido",
          "Por favor, digite um E-mail valido.");
      setState(() {
        erroEmail = true;
      });
    } else {
      setState(() {
        erroEmail = false;
      });
      myFocusNode.requestFocus();
    }
  }

  void initState() {
    super.initState();

    myFocusNode = FocusNode();
  }

  void dispose() {
    super.dispose();
    myFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.blueAccent[200],
    ));

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: FlatButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        elevation: 0.0,
      ),
      body: ListView(children: <Widget>[
        Container(
          color: Colors.blueAccent[200],
          child: Column(
            children: <Widget>[
              Center(child: conta_passos('3 de 3')),
              sizebox(30.0),
              Center(
                child: pergunta_form('Como te contactamos?'),
              ),
              sizebox(50.0),
            ],
          ),
        ),
        sizebox(10.0),
        info_dados(context),
        sizebox(20.0),
        textFieldEmail(validaEmail, true, null, _emailController, erroEmail,
            "Email", "Opcional"),
        sizebox(20.0),
        textFieldTelefone(myFocusNode, "(xx) xxxxx-xxxx", 16,
            _telefoneController, erroTel, "Telefone", null),
        sizebox(10.0),
        textFieldWhatsapp("(xx) x xxxx-xxxx", 16, _whatsController, erroWhats,
            "WhatsApp", "Opcional"),
        sizebox(40.0),
        buttonConfirmForm(
          () {
            validaForm(_telefoneController.text, erroEmail);
          },
        ),
        sizebox(20.0),
      ]),
    );
  }
}
