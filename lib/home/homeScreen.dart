import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:user_test/home/components/home_list_builder.dart';
import 'package:user_test/model/user_info_model.dart';
import 'package:user_test/provider/main_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static String routeName = "/";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    final provider = Provider.of<UserProvider>(context, listen: false);
    provider.fetchUserData(context);
  }

  bool sorted = false;

  List<UserData> finalData = [];
  List<UserData>? firstCharacterArray = [];
  String? showedValue;

  List<String> dropItems = [
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
    "H",
    "I",
    "J",
    "K",
    "L",
    "M",
    "N",
    "O",
    "P",
    "Q",
    "R",
    "S",
    "T",
    "U",
    "V",
    "W",
    "X",
    "Y",
    "Z",
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, data, _) {
        if (data.userAllData == null) {
          return const Scaffold(
            body: SafeArea(child: Text("data not found")),
          );
        }
        finalData = data.userAllData!.reversed.toList();
        if (sorted) {
          firstCharacterArray =
              finalData.where((e) => e.name![0] == showedValue).toList();
        }
        firstCharacterArray =
            data.userAllData?.where((e) => e.name![0] == showedValue).toList();

        print(showedValue);

        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton.icon(
                      icon: RotatedBox(
                        quarterTurns: 1,
                        child: Icon(
                          Icons.compare_arrows,
                          size: 28,
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          sorted = !sorted;
                        });
                      },
                      label: Text(
                        sorted == true ? "A to Z" : "Z to A",
                      ),
                    ),
                    DropdownButton(
                      value: showedValue,
                      items: dropItems.map((String item) {
                        return DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (value) =>
                          setState(() => this.showedValue = value),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          showedValue = null;
                        });
                      },
                      icon: Icon(Icons.delete),
                    ),
                  ],
                ),
                HomeListBuilder(
                  allNames: showedValue == null
                      ? sorted
                          ? finalData
                          : data.userAllData
                      : firstCharacterArray,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
