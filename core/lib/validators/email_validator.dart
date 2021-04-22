import 'package:core/exceptions/enums_exceptions/enum_type_validator.dart';
import 'package:core/validators/abstract_validator.dart';

class EmailValidator implements AbstractValidator {
  @override
  int maxDigits;

  @override
  int minDigits;
  
  @override
  dynamic value;

  @override
  dynamic valueToCompare; 

  @override
  EnumTypeValidator typeValidator = EnumTypeValidator.EMAIL;
  
  //@override
  //EnumTypeCompare typeCompare;

  @override
  String invalidMessage;
}
