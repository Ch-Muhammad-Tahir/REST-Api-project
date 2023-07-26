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
  List<Users> users = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("REST Api Call"),
        ),
        floatingActionButton: FloatingActionButton(onPressed: fetchUser),
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
    var url = "https://randomuser.me/api/?results=10";
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
    for (var user in users) {}
    // print('Body: $json');

    setState(() {});
    print("Function End Point");
  }
}
