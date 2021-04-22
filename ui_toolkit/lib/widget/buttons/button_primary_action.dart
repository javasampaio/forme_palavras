import 'package:flutter/material.dart';
import 'package:ui_toolkit/colors/app_colors.dart';

class ButtonPrimaryAction extends StatelessWidget {
  const ButtonPrimaryAction(
    this.title,
    this.onPressed, {
    Key key,
  }) : super(key: key);

  final String title;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: FlatButton(
        onPressed: onPressed,
        child: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .button
              .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        disabledColor: AppColors.gray30,
        shape: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(8.0)),
        color: AppColors.red50,
      ),
    );
  }
}
