import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Userdetail extends StatefulWidget {
  Userdetail({Key key}) : super(key: key);

  @override
  _UserdetailState createState() => _UserdetailState();
}

class _UserdetailState extends State<Userdetail> {
  var userId;
  var age;
  Future getData() async {
    var response = await http.get(Uri.parse(
        'https://bbank-44a46-default-rtdb.firebaseio.com/donors/$userId.json'));
    final data = jsonDecode(response.body);
    // print(data['age']);
    // age = data['age'];
    return data;
  }

  @override
  Widget build(BuildContext context) {
    final rounteArgs = ModalRoute.of(context).settings.arguments as dynamic;

    userId = (rounteArgs['userid']);
    //getData();

    //print(userId);

    return Scaffold(
      body: Container(
        child: FutureBuilder(
          future: getData(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return Container(
                child: CircularProgressIndicator(),
              );
            }
            return Column(
              children: [
                Text("Name: ${snapshot.data['name']}"),
                Text("Gender: ${snapshot.data['gender']}"),
                Text("BloodGroop: ${snapshot.data['bloodtype']}"),
                Text("Mobile No.: ${snapshot.data['mobile']}"),
                Text("Email: ${snapshot.data['email']}"),
                Text("Age: ${snapshot.data['age']}"),
              ],
            );
          },
        ),
      ),

      //Text(getData()),
    );
  }
}
