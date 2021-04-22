import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:ui_toolkit/colors/app_colors.dart';
import 'package:ui_toolkit/widget/inputs/tooltip_shape_border.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    Key key,
    this.text,
    this.title,
    this.validator,
    this.icon,
    this.helpText,
    this.obscureText = false,
    this.onChanged,
    this.inputFormatters,
    this.textInputAction,
    this.keyboardType,
    this.onFieldSubmitted,
    this.maxLength,
    this.controller,
    this.enabled = true,
    this.hintText,
    this.onFocusChanged,
    this.initialValue,
    this.validateOnChange = false,
  }) : super(key: key);

  final String text;
  final String title;
  final String Function(dynamic) validator;
  final Icon icon;
  final String helpText;
  final bool obscureText;
  final Function(String) onChanged;
  final List<TextInputFormatter> inputFormatters;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final void Function(String) onFieldSubmitted;
  final int maxLength;
  final TextEditingController controller;
  final bool enabled;
  final String hintText;
  final void Function(bool) onFocusChanged;
  final String initialValue;
  final bool validateOnChange;

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField>
    with TickerProviderStateMixin, WidgetsBindingObserver {
  final Duration _timerTextHelp = Duration(seconds: 5);
  final LayerLink _layerLink = LayerLink();
  final FocusNode _focusNodeInput = FocusNode();
  final Icon _iconClose = Icon(Icons.highlight_off);

  GlobalKey _iconKey;
  GlobalKey _formFieldKey;
  OverlayEntry _overlayEntry;
  bool _isShowing = false;
  FormFieldState _formState;
  Timer _timer;
  OutlineInputBorder _inputBorder;
  AnimationController _controller;
  Icon _iconObscureText = Icon(Icons.visibility_off);
  Icon _iconDefault;
  double _viewHeigh;
  bool _isValidating = false;
  TextEditingController _textEditingController;

  @override
  void initState() {
    _iconKey = GlobalKey();
    _formFieldKey = GlobalKey();
    _textEditingController = widget?.controller ??
        TextEditingController(text: widget.initialValue ?? '');
    _inputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(color: AppColors.gray30, width: 0.5),
    );
    _focusNodeInput.addListener(() {
      setState(() {
        _inputBorder = OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(
              color: _focusNodeInput.hasFocus
                  ? AppColors.gray50
                  : AppColors.gray30,
              width: _focusNodeInput.hasFocus ? 1.0 : 0.5),
        );

        if (widget.onFocusChanged != null) {
          widget.onFocusChanged(_focusNodeInput.hasFocus);
        }
      });
    });

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );

    WidgetsBinding.instance.addObserver(this);

    SchedulerBinding.instance.addPostFrameCallback((_) {
      _viewHeigh = MediaQuery.of(context).size.height;
    });

    _iconDefault = widget.helpText != null && widget.icon == null
        ? Icon(Icons.info)
        : widget.icon;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          Positioned(
            child: CompositedTransformTarget(
              link: _layerLink,
              child: FormField(
                key: _formFieldKey,
                builder: (state) {
                  _formState = state;
                  return InputDecorator(
                    decoration: InputDecoration(
                      errorText: _formState.errorText,
                      contentPadding: EdgeInsets.only(
                          top: 0, bottom: 0, left: 16, right: 44),
                      enabledBorder: _inputBorder,
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          borderSide:
                              BorderSide(color: AppColors.red50, width: 1.0)),
                    ),
                    child: TextFormField(
                      key: widget.key,
                      focusNode: _focusNodeInput,
                      obscureText: widget.obscureText && !_isShowing,
                      style: TextStyle(color: AppColors.gray70, fontSize: 19),
                      onChanged: (value) {
                        if (widget.validateOnChange) {
                          _formState.validate();
                        }
                        widget.onChanged(value);
                      },
                      inputFormatters: widget.inputFormatters,
                      textInputAction: widget.textInputAction,
                      keyboardType: widget.keyboardType,
                      onFieldSubmitted: widget.onFieldSubmitted,
                      maxLength: widget.maxLength,
                      controller: _textEditingController,
                      enabled: widget.enabled,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(top: 8, bottom: 8),
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        focusedErrorBorder: InputBorder.none,
                        labelText: widget.title,
                        labelStyle:
                            TextStyle(fontSize: 16, color: AppColors.gray50),
                        hintText: widget.hintText,
                        counter: SizedBox(
                          height: 0,
                        ),
                      ),
                    ),
                  );
                },
                validator: _validation,
              ),
            ),
          ),
          Visibility(
            visible: _showIcon,
            child: Positioned(
              right: 0,
              top: 0,
              child: IconButton(
                padding: EdgeInsets.only(top: 8),
                key: _iconKey,
                color: AppColors.gray50,
                icon: _icon,
                onPressed: _showOrHideOverlay,
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool get _showIcon =>
      _iconDefault != null || widget.obscureText || _isValidating;

  Icon get _icon => _isValidating &&
          !widget.obscureText &&
          _textEditingController.text.isNotEmpty
      ? _iconClose
      : _iconDefault != null && !widget.obscureText
          ? _iconDefault
          : _iconObscureText;

  void _findOffsetInput() {
    const _padding = 16;
    if (_iconDefault == null || widget.helpText == null) {
      return;
    }
    final RenderBox renderBoxIcon = _iconKey.currentContext.findRenderObject();
    final RenderBox renderBoxFormField =
        _formFieldKey.currentContext.findRenderObject();
    final offsetInput = renderBoxFormField.localToGlobal(Offset.zero);
    final size = _textSize(widget.helpText, TextStyle(color: Colors.white),
        renderBoxFormField.size.width);

    final totalHeightOverlay =
        size.height + renderBoxIcon.size.height + _padding;
    final position = offsetInput.dy + totalHeightOverlay;

    _overlayEntry = _initOverlay(
        renderBoxFormField.size.width,
        renderBoxIcon.size.height,
        widget.helpText,
        position + _padding > _viewHeigh,
        size.height + (renderBoxIcon.size.height / 2));
    _showOverlay();
  }

  String _validation(value) {
    if (widget.validator == null) {
      return null;
    }
    final valid = widget.validator(_textEditingController.text);
    _isValidating = valid != null;
    if (_isValidating) {
      setState(() {});
    }
    return valid;
  }

  void _showOrHideOverlay() {
    if (_isValidating &&
        !widget.obscureText &&
        _textEditingController.text.isNotEmpty) {
      _textEditingController?.clear();
      _formState?.reset();
      setState(() {
        _isValidating = false;
      });
      return;
    }

    if (widget.obscureText) {
      setState(() {
        _iconObscureText =
            _isShowing ? Icon(Icons.visibility_off) : Icon(Icons.visibility);
        _isShowing = !_isShowing;
      });
      return;
    }

    if (_isShowing) {
      _controller.reverse();
      Future.delayed(Duration(seconds: 2)).then((onValue) {
        _hideOverlay();
      });
      _isShowing = false;
      _timer?.cancel();
      return;
    }

    _findOffsetInput();
    _isShowing = true;
    _countDown();
    _controller.forward();
  }

  void _countDown() {
    int _start = _timerTextHelp.inMilliseconds;
    const oneSecond = Duration(seconds: 1);
    _timer = Timer.periodic(
        oneSecond,
        (Timer timer) => setState(() {
              if (_start < 1000) {
                if (timer != null) {
                  timer.cancel();
                  _showOrHideOverlay();
                }
              } else {
                _start = _start - 1000;
              }
            }));
  }

  @override
  void didChangeMetrics() {
    _viewHeigh = (window.physicalSize.height - window.viewInsets.bottom) /
        window.devicePixelRatio;
    super.didChangeMetrics();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _hideOverlay();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  Size _textSize(String text, TextStyle style, double width) {
    final TextPainter textPainter = TextPainter(
        text: TextSpan(text: text, style: style),
        textDirection: TextDirection.ltr)
      ..layout(minWidth: 0, maxWidth: width);
    return textPainter.size;
  }

  void _showOverlay() {
    Overlay.of(context).insert(_overlayEntry);
  }

  void _hideOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  OverlayEntry _initOverlay(double width, double iconHeight, String text,
      bool showUp, double totalHeightOverlay) {
    return OverlayEntry(
      builder: (context) {
        return Positioned(
          width: width,
          child: CompositedTransformFollower(
            link: _layerLink,
            showWhenUnlinked: false,
            offset: showUp
                ? Offset(0.0, -totalHeightOverlay - 11)
                : Offset(0.0, iconHeight - 2),
            child: ScaleTransition(
              scale: CurvedAnimation(
                parent: _controller,
                curve: Interval(0.0, 0.6, curve: Curves.bounceInOut),
              ),
              alignment: Alignment(0.8, showUp ? 0.8 : -0.8),
              child: Material(
                color: Colors.transparent,
                child: Container(
                  decoration: ShapeDecoration(
                    color: AppColors.brown50,
                    shape: TooltipShapeBorder(
                        arrowArc: 0.1, radius: 8, showUp: showUp),
                    shadows: [
                      BoxShadow(
                          color: Colors.black26,
                          blurRadius: 4.0,
                          offset: Offset(2, 2))
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(text, style: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
