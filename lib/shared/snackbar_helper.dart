

import 'package:flutter/material.dart';
import 'package:suitmedia_test/components/texts/texts.dart';

class SnackBarHelper{
  static void showMessage(BuildContext context,String msg){
    ScaffoldMessenger.of(context)..hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: H3Atm(msg)));
  }
}