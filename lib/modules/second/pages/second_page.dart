import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:suitmedia_test/components/appbars/primary_appbar.dart';
import 'package:suitmedia_test/components/buttons/primary_button.dart';
import 'package:suitmedia_test/components/listviews/users_listview.dart';
import 'package:suitmedia_test/components/texts/texts.dart';
import 'package:suitmedia_test/core/user/user_cubit.dart';
import 'package:suitmedia_test/modules/third/pages/third_page.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar("Second Screen"),
      floatingActionButton: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        width: double.maxFinite,
        child: PrimaryButton(
          height: 45,
          text: "CHOOSE USER",
          onTap: onChooseUser,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WelcomeUserText(),
            Expanded(child: BlocBuilder<UserCubit, UserState>(
              builder: (context, state) {
                if (state.selectedUsers.users.length == 0) {
                  return Center(
                    child: Text(
                      "Selected User Name",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 26
                      ),
                    ),
                  );
                }
                return SingleChildScrollView(
                  child: SelectedUsers(
                    users: state.selectedUsers.users,
                  ),
                );
              },
            )),
          ],
        ),
      ),
    );
  }

  void onChooseUser() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ThirdPage(),
        ));
  }
}

class WelcomeUserText extends StatelessWidget {
  const WelcomeUserText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          H4Atm(
            "Welcome",
          ),
          H1Atm(
            context.read<UserCubit>().state.name,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
