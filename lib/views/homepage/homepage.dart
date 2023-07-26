import 'dart:collection';
import 'dart:convert';
import 'dart:ui';

import 'package:first_api_project/utils/api_constant.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../models/Quote.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Quote> quaotes = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("REST Api Call"),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: fetchUser, child: const Icon(Icons.add)),
        body: ListView.separated(
          itemBuilder: (context, index) {
            final quote = quaotes[index];
            return Card(
              elevation: 5,
              child: ListTile(
                leading: CircleAvatar(
                  child: Text("${quote.id}"),
                ),
                title: Text(quote.quote),
                subtitle: Text(quote.author),
              ),
            );
          },
          itemCount: quaotes.length,
          separatorBuilder: (BuildContext context, int index) {
            return const Divider(
              thickness: 5,
            );
          },
        ));
  }

  void fetchUser() async {
    print("Fatch User Called");
    var uri = Uri.parse(ApiConstants.url + ApiConstants.endpoint);
    final response = await http.get(uri);

    final body = response.body;
    final header = response.headers;
    final json = jsonDecode(body);
    // print('Status code: ${response.statusCode}');
    print('Headers: ${response.headers}');
    //  print('Body: ${response.body}');

    print('Farching Complete');
    // print(json["quotes"]);
    if (json["quotes"] is List) {
      var list = json["quotes"] as List;
      list.forEach((element) {
        quaotes.add(Quote.fromJosn(element));
      });
      setState(() {});
      // quaotes.forEach(
      //   (element) {
      //     print(element.author);
      //   },
      // );
      print('Farching Complete');
    }
  }
}
