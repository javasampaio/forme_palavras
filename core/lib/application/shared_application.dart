import 'package:core/utils/util_localization.dart';
import 'package:flutter/material.dart';

class SharedApplication {
  factory SharedApplication() {
    _instance ??= SharedApplication._internalConstructor();
    return _instance;
  }

  SharedApplication._internalConstructor() {
    _customControllerMainPage = ScrollController();
  }

  static SharedApplication _instance;

  Future currentDialog;

  BuildContext appContext;

  BuildContext pageContext;

  ScrollController _customControllerMainPage;

  String _bsDialogMessage;
/*
  Stream<String> get streamDialogMessage => _bsDialogMessage.stream;

  ScrollController get customControllerMainPage => _customControllerMainPage;

  void setCurrentMessageLoading(String message) {
    if (_bsDialogMessage.hasListener && message != null) {
      _bsDialogMessage.add(message);
    }
  }

  @override
  void dispose() {
    _bsDialogMessage.close();
  }

  void removeDialog() {
    if (currentDialog != null) {
      currentDialog = null;
      Navigator.pop(pageContext);
    }
  }

  void showCustomDialog(
      {BuildContext context,
      Widget child,
      WidgetBuilder builder,
      bool barrierDismissible = true,
      bool useRootNavigator = true}) {
    currentDialog = showDialog(
        context: context,
        child: child,
        builder: builder,
        barrierDismissible: barrierDismissible,
        useRootNavigator: useRootNavigator);
  }

  void showLoadingDialog(
      BuildContext contextPage, bool barrierDismissible, String message) {
    currentDialog = showDialog(
      context: contextPage,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext context) {
        return Center(
          child: Card(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  CircularProgressIndicator(),
                  SizedBox(
                    height: 16.0,
                  ),
                  StreamBuilder<String>(
                    stream: streamDialogMessage,
                    initialData: message,
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      return Text(snapshot.data);
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void showDialogMessage(dynamic dialogMessage,
      {Function onClose, String title}) {
    removeDialog();

    if(dialogMessage.runtimeType != AbstractDialogMessage){
      dialogMessage = CommonError(dialogMessage.message);
    }

    currentDialog = showDialog(
        context: pageContext,
        barrierDismissible: false,
        builder: (context) {
          return Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 32.0, vertical: 16.0),
                      child: Column(
                        children: <Widget>[
                          _getWidgetCenter(dialogMessage, title: title),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        }).then((value) {
      if (onClose != null) {
        onClose();
      }
    });
  }

  Widget _getWidgetCenter(AbstractDialogMessage dialogMessage, {String title}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SizedBox(
          width: 72,
          height: 72,
          child: Image.asset(
            dialogMessage.imagePath,
            key: Key('imgDialog'),
          ),
        ),
        SizedBox(
          height: 16.0,
        ),
        Text(
          title ?? UtilLocalization.of(pageContext).opsSomethingIsWrong,
          style: Theme.of(pageContext).textTheme.title.copyWith(
              fontWeight: FontWeight.normal, color: ConstColors.blueAmbev),
          textAlign: TextAlign.center,
          key: Key('txtDialogTitle'),
        ),
        SizedBox(
          height: 16.0,
        ),
        Text(
          dialogMessage.message ?? '',
          style: Theme.of(pageContext).textTheme.body1.copyWith(
                fontWeight: FontWeight.normal,
                color: ConstColors.grey,
              ),
          textAlign: TextAlign.center,
          maxLines: 8,
          key: Key('txtDialogMessage'),
        ),
        SizedBox(
          height: 16.0,
        ),
        InkWell(
          child: Text(
            UtilLocalization.of(pageContext).close,
            style: Theme.of(pageContext).textTheme.title.copyWith(
                fontWeight: FontWeight.w700, color: ConstColors.blueAmbev),
            textAlign: TextAlign.center,
          ),
          onTap: () {
            removeDialog();
          },
          key: Key('tapCloseDialog'),
        )
      ],
    );
  }*/
}
