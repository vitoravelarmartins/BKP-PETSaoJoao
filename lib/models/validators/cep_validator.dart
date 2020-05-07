import 'package:petsaojoao/components/comp_publico/alert.dart';
import 'package:via_cep/via_cep.dart';
import 'package:flutter/material.dart';
import 'package:petsaojoao/screens/register_tutor/andress_info.dart';

class CepValidador {
  var context;
  final title = "CEP fora São João da Boa Vista";
  final content =
      "Desculpe, no momento só aceitamos CEP's do município de São João da Boa Vista - SP";
  void validate(String value) async {
    var CEP = new via_cep();

    var result = await CEP.searchCEP(value, 'json', '');

    if (CEP.getResponse() == 200) {
      if (CEP.getLocalidade() != "São João da Boa Vista") {
        print("CepInvalido");
      } else {
        FormAndress().setAndress(CEP.getLogradouro());
      }
    } else {
      print('Código de Retorno: ' + CEP.getResponse().toString());
      print('Erro: ' + CEP.getBody());
    }
  }
}

// print('CEP: ' + CEP.getCEP());
// print('Logradouro: ' + CEP.getLogradouro());
// print('Complemento: ' + CEP.getComplemento());
// print('Bairro: ' + CEP.getBairro());
// print('Localidade: ' + CEP.getLocalidade());
// print('UF: ' + CEP.getUF());
// print('Unidade: ' + CEP.getUnidade());
// print('IBGE ' + CEP.getIBGE());
// print('GIA: ' + CEP.getGIA());
