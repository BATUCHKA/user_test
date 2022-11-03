import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:math';

import 'package:user_test/model/user_info_model.dart';

class HomeListBuilder extends StatelessWidget {
  final List<UserData>? allNames;

  HomeListBuilder({
    super.key,
    required this.allNames,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: allNames?.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              child: Text(
                allNames?[index].name?[0] ?? "",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              backgroundColor:
                  Colors.primaries[Random().nextInt(Colors.primaries.length)],
            ),
            title: Text(
              allNames?[index].name ?? "",
            ),
            subtitle: Text(
              allNames?[index].phone ?? "",
            ),
          );
        },
      ),
    );
  }
}
