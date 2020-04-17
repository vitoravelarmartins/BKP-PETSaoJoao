import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:petsaojoao/components/comp_cad_tutor/text_label.dart';
import 'package:petsaojoao/components/comp_cad_tutor/sizebox.dart';
import 'package:masked_text/masked_text.dart';
import 'package:cpfcnpj/cpfcnpj.dart';
import 'package:petsaojoao/pages/cad_tutor/infor_endereco.dart';

import 'package:petsaojoao/components/comp_cad_tutor/textfield.dart';

TextEditingController nameController = new TextEditingController();
TextEditingController rgcontroller = new TextEditingController();
TextEditingController cpfcontroller = new TextEditingController();

class Info_pessoal extends StatefulWidget {
  @override
  _Info_pessoalState createState() => _Info_pessoalState();
}

class _Info_pessoalState extends State<Info_pessoal> {
  bool erroCPF = false;
  bool erroRG = false;
  bool erroNome = false;

  void validaForm(String nome, String cpf, String rg) {
    if (validarCPF(cpf) == true &&
        validaNome(nome) == true &&
        validarRG(rg) == true) {
      print("Todos os Dados Passaram!!!");
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => info_endereco()));
    }
    validarCPF(cpf);
    validaNome(nome);
    validarRG(rg);
  }

  bool validaNome(String nome) {
    if (nome.length < 5) {
      setState(() {
        erroNome = true;
        print("Nome muito curto");
        showDialog(
            context: context,
            builder: (_) => AlertDialog(
                  title: Text("Nome Invalido"),
                  content: Text(
                    "Digite seu nome e sobrenome.\n\n Ex.: Jose Pereira da Silva",
                  ),
                  actions: <Widget>[
                    FlatButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("ok"),
                    ),
                  ],
                ),
            barrierDismissible: true);
      });
      return false;
    } else {
      setState(() {
        erroNome = false;
        print("nome ok");
      });
      return true;
    }
  }

  bool validarCPF(String cpf) {
    if (CPF.isValid(cpf)) {
      print("CPF ok");
      setState(() {
        erroCPF = false;
      });

      return true;
    } else {
      print("CPF INVALIDO");
      setState(() {
        erroCPF = true;
        showDialog(
            context: context,
            builder: (_) => AlertDialog(
                  title: Text("CPF Invalido"),
                  content: Text(
                    "Digite seu nome e sobrenome.\n\n Ex.: Jose Pereira da Silva",
                  ),
                  actions: <Widget>[
                    FlatButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("ok"),
                    ),
                  ],
                ),
            barrierDismissible: true);
      });
      return false;
    }
  }

  bool validarRG(String rg) {
    if (rg.length != 10) {
      setState(() {
        erroRG = true;
        print("RG -> Numeros de caracteres invalido");
      });
      return false;
    } else {
      switch (rg) {
        case "12.345.678":
          {
            print("RG  invalido");
            setState(() {
              erroRG = true;
            });
            return false;
          }
          break;
        case "00.000.000":
          {
            print("RG  invalido");
            setState(() {
              erroRG = true;
            });
            return false;
          }
          break;

        case "11.111.111":
          {
            setState(() {
              erroRG = true;
            });
            return false;
          }
          break;

        case "22.222.222":
          {
            setState(() {
              erroRG = true;
            });
            return false;
          }
          break;

        default:
          {
            setState(() {
              erroRG = false;
            });
            return true;
          }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: FlatButton(
          onPressed: () {
            //Navigator.pushReplacement(context, dashboard())
            // Navigator.push(
            //     context, MaterialPageRoute(builder: (context) => dashboard()));
            Navigator.pop(context);
            //Navigator.maybePop(context);
          },
          child: Icon(
            Icons.clear,
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
              Center(child: conta_passos('1 de 3')),
              sizebox(30.0),
              Center(
                child: pergunta_form('Quem é você?'),
              ),
              sizebox(50.0),
            ],
          ),
        ),
        sizebox(10.0),
        info_dados(),
        sizebox(20.0),
        textFielNome(nameController, erroNome, "Nome completo"),
        sizebox(30.0),
        textFieldDoc(rgcontroller, "xx.xxx.xxx", 10, erroRG, "RG", null),
        sizebox(20.0),
        textFieldDoc(cpfcontroller, "xxx.xxx.xxx-xx", 14, erroCPF, "CPF", null),
        sizebox(50.0),
        Container(
            padding: EdgeInsets.only(
              right: 15,
            ),
            alignment: Alignment.bottomRight,
            child: FloatingActionButton(
              onPressed: () {
                validaForm(
                    nameController.text, cpfcontroller.text, rgcontroller.text);
              },
              child: Icon(Icons.keyboard_arrow_right),
            )),
      ]),
    );
  }
}

Route dashboard() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => Info_pessoal(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 1.0);
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
