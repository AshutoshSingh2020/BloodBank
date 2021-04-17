import 'dart:convert';
import 'package:flutter/material.dart';
//import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
//import '../screens/donor_detail.dart';

class DonorList extends StatefulWidget {
  // Home({Key key, this.title}) : super(key: key);
  //final String title;

  @override
  _DonorListState createState() => _DonorListState();
}

class _DonorListState extends State<DonorList> {
  final String url =
      'https://bbank-44a46-default-rtdb.firebaseio.com/donors.json';
  //List data;

  @override
  void initState() {
    super.initState();
    this.getJsonData();
  }

  Future<dynamic> getJsonData() async {
    final res =
        await http.get(Uri.parse(url), headers: {"Accept": "application/json"});

    if (res.statusCode == 200) {
      //print("@Helloooo");
      var data = json.decode(res.body);
      //print((data));
      return (data);
    }
  }

//    setState(() {
//

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      fit: StackFit.expand,
      children: <Widget>[
        FutureBuilder(
          builder: (context, valueofdata) {
            var allKeyValue;
            if (valueofdata.hasData) {
              allKeyValue = new List(valueofdata.data.length);
            }
            //print(valueofdata);
            //print(valueofdata.data['-MSU5vySdozgkAqrFx5U']['name']);
            var icount = 0;
            if (valueofdata.hasData) {
              valueofdata.data.forEach((key, value) {
                if (key != null) {
                  allKeyValue[icount] = key;
                  icount++;
                }
              });
              //print(allKeyValue);
              return Container(
                child: ListView.builder(
                  itemCount: valueofdata.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    if (!valueofdata.hasData) {
                      return Container(
                        child: CircularProgressIndicator(),
                      );
                    }
                    //print(valueofdata.data[allKeyValue[index]]['name']);
                    //print(valueofdata.data[allKeyValue[index]]['name']);
                    return Stack(children: [
                      Container(
                        child: InkWell(
                          onTap: () => {
                            //go to detail pages with id
                            //print(allKeyValue[index])
                            Navigator.pushNamed(
                              context,
                              '/donor-detail',
                              arguments: {
                                'userid': allKeyValue[index],
                              },
                            )
                          },
                          child: Column(
                            children: <Widget>[
                              Text(
                                  "Name: ${valueofdata.data[allKeyValue[index]]['name']}"),
                              Text(
                                  "BloodGroop: ${valueofdata.data[allKeyValue[index]]['bloodtype']}"),
                              Text(
                                  "Age: ${valueofdata.data[allKeyValue[index]]['age']}"),
                            ],
                          ),
                          // Text(valueofdata[index]["name"]),
                        ),
                      )
                    ]);
                  },
                ),
              );
            } else {
              return (Center(
                child: CircularProgressIndicator(),
              ));
            }
          },
          future: getJsonData(),
        )
      ],
    ));
  }
}
