import 'package:cpfcnpj/cpfcnpj.dart';
import 'package:logger/logger.dart';

class CpfValidator {
  String validate(String value) {
    const requiredField = "O campo é obrigatorio";
    const cpfInvalid = "CPF inválido";
    const okValidate = "Ok! CPF Passou";
    var namelogger = Logger(printer: PrettyPrinter());
    if (value.isEmpty) {
      return requiredField;
    } else if (CPF.isValid(value)) {
      return null;
    } else {
      namelogger.i("$okValidate");
      return cpfInvalid;
    }
  }
}
