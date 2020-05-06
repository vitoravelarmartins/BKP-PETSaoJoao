import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:petsaojoao/components/comp_cad_meu_animal/dropdown.dart';
import 'package:petsaojoao/components/comp_cad_meu_animal/textfield.dart';
import 'package:petsaojoao/components/comp_cad_meu_animal/text_label.dart';
import 'package:petsaojoao/components/comp_publico/alert.dart';
import 'package:petsaojoao/components/comp_publico/button.dart';
import 'package:petsaojoao/components/comp_publico/sizebox.dart';

import 'my_pet_info_screen2.dart';

TextEditingController _namePetController = new TextEditingController();
TextEditingController _especieController = new TextEditingController();
TextEditingController _sexoPetController = new TextEditingController();

class RegMyPet extends StatefulWidget {
  @override
  _RegMyPetState createState() => _RegMyPetState();
}

class _RegMyPetState extends State<RegMyPet> {
  bool erroNomePet = false;
  bool erroEspecie = false;
  bool erroSexoPet = false;
  FocusNode myFocusNode;

  void _validaForm(String nomePet, String especie, String sexoPet) {
    var valNomePet = _validaNomePet(nomePet);
    var valEspecie = _validaEspecie(especie);
    var valSexoPet = _validaSexoPet(sexoPet);

    if (valNomePet == true && valEspecie == true && valSexoPet == true) {
      print("Todos os Dados Passaram!!!");
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => InfoAnimalDois()));
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

  List<DropdownMenuItem<String>> listDropEspecie = [];
  List<DropdownMenuItem<String>> listDropSexo = [];

  void loadDataEspecie() {
    listDropEspecie = [];

    listDropEspecie.add(new DropdownMenuItem(
      child: Row(children: <Widget>[
        Icon(
          FontAwesomeIcons.dog,
          color: Colors.black54,
        ),
        SizedBox(
          width: 10.0,
        ),
        Text(
          "Cachorro",
          style: TextStyle(
            color: Colors.black54,
          ),
        )
      ]),
      value: "Cachorro",
    ));
    listDropEspecie.add(new DropdownMenuItem(
      child: Row(children: <Widget>[
        Icon(
          FontAwesomeIcons.cat,
          color: Colors.black54,
        ),
        SizedBox(
          width: 10.0,
        ),
        Text(
          "Gato",
          style: TextStyle(
            color: Colors.black54,
          ),
        )
      ]),
      value: "Gato",
    ));
  }

  void loadDataSexo() {
    listDropSexo = [];

    listDropSexo.add(new DropdownMenuItem(
      child: Row(children: <Widget>[
        Icon(
          FontAwesomeIcons.mars,
          color: Colors.black54,
        ),
        SizedBox(
          width: 10.0,
        ),
        Text(
          "Macho",
          style: TextStyle(
            color: Colors.black54,
          ),
        )
      ]),
      value: "Macho",
    ));
    listDropSexo.add(new DropdownMenuItem(
      child: Row(children: <Widget>[
        Icon(
          FontAwesomeIcons.venus,
          color: Colors.black54,
        ),
        SizedBox(
          width: 10.0,
        ),
        Text(
          "Fêmea",
          style: TextStyle(
            color: Colors.black54,
          ),
        )
      ]),
      value: "Fêmea",
    ));
  }

  void _selectSexo(value) {
    setState(() {
      _sexoPetController.text = value;
    });
  }

  void _selectEspecie(value) {
    setState(() {
      _especieController.text = value;
    });
  }

  bool _validaNomePet(String nome) {
    String patttern =
        r'(^[a-zA-ZàèìòùÀÈÌÒÙáéíóúýÁÉÍÓÚÝâêîôûÂÊÎÔÛãñõÃÑÕäëïöüÿÄËÏÖÜŸçÇ]*$)';
    RegExp regExp = new RegExp(patttern);

    if (!regExp.hasMatch(nome) || nome.length < 2) {
      setState(() {
        erroNomePet = true;
        print("Nome inválido");
        alertaErro(context, FontAwesomeIcons.bone, "Nome Pet Inválido",
            "Digite nome completo do seu Pet,\n - Ex.:Pablo Escobar");
      });
      return false;
    } else {
      setState(() {
        erroNomePet = false;
        print("nome ok");
      });
      return true;
    }
  }

  bool _validaEspecie(String especie) {
    if (especie == "") {
      setState(() {
        erroEspecie = true;
        print("Espécie inválida");
        alertaErro(context, FontAwesomeIcons.paw, "Espécie inválida",
            "Selecione espécie do seu animal corretamente.");
      });
      return false;
    } else {
      setState(() {
        erroEspecie = false;
        print("Especie ok");
      });
      return true;
    }
  }

  bool _validaSexoPet(String sexoPet) {
    if (sexoPet == "") {
      setState(() {
        erroSexoPet = true;
        print("Sexo do Pet inválido");
        alertaErro(context, FontAwesomeIcons.venusMars, "Sexo do Pet Inválido",
            "Selecione sexo do seu animal corretamente.");
      });
      return false;
    } else {
      setState(() {
        erroSexoPet = false;
        print("Sexo Pet ok");
      });
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    loadDataEspecie();
    loadDataSexo();

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
                child: pergunta_form('Conhecendo seu Pet'),
              ),
              sizebox(50.0),
            ],
          ),
        ),
        sizebox(10.0),
        info_dados(context),
        sizebox(20.0),
        textFielNomePet(
            null, _namePetController, erroNomePet, "Nome do Animal"),
        sizebox(30.0),
        dropdown(_especieController, erroEspecie, FontAwesomeIcons.paw,
            "Espécie", null, listDropEspecie, (value) => _selectEspecie(value)),
        sizebox(30.0),
        dropdown(_sexoPetController, erroSexoPet, FontAwesomeIcons.venusMars,
            "Sexo", null, listDropSexo, (value) => _selectSexo(value)),
        sizebox(40.0),
        buttonConfirmForm(
          () {
            _validaForm(_namePetController.text, _especieController.text,
                _sexoPetController.text);
          },
        ),
        sizebox(20.0),
      ]),
    );
  }
}
