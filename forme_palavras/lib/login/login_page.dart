import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:forme_palavras/login/login_controller.dart';
import 'package:ui_toolkit/colors/app_colors.dart';
import 'package:ui_toolkit/widget/buttons/button_primary_action.dart';
import 'package:ui_toolkit/widget/inputs/custom_text_field.dart';
import 'package:core/widgets/base_mixin.dart';
import 'package:core/utils/util_localization.dart';
import 'package:core/utils/util_validator.dart';
import 'package:core/validators/empty_validator.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with BaseMixin {
  GlobalKey<FormState> _formLogin;
  AutovalidateMode _autovalidateMode;

  @override
  Widget build(BuildContext context) {
    sharedApplication.pageContext = context;

    final LoginController _loginController = LoginController();

    _formLogin = GlobalKey<FormState>();
    _autovalidateMode = AutovalidateMode.disabled;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 4,
                decoration: BoxDecoration(
                  color: AppColors.blueGray800,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.elliptical(150, 150),
                    bottomRight: Radius.zero,
                  ),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Welcome',
                    style: TextStyle(
                        fontSize: 35,
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 6),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Card(
                  margin:
                      EdgeInsets.only(top: 48, bottom: 24, left: 24, right: 24),
                  child: Padding(
                    padding: EdgeInsets.all(24),
                    child: Form(
                      key: _formLogin,
                      autovalidateMode: _autovalidateMode,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SizedBox(
                            height: 24.0,
                          ),
                          CustomTextField(
                            title: UtilLocalization.of(context).nameOrNickname,
                            validator: (value) => UtilValidator.validateField(
                                UtilLocalization.of(context).nameOrNickname,
                                value,
                                [EmptyValidator()]),
                            onChanged: (value) =>
                                _loginController.setNickname(value),
                            onFieldSubmitted: (value) => _validateData(),
                          ),
                          SizedBox(
                            height: 24.0,
                          ),
                          CustomTextField(
                            title: 'Email',
                          ),
                          SizedBox(
                            height: 24.0,
                          ),
                          Observer(
                            builder: (_) {
                              return ButtonPrimaryAction(
                                UtilLocalization.of(context).enter,
                                () => {_loginController.validateNickname},
                              );
                            },
                          ),
                          SizedBox(
                            height: 24.0,
                          ),
                          Align(
                            child: Text(
                              'Skip',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _validateData() {
    setState(() {
      _autovalidateMode = AutovalidateMode.onUserInteraction;
    });
  }
}
