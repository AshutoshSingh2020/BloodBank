// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_database/firebase_database.dart';

// class FirebaseRealtimeDemoScreen extends StatelessWidget {
//   final databaseReference =
//       FirebaseDatabase.instance.reference().child('donors');

//   @override
//   Widget build(BuildContext context) {
//     readData();
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Flutter Realtime Database Demo'),
//       ),
//       body: Center(
//           child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: <Widget>[
//             RaisedButton(
//               child: Text('Create Data'),
//               color: Colors.redAccent,
//               onPressed: () {
//                 createData();
//               },
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(20))),
//             ),
//             SizedBox(
//               height: 8,
//             ),
//             RaisedButton(
//               child: Text('Read/View Data'),
//               color: Colors.redAccent,
//               onPressed: () {
//                 readData();
//               },
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(20))),
//             ),
//             SizedBox(
//               height: 8,
//             ),
//             RaisedButton(
//               child: Text('Update Data'),
//               color: Colors.redAccent,
//               onPressed: () {
//                 updateData();
//               },
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(20))),
//             ),
//             SizedBox(
//               height: 8,
//             ),
//             RaisedButton(
//               child: Text('Delete Data'),
//               color: Colors.redAccent,
//               onPressed: () {
//                 deleteData();
//               },
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(20))),
//             ),
//           ],
//         ),
//       )), //center
//     );
//   }

//   void createData() {
//     databaseReference
//         .child("flutterDevsTeam1")
//         .set({'name': 'Deepak Nishad', 'description': 'Team Lead'});
//     databaseReference.child("flutterDevsTeam2").set(
//         {'name': 'Yashwant Kumar', 'description': 'Senior Software Engineer'});
//     databaseReference
//         .child("flutterDevsTeam3")
//         .set({'name': 'Akshay', 'description': 'Software Engineer'});
//     databaseReference
//         .child("flutterDevsTeam4")
//         .set({'name': 'Aditya', 'description': 'Software Engineer'});
//     databaseReference
//         .child("flutterDevsTeam5")
//         .set({'name': 'Shaiq', 'description': 'Associate Software Engineer'});
//     databaseReference
//         .child("flutterDevsTeam6")
//         .set({'name': 'Mohit', 'description': 'Associate Software Engineer'});
//     databaseReference
//         .child("flutterDevsTeam7")
//         .set({'name': 'Naveen', 'description': 'Associate Software Engineer'});
//   }

//   void readData() {
//     databaseReference.once().then((DataSnapshot snapshot) {
//       Map<dynamic, dynamic> map = snapshot.value;
//       print(map.values.toList());
//       // map.values.toList().forEach((k, v) => print('${k}: ${v}'));

//       print('Data : ${snapshot.value['-MVC7TBwJLsRfnj-Y5jZ']['age']}');
//     });
//   }

//   void updateData() {
//     databaseReference.child('flutterDevsTeam1').update({'description': 'CEO'});
//     databaseReference
//         .child('flutterDevsTeam2')
//         .update({'description': 'Team Lead'});
//     databaseReference
//         .child('flutterDevsTeam3')
//         .update({'description': 'Senior Software Engineer'});
//   }

//   void deleteData() {
//     databaseReference.child('flutterDevsTeam1').remove();
//     databaseReference.child('flutterDevsTeam2').remove();
//     databaseReference.child('flutterDevsTeam3').remove();
//   }
// }

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
            //print(valueofdata);
            var allKeyValue = new List(valueofdata.data.length);
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
                child: Column(
                  children: <Widget>[
                    ListView.builder(
                      //itemCount: valueofdata.data.length,
                      itemBuilder: (BuildContext context, int index) {
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
                              child:
                                  // Text(valueofdata[index]["name"]),

                                  Text(valueofdata.data[allKeyValue[index]]
                                      ['name']),
                            ),
                          )
                        ]);
                      },
                    ),
                  ],
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
