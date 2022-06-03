import 'package:doctor_app/constants.dart';
import 'package:doctor_app/text_style.dart';
import 'package:flutter/material.dart';

class ActiveBottomNavBarTab extends StatelessWidget {
  const ActiveBottomNavBarTab({
    Key? key,
    required final String label,
    final IconData? icon,
    final EdgeInsetsGeometry? margin,
  })  : _label = label,
        _icon = icon,
        _margin = margin,
        super(key: key);
  final String _label;
  final IconData? _icon;
  final EdgeInsetsGeometry? _margin;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: _margin,
      height: 40,
      decoration:
          BoxDecoration(color: primaryColor, borderRadius: BorderRadius.circular(30)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _icon != null
                ? Icon(
                    _icon,
                    color: primaryColor2,
                    size: headline2,
                  )
                : const SizedBox(),
            Padding(
              padding: const EdgeInsets.fromLTRB(4.0, 0.0, 8, 0.0),
              child: Text(
                _label,
                style: inputTextStyle.copyWith(
                  color: primaryColor2,
                  fontSize: headline5,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
