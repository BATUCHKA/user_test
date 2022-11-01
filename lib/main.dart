import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_test/home/homeScreen.dart';
import 'package:user_test/provider/main_provider.dart';

void main() {
  runApp(const MyApp());
}

final Map<String, WidgetBuilder> routes = {
  HomeScreen.routeName: (context) => const HomeScreen(),
};

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ((context) => UserProvider()))
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: "/",
        routes: routes,
      ),
    );
  }
}
