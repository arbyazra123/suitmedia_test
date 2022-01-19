import 'package:flutter/material.dart';
import 'package:suitmedia_test/components/texts/texts.dart';
import 'package:suitmedia_test/shared/shared.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final double height;
  final double? width;
  final bool withIcon;
  final Color color;
  final Widget? child;
  final VoidCallback onTap;
  const PrimaryButton({
    Key? key,
    required this.text,
    this.height = 50,
    this.withIcon = false,
    this.width,
    required this.onTap,
    this.color = AppColors.primary,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: TextButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              color,
            ),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                Dimens.buttonRadius,
              ),
            ))),
        child: child ??
            (withIcon
                ? _withIconButton()
                : H2Atm(
                    text,
                    style: primaryTextStyle.copyWith(
                        color: Colors.white, fontWeight: FontWeight.w600),
                  )),
        onPressed: onTap,
      ),
    );
  }

  //button dengan Icon
  Widget _withIconButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        H3Atm(
          text,
          style: primaryTextStyle.copyWith(color: Colors.white),
        ),
        SizedBox(
          width: 5,
        ),
        Icon(
          Icons.arrow_forward,
          color: Colors.white,
        )
      ],
    );
  }
}
