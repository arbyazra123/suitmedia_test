import 'package:flutter/material.dart';
import 'package:suitmedia_test/shared/shared.dart';

class H5Atm extends StatelessWidget {
  final String text;
  final int? maxLine;
  final TextOverflow? overflow;
  final TextStyle? style;
  final TextAlign? align;

  const H5Atm(
    this.text, {
    Key? key,
    this.maxLine,
    this.overflow,
    this.style,
    this.align,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLine,
      overflow: overflow,
      textAlign: align,
      style: style?.copyWith(fontSize: Dimens.dp10) ??
          TextStyle(fontSize: Dimens.dp10),
    );
  }
}
