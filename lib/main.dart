import 'dart:io';
import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/finance_cubit.dart';
import 'pages/finances_page.dart';
import '../screens/signIn_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
 
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => FinancesCubit(), child: const HistoryPage())],
      child: const MaterialApp(home: SignInScreen(), debugShowCheckedModeBanner: false),
    );
  }
}
