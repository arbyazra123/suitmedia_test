import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:suitmedia_test/core/user/user_cubit.dart';
import 'package:suitmedia_test/modules/first/pages/first_page.dart';
import 'package:suitmedia_test/modules/third/data/repositories/user_repository.dart';
import 'package:suitmedia_test/shared/shared.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initializeDateFormatting('ID', null);
  HttpOverrides.global = new MyHttpOverrides();
  var repository = UserRepositoryImpl();
  BlocOverrides.runZoned(
      () => runApp(MultiRepositoryProvider(
            providers: [
              RepositoryProvider<UserRepository>(
                create: (context) => repository,
              ),
            ],
            child: MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => UserCubit(),
                ),
              ],
              child: MyApp(),
            ),
          )),
      blocObserver: AppBlocObserver());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Suitmedia - Test",
      theme: LightTheme.themeData,
      home: FirstPage(),
    );
  }
}
