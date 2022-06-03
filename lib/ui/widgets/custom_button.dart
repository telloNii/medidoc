import 'package:flutter/material.dart';

import '../../text_style.dart';

// ignore: must_be_immutable
class CustomButton extends StatefulWidget {
  CustomButton(
      {Key? key,
      required Color color,
      required double width,
      required double height,
      required VoidCallback onPressed,
      required double radius,
      required Color textColor,
      this.label,
      this.borderSideColor,
      this.customLabel})
      : _color = color,
        _height = height,
        _width = width,
        _onPressed = onPressed,
        _radius = radius,
        _textColor = textColor,
        super(key: key);
  final Color _color;
  final Widget? customLabel;
  String? label;
  final double _height;
  final double _width;
  final double _radius;
  final VoidCallback _onPressed;
  final Color _textColor;
  final Color? borderSideColor;
  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget._height,
      width: widget._width,
      child: Material(
        type: MaterialType.canvas,
        color: widget._color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(widget._radius),
          side: widget.borderSideColor != null
              ? BorderSide(color: widget.borderSideColor!)
              : BorderSide.none,
        ),
        child: MaterialButton(
          onPressed: widget._onPressed,
          child: widget.customLabel ??
              Text(
                widget.label!,
                style: buttonTextStyle.copyWith(color: widget._textColor),
              ),
        ),
      ),
    );
  }
}
