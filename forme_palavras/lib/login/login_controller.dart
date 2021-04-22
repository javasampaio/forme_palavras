import 'package:mobx/mobx.dart';
import 'package:core/utils/util_validator.dart';
import 'package:core/validators/empty_validator.dart';

part 'login_controller.g.dart';

class LoginController = _LoginController with _$LoginController;

abstract class _LoginController with Store {

  @observable
  String nickname = '';

  @computed
  bool get validateNickname => _validateNickname();
  
  @action
  void setNickname(String nickname) {
    this.nickname = nickname;
  }
  
  _validateNickname() {
    return UtilValidator.validateField('', nickname, [EmptyValidator()]);
  }
}