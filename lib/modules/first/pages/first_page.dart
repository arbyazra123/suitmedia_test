import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:suitmedia_test/components/buttons/primary_button.dart';
import 'package:suitmedia_test/components/textfields/textfields.dart';
import 'package:suitmedia_test/components/texts/texts.dart';
import 'package:suitmedia_test/core/user/user_cubit.dart';
import 'package:suitmedia_test/modules/second/pages/second_page.dart';
import 'package:suitmedia_test/shared/assets.dart';
import 'package:suitmedia_test/shared/validators.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  var _palindromeController = TextEditingController();
  late UserCubit _userBloc;
  @override
  void initState() {
    super.initState();
    _userBloc = context.read<UserCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                Assets.background,
              ),
              fit: BoxFit.cover),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 120,
                  height: 120,
                  child: Image.asset(
                    Assets.btnAdd,
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                PrimaryTextField(
                  hintText: "Name",
                  hasBackground: true,
                  outlineBorderRadius: 10,
                  hasOutlineBorder: true,
                  onChanged: (value) => _userBloc.onNameChanged(value),
                ),
                SizedBox(
                  height: 20,
                ),
                PrimaryTextField(
                  controller: _palindromeController,
                  hintText: "Palindrome",
                  hasBackground: true,
                  outlineBorderRadius: 10,
                  hasOutlineBorder: true,
                ),
                SizedBox(
                  height: 40,
                ),
                PrimaryButton(
                  text: "CHECK",
                  width: double.maxFinite,
                  onTap: () => onCheckPalindrome(_palindromeController.text),
                ),
                SizedBox(
                  height: 20,
                ),
                PrimaryButton(
                  text: "NEXT",
                  width: double.maxFinite,
                  onTap: onNext,
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onCheckPalindrome(String text) {
    var result = Validators.isPalindrome(text);
    ScaffoldMessenger.of(context)..hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: H2Atm(
          result.toString().toUpperCase(),
          style: TextStyle(color: result ? Colors.blue : Colors.pink),
        ),
      ),
    );
  }

  void onNext() {
    if (_userBloc.state.isValid) {
      ScaffoldMessenger.of(context)..hideCurrentSnackBar();
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SecondPage(),
          ));
    } else {
      ScaffoldMessenger.of(context)..hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: H2Atm(
            "Name isn't valid",
            style: TextStyle(color: Colors.pink),
          ),
        ),
      );
    }
  }
}
