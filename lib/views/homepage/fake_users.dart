import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../models/users.dart';

class FakeUsers extends StatefulWidget {
  const FakeUsers({super.key});
  @override
  State<FakeUsers> createState() => _FakeUsersState();
}

class _FakeUsersState extends State<FakeUsers> {
  List<Users> users = []; // Users List
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("REST Api Call"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: fetchUser,
          child: const Icon(Icons.get_app),
        ),
        body: ListView.separated(
          itemBuilder: (context, index) {
            return ListTile(
              leading: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.network(users[index].picutre.mediumPicure)),
              title: Text(users[index].name.fullName()),
              subtitle: Text(users[index].email),
              trailing: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(users[index].gender),
                  Text(users[index].dateOfBith.age)
                ],
              ),
            );
          },
          itemCount: users.length,
          separatorBuilder: (BuildContext context, int index) {
            return const Divider(
              thickness: 5,
            );
          },
        ));
  }

  void fetchUser() async {
    print("Fatch User Called");
    showToast(context, "Data Fatching Form Api");
    var url = "https://randomuser.me/api/?results=100";
    var uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);

    //print(json);

    if (json["results"] is List) {
      var jsonAsList = json["results"] as List;
      for (var element in jsonAsList) {
        users.add(Users.formJson(element));
      }
    }
    // print('Body: $json');

    setState(() {});
    print("Function End Point");
  }

  void showToast(BuildContext context, String text) {
    var scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(SnackBar(
      content: Text(text),
      behavior: SnackBarBehavior.floating,
      action: SnackBarAction(
        label: "Okay",
        onPressed: scaffold.hideCurrentSnackBar,
      ),
    ));
  }
}
