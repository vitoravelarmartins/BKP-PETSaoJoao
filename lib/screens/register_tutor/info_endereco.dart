import 'package:flutter/material.dart';
import 'package:petsaojoao/components/comp_cad_tutor/text_label.dart';
import 'package:petsaojoao/components/comp_cad_tutor/textfield.dart';
import 'package:petsaojoao/components/comp_publico/alert.dart';
import 'package:petsaojoao/components/comp_publico/button.dart';
import 'package:petsaojoao/components/comp_publico/sizebox.dart';
import 'package:petsaojoao/screens/register_tutor/consulta_CEP/result_cep.dart';
import 'package:petsaojoao/screens/register_tutor/consulta_CEP/via_cep_service.dart';
import 'package:petsaojoao/screens/register_tutor/info_contato.dart';

import 'package:masked_text/masked_text.dart';

class InfoEndereco extends StatefulWidget {
  @override
  _InfoEnderecoState createState() => _InfoEnderecoState();
}

class _InfoEnderecoState extends State<InfoEndereco> {
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
  void _validaForm(String numero, bool erro) {
    var numeroCasa = validaNumero(numero);
    var erroCep = erro;

    if (erroCep == false && numeroCasa == true) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => InfoContato()));
    }
  }

  bool validaNumero(String numero) {
    String patttern = r'(^[0-9]*$)';
    RegExp regExp = new RegExp(patttern);
    if (!regExp.hasMatch(numero) || numero.isEmpty) {
      setState(() {
        erroNumero = true;
      });
      print("passando");
      alertaErro(context, Icons.place, "Número Inválido",
          "Por favor, digite um  número válido, caso sua residência não possua número digite numero 0.");
      return false;
    } else {
      setState(() {
        erroNumero = false;
        return true;
      });
    }
    return true;
  }

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

  void _chamacep(String value) {
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
        erroCEP = false;
        _result = resultCep.toJson();
        _resultLocalidade = resultCep.localidade;
        _resultLogradouro = resultCep.logradouro;
        _resultBairro = resultCep.bairro;
        return true;
      });

      _searching(false);
    } else {
      setState(() {
        erroCEP = true;
      });

      popupCEPErro();
      return false;
    }
  }

  void popupCEPErro() {
    print("Cep fora São João da Boa Vista");
    alertaErro(context, Icons.place, "CEP Inválido",
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
        info_dados(context),
        sizebox(20.0),
        textFieldCEP(_searchCep, _chamacep, _searchCepController, 8, erroCEP,
            "CEP", null, _searchCep),
        sizebox(30.0),
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
        buttonConfirmForm(
          () {
            _validaForm(_numeroCasaController.text, erroCEP);
          },
        ),
        sizebox(20.0),
      ]),
    );
  }
}
