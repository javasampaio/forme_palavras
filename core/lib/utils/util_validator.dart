import 'package:core/application/shared_application.dart';
import 'package:core/exceptions/enums_exceptions/enum_type_validator.dart';
import 'package:core/utils/util_localization.dart';
import 'package:core/validators/abstract_validator.dart';
import 'package:core/extensions/extensions.dart';
import 'package:sprintf/sprintf.dart';

class UtilValidator {
  static String validateField(
      String fieldName, String fieldValue, List<AbstractValidator> validators) {
    String validationMessage;

    final emptyValidator = validators.firstWhere(
        (validator) => validator.typeValidator == EnumTypeValidator.EMPTY,
        orElse: () => null);

    if (emptyValidator != null) {
      if (fieldValue.isEmptyNullOrWhitespace) {
        validationMessage = _getMessage(
          emptyValidator,
          sprintf(
            UtilLocalization.of(SharedApplication().pageContext)
                .fieldArgCannotBeEmpty,
            [fieldName],
          ),
        );
      }
    }

    final emailValidator = validators.firstWhere(
        (validator) => validator.typeValidator == EnumTypeValidator.EMAIL,
        orElse: () => null);

    if (emailValidator != null && !fieldValue.isEmptyNullOrWhitespace) {
      final bool emailValid = RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(fieldValue);
      if (!emailValid) {
        validationMessage = _getMessage(
          emailValidator,
          sprintf(
            UtilLocalization.of(SharedApplication().pageContext).invalidArg,
            [fieldName],
          ),
        );
      }
    }

    return validationMessage;
  }

  static String _getMessage(
      AbstractValidator validator, String messageDefault) {
    return validator?.invalidMessage ?? messageDefault;
  }
}
