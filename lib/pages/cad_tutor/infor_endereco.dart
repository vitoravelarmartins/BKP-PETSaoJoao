import 'package:flutter/material.dart';
import 'package:petsaojoao/components/comp_cad_tutor/alert.dart';
import 'package:petsaojoao/components/comp_cad_tutor/text_label.dart';
import 'package:petsaojoao/components/comp_cad_tutor/sizebox.dart';
import 'package:petsaojoao/components/comp_cad_tutor/textfield.dart';
import 'package:petsaojoao/pages/cad_tutor/consulta_CEP/result_cep.dart';
import 'package:petsaojoao/pages/cad_tutor/consulta_CEP/via_cep_service.dart';
import 'package:petsaojoao/components/comp_cad_tutor/textfield.dart';

import 'package:masked_text/masked_text.dart';

class info_endereco extends StatefulWidget {
  @override
  _info_enderecoState createState() => _info_enderecoState();
}

class _info_enderecoState extends State<info_endereco> {
  TextEditingController _searchCepController = TextEditingController();
  TextEditingController _logradouroController = TextEditingController();
  TextEditingController _bairroController = TextEditingController();
  TextEditingController _numeroCasaController = TextEditingController();
  TextEditingController _complementoCasaController = TextEditingController();

  var readOnlyLogra = true;
  var readOnlyBairro = true;

  bool erroCEP = false;
  bool erroNumero = false;
  bool erroComplemento = false;
  //bool _loading = false;
  bool _enableField = true;
  bool ativarEndereco = false;
  String _result;
  String _resultLocalidade;
  String _resultLogradouro;
  String _resultBairro;

  FocusNode myFocusNode;

  @override
  void initState() {
    super.initState();

    myFocusNode = FocusNode();
  }

  void readOnlyActionLogra() {
    setState(() {
      if (readOnlyLogra == true) {
        readOnlyLogra = false;
      } else {
        readOnlyLogra = true;
      }
    });
  }

  void readOnlyActionBairro() {
    setState(() {
      if (readOnlyBairro == true) {
        readOnlyBairro = false;
      } else {
        readOnlyBairro = true;
      }
    });
  }

  void dispose() {
    super.dispose();
    _searchCepController.clear();
    myFocusNode.dispose();
  }

  void _searching(bool enable) {
    setState(() {
      _result = enable ? '' : _result;
      _resultLocalidade = enable ? '' : _resultLocalidade;
      _resultLogradouro = enable ? '' : _resultLogradouro;
      _resultBairro = enable ? '' : _resultBairro;

      //_loading = enable;
      _enableField = !enable;
    });
  }

  void chamacep(String value) {
    _searchCep();
  }

  Future _searchCep() async {
    setState(() {
      ativarEndereco = true;
    });
    _searching(true);

    final cep = _searchCepController.text;

    final resultCep = await ViaCepService.fetchCep(cep: cep);

    print(resultCep.localidade);

    // Exibindo somente a localidade no terminal
    if (resultCep.localidade == "São João da Boa Vista") {
      myFocusNode.requestFocus();
      setState(() {
        _result = resultCep.toJson();
        _resultLocalidade = resultCep.localidade;
        _resultLogradouro = resultCep.logradouro;
        _resultBairro = resultCep.bairro;
      });

      _searching(false);
    } else {
      popupCEPErro();
    }
  }

  void popupCEPErro() {
    print("Cep fora São João da Boa Vista");
    alertaCEP(context, "CEP Inválido",
        "Desculpe, no momento só aceitamos CEP's do município de São João da Boa Vista - SP");
  }

  @override
  Widget build(BuildContext context) {
    _logradouroController.text = _resultLogradouro ?? '';
    _bairroController.text = _resultBairro ?? '';

    return Scaffold(
      backgroundColor: Colors.white,
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
              Center(child: conta_passos('2 de 3')),
              sizebox(30.0),
              Center(
                child: pergunta_form('Onde você mora?'),
              ),
              sizebox(50.0),
            ],
          ),
        ),
        sizebox(10.0),
        info_dados(),
        sizebox(20.0),
        textFieldCEP(_searchCep, chamacep, _searchCepController, 8, erroCEP,
            "CEP", null, _searchCep),
        sizebox(20.0),
        textFieldEndereco(ativarEndereco, _logradouroController, readOnlyLogra,
            null, "Logradouro", null, readOnlyActionLogra),
        sizebox(5.0),
        textFieldEndereco(ativarEndereco, _bairroController, readOnlyBairro,
            null, "Bairro", null, readOnlyActionBairro),
        sizebox(10.0),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Flexible(
                child: textFieldEnderecoNumero(
                    ativarEndereco,
                    myFocusNode,
                    _numeroCasaController,
                    false,
                    erroNumero,
                    "Número",
                    "Número",
                    null),
              ),
              Flexible(
                child: textFieldEnderecoComplemento(
                    ativarEndereco,
                    null,
                    _complementoCasaController,
                    false,
                    erroComplemento,
                    "Complemento",
                    "Complemento",
                    null),
              ),
            ],
          ),
        ),
        sizebox(50.0),
        Container(
            padding: EdgeInsets.only(
              right: 15,
            ),
            alignment: Alignment.bottomRight,
            child: FloatingActionButton(
              onPressed: () {},
              child: Icon(Icons.keyboard_arrow_right),
            )),
        sizebox(20.0),
      ]),
    );
  }
}
