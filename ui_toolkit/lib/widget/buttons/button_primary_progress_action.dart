import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ui_toolkit/colors/app_colors.dart';

class ButtonPrimaryProgressAction extends StatefulWidget {
  const ButtonPrimaryProgressAction({
    this.title,
    this.onPressed,
    this.loading,
    Key key,
  }) : super(key: key);

  final String title;
  final Function onPressed;
  final bool loading;

  @override
  _ButtonPrimaryProgressActionState createState() =>
      _ButtonPrimaryProgressActionState();
}

class _ButtonPrimaryProgressActionState
    extends State<ButtonPrimaryProgressAction> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      child: widget.loading ?? false ? buildProgressIndicator() : buildButton(),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return ScaleTransition(child: child, scale: animation);
      },
    );
  }

  Widget buildProgressIndicator() {
    return SpinKitThreeBounce(
      color: AppColors.red50,
    );
  }

  Widget buildText() {
    return Text(widget.title,
        style: Theme.of(context)
            .textTheme
            .button
            .copyWith(color: Colors.white, fontWeight: FontWeight.bold));
  }

  Widget buildButton() {
    return SizedBox(
        height: 50,
        width: 500,
        child: FlatButton(
          onPressed: widget.onPressed,
          child: buildText(),
          disabledColor: AppColors.gray30,
          shape: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(8.0)),
          color: AppColors.red50,
        ));
  }

  // @override
  // Widget build(BuildContext context) {
  //   return SizedBox(
  //     height: 50,
  //     child: FlatButton(
  //       onPressed: widget.onPressed,
  //       child: widget.loading ?? false ? buildProgressIndicator() : buildText(),
  //       disabledColor: ColorsApp.gray30,
  //       shape: OutlineInputBorder(
  //           borderSide: BorderSide.none,
  //           borderRadius: BorderRadius.circular(8.0)),
  //       color: ColorsApp.red50,
  //     ),
  //   );
  // }

  // Widget buildProgressIndicator() {
  //   return SpinKitThreeBounce(
  //     color: Colors.white,
  //   );
  // }

  // Widget buildText() {
  //   return Text(
  //         widget.title,
  //         style: Theme.of(context)
  //             .textTheme
  //             .button
  //             .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
  //   );
  // }
}
