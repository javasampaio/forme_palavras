import 'package:core/exceptions/enums_exceptions/enum_type_validator.dart';

abstract class AbstractValidator {
  AbstractValidator(this.typeValidator, this.minDigits, this.maxDigits,
      this.value, this.valueToCompare);
  EnumTypeValidator typeValidator;

  //EnumTypeCompare typeCompare;

  int minDigits;

  int maxDigits;

  dynamic value;

  dynamic valueToCompare;

  String invalidMessage;
}
