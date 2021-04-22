
import 'package:core/exceptions/enums_exceptions/enum_type_validator.dart';

import 'abstract_validator.dart';

class EmptyValidator implements AbstractValidator{
  @override
  int maxDigits;

  @override
  int minDigits;
  
  @override
  dynamic value;

  @override
  dynamic valueToCompare; 

  @override
  EnumTypeValidator typeValidator = EnumTypeValidator.EMPTY; 
 
  //@override
  //EnumTypeCompare typeCompare;

  @override
  String invalidMessage;
}