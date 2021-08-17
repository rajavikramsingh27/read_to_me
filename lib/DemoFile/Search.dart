import 'package:flutter/material.dart';

import 'package:dropdown_search/dropdown_search.dart';

class Search extends StatefulWidget {
  const Search({key}) : super(key: key);
  

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Column(
        children: [
          DropdownSearch<UserModel>(
            label: "Name",
            onFind: (String filter) => getData(filter),
            itemAsString: (UserModel u) => u.userAsStringByName(),
            onChanged: (UserModel data) => print(data),
          ),

          DropdownSearch<UserModel>(
            label: "Name",
            onFind: (String filter) => getData(filter),
            itemAsString: (UserModel u) => u.userAsStringById(),
            onChanged: (UserModel data) => print(data),
          ),
        ],
      ),
    );
  }

  getData(String filter) {}
}

class UserModel {
  userAsStringByName() {}

  userAsStringById() {}
}


