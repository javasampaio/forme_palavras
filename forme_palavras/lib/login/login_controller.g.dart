// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginController on _LoginController, Store {
  Computed<bool> _$validateNicknameComputed;

  @override
  bool get validateNickname => (_$validateNicknameComputed ??= Computed<bool>(
          () => super.validateNickname,
          name: '_LoginController.validateNickname'))
      .value;

  final _$nicknameAtom = Atom(name: '_LoginController.nickname');

  @override
  String get nickname {
    _$nicknameAtom.reportRead();
    return super.nickname;
  }

  @override
  set nickname(String value) {
    _$nicknameAtom.reportWrite(value, super.nickname, () {
      super.nickname = value;
    });
  }

  final _$_LoginControllerActionController =
      ActionController(name: '_LoginController');

  @override
  void setNickname(String nickname) {
    final _$actionInfo = _$_LoginControllerActionController.startAction(
        name: '_LoginController.setNickname');
    try {
      return super.setNickname(nickname);
    } finally {
      _$_LoginControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
nickname: ${nickname},
validateNickname: ${validateNickname}
    ''';
  }
}
