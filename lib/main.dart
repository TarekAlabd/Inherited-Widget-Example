import 'package:flutter/material.dart';
import 'package:inherited_widget_example_app/controllers/state_widget.dart';
import 'package:inherited_widget_example_app/views/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StateWidget(
      child: Builder(
        builder: (context) {
          final state = StateInheritedWidget.of(context).state;
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Inherited Widget Example',
            theme: ThemeData(
              primarySwatch: state.primarySwatch,
            ),
            home: const HomePage(),
          );
        }
      ),
    );
  }
}
