import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_test/presentaion/home_page/city_details/city_details.dart';
import 'package:project_test/res/colors.dart';

import 'application/home/home_bloc.dart';
import 'presentaion/home_page/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeBloc()..add(HomeInitialEvent()),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: primaryColor,
        )),
        initialRoute: '/',
        routes: {
          '/': (context) => HomePage(),
          '/cityDetails': (context) => const CityDetails(),
        },
      ),
    );
  }
}
