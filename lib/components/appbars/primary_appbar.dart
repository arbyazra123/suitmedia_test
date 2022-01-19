import 'package:flutter/material.dart';
import 'package:suitmedia_test/components/texts/texts.dart';
import 'package:suitmedia_test/shared/shared.dart';

class PrimaryAppBar extends PreferredSize {
  final String title;
  const PrimaryAppBar(
    this.title, {
    Key? key,
  }) : super(
          child: const SizedBox(),
          preferredSize: const Size(double.maxFinite, kToolbarHeight),
        );

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.5,
      backgroundColor: Colors.white,
      leading: IconButton(
        icon: Icon(
          Icons.chevron_left_outlined,
          size: 35,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      iconTheme: IconThemeData(
        color: AppColors.accent,
      ),
      centerTitle: true,
      title: H1Atm(
        title,
        style: appBarTitleTextStyle,
      ),
    );
  }
}
