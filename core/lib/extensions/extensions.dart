import 'package:mobx/mobx.dart';

extension isNullEmptyOrWhitespace on String {
  bool get isEmptyNullOrWhitespace => this == null || isEmpty || trim().isEmpty;
}