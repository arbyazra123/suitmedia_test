import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:suitmedia_test/shared/shared.dart';

class PrimaryTextField extends StatelessWidget {
  final Color? fillColor;
  final bool? filled;
  final double height;
  final String? hintText;
  final TextEditingController? controller;
  final String? errorText;
  final String? labelText;
  final FocusNode? focusNode;
  final String? initialValue;
  final ValueChanged<String>? onChanged;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Widget? prefix;
  final bool? isObscure;
  final VoidCallback? onTap;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onFieldSubmitted;
  final bool? enabled;
  final int? maxLines;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final bool? readOnly;
  final int? maxLength;
  final double? horizontalPadding;
  final bool? hasOutlineBorder;
  final bool? hasBackground;
  final double? outlineBorderRadius;
  final TextDirection? textDirection;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final bool? hasBorder;
  final List<TextInputFormatter>? textInputFormatters;
  final TextAlign? textAlign;
  const PrimaryTextField({
    Key? key,
    this.height = 50,
    this.filled = false,
    this.textAlign,
    this.fillColor,
    this.hintText,
    this.controller,
    this.errorText,
    this.labelText,
    this.focusNode,
    this.initialValue,
    this.onChanged,
    this.suffixIcon,
    this.prefixIcon,
    this.prefix,
    this.onTap,
    this.validator,
    this.onFieldSubmitted,
    this.textInputAction,
    this.keyboardType,
    this.maxLength,
    this.horizontalPadding,
    this.textDirection,
    this.style,
    this.hintStyle,
    this.textInputFormatters,
    this.enabled = true,
    this.maxLines = 1,
    this.readOnly = false,
    this.isObscure = false,
    this.hasBorder = true,
    this.hasOutlineBorder = false,
    this.outlineBorderRadius = Dimens.textFieldRadius,
    this.hasBackground = false,
    this.labelStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(13)),
      borderSide: BorderSide(
        color: Colors.grey[200]!,
      ),
    );
    final focusedOutlineInputBorder = OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey[200]!,
        width: 0.5,
      ),
      borderRadius: BorderRadius.circular(outlineBorderRadius!),
    );
    final underlineInputBorder = UnderlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey[200]!,
      ),
    );
    final focusedUnderlineInputBorder = UnderlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.primary,
        width: 0.5,
      ),
    );
    return Container(
      height: height,
      child: TextFormField(
        
        textAlign: textAlign ?? TextAlign.start,
        enabled: enabled,
        controller: controller,
        onTap: onTap,
        readOnly: onTap != null ? true : readOnly!,
        obscureText: isObscure!,
        maxLines: maxLines,
        maxLength: maxLength,
        initialValue: initialValue,
        inputFormatters: textInputFormatters,
        onChanged: onChanged,
        validator: validator,
        keyboardType: keyboardType,
        textDirection: textDirection,
        textInputAction: textInputAction,
        style: style,
        onFieldSubmitted: onFieldSubmitted,
        decoration: InputDecoration(
          
          isDense: true,
          fillColor: hasBackground!
              ? fillColor ?? AppColors.bgTextField
              : Colors.transparent,
          filled: hasBackground,
          focusColor: hasBackground!
              ? fillColor ?? AppColors.bgTextField
              : Colors.transparent,
          hoverColor: hasBackground!
              ? fillColor ?? AppColors.bgTextField
              : Colors.transparent,
          labelStyle: labelStyle,
          errorText: errorText,
          prefixIcon: prefixIcon,
          contentPadding: horizontalPadding != null
              ? EdgeInsets.symmetric(horizontal: horizontalPadding!)
              : EdgeInsets.symmetric(horizontal: Dimens.dp14,vertical: Dimens.dp10),
          hintStyle: hintStyle ??
              TextStyle(
                color: Colors.grey,
              ),
          hintText: hintText,
          labelText: labelText,
          suffixIcon: suffixIcon,
          enabledBorder: hasBorder!
              ? hasOutlineBorder!
                  ? outlineInputBorder
                  : underlineInputBorder
              : InputBorder.none,
          focusedBorder: hasBorder!
              ? hasOutlineBorder!
                  ? focusedOutlineInputBorder
                  : focusedUnderlineInputBorder
              : InputBorder.none,
          border: hasBorder!
              ? hasOutlineBorder!
                  ? outlineInputBorder
                  : underlineInputBorder
              : InputBorder.none,
        ),
      ),
    );
  }
}
