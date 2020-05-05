import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:petsaojoao/components/comp_cad_tutor/text_label.dart';
import 'package:cpfcnpj/cpfcnpj.dart';
import 'package:petsaojoao/components/comp_publico/alert.dart';
import 'package:petsaojoao/components/comp_publico/button.dart';
import 'package:petsaojoao/components/comp_publico/sizebox.dart';
import 'package:petsaojoao/screens/cad_tutor/info_endereco.dart';
import 'package:petsaojoao/components/comp_cad_tutor/textfield.dart';

TextEditingController _nameController = new TextEditingController();
TextEditingController _rgcontroller = new TextEditingController();
TextEditingController _cpfcontroller = new TextEditingController();

class InfoPessoal extends StatefulWidget {
  @override
  _InfoPessoalState createState() => _InfoPessoalState();
}

class _InfoPessoalState extends State<InfoPessoal> {
  bool erroCPF = false;
  bool erroRG = false;
  bool erroNome = false;
  FocusNode myFocusNode;

  void initState() {
    super.initState();

    myFocusNode = FocusNode();
  }

  void dispose() {
    super.dispose();

    myFocusNode.dispose();
  }

  void _validaForm(String nome, String cpf, String rg) {
    var valNome = _validaNome(nome);
    var valRg = _validarRG(rg);
    var valCPF = _validarCPF(cpf);

    if (valNome == true && valRg == true && valCPF == true) {
      print("Todos os Dados Passaram!!!");
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => InfoEndereco()));
    }
  }

  bool _validaNome(String nome) {
    String patttern =
        r'(^[a-zA-ZàèìòùÀÈÌÒÙáéíóúýÁÉÍÓÚÝâêîôûÂÊÎÔÛãñõÃÑÕäëïöüÿÄËÏÖÜŸçÇ ]*$)';
    RegExp regExp = new RegExp(patttern);
    var ind = nome.indexOf(" ");

    if (!regExp.hasMatch(nome) || nome.length < 5 || ind == -1) {
      setState(() {
        erroNome = true;
        print("Nome inválido");
        alertaErro(context, Icons.person, "Nome Inválido",
            "Digite seu nome completo, como esta no RG - Ex.: José Pereira da Silva");
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

  void alertaRG() {
    alertaErro(context, Icons.picture_in_picture, "RG Inválido",
        "Número de RG digitado inválido, por favor verifique os números digitados.");
  }

  bool _validarRG(String rg) {
    if (rg.length != 10) {
      setState(() {
        erroRG = true;
        print("RG -> Numeros de caracteres invalido");
        alertaRG();
      });
      return false;
    } else {
      switch (rg) {
        case "12.345.678":
          {
            print("RG  invalido");
            setState(() {
              erroRG = true;
              alertaRG();
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
            alertaRG();
            return false;
          }
          break;

        case "11.111.111":
          {
            setState(() {
              erroRG = true;
            });
            alertaRG();
            return false;
          }
          break;

        case "22.222.222":
          {
            setState(() {
              erroRG = true;
            });
            alertaRG();
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

  bool _validarCPF(String cpf) {
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
        alertaErro(context, Icons.picture_in_picture, "CPF Inválido",
            "Número de CPF digitado inválido, por favor verifique os números digitados.");
      });
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.blueAccent[200],
    ));

    return Scaffold(
      //backgroundColor: Colors.white,

      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: FlatButton(
          onPressed: () {
            //Navigator.pushReplacement(context, dashboard());
            // Navigator.push(
            //     context, MaterialPageRoute(builder: (context) => dashboard()));
            Navigator.pop(context);
            // Navigator.maybePop(context);
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
        info_dados(context),
        sizebox(20.0),
        textFielNome(myFocusNode.requestFocus, _nameController, erroNome,
            "Nome completo"),
        sizebox(30.0),
        textFieldDoc(
            myFocusNode, _rgcontroller, "xx.xxx.xxx", 10, erroRG, "RG", null),
        sizebox(20.0),
        textFieldDoc(
            null, _cpfcontroller, "xxx.xxx.xxx-xx", 14, erroCPF, "CPF", null),
        sizebox(40.0),
        buttonConfirmForm(
          () {
            _validaForm(
                _nameController.text, _cpfcontroller.text, _rgcontroller.text);
          },
        ),
        sizebox(20.0),
      ]),
    );
  }
}

Route dashboard() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => InfoPessoal(),
    transitionDuration: const Duration(milliseconds: 500),
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
