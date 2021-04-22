
import 'package:core/application/shared_application.dart';

mixin BaseMixin {
  final SharedApplication _sharedApplication = SharedApplication();

  SharedApplication get sharedApplication => _sharedApplication;
}
