import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:user_test/provider/main_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static String routeName = "/";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // late UserProvider provider;

  @override
  void initState() {
    super.initState();
    final provider = Provider.of<UserProvider>(context, listen: false);
    provider.fetchUserData(context);
  }

  // fetchData() async {
  //   await provider.fetchUserData();
  // }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, data, _) {
        if (data.userAllData == null) {
          return const Scaffold(
            body: SafeArea(child: Text("data not found")),
          );
        }
        print(data.userAllData?.address);

        return const Scaffold(
          body: SafeArea(child: Text("this is home")),
        );
      },
    );
  }
}
