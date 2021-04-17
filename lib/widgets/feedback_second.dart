import 'package:firebase_database/firebase_database.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class FeedBackList extends StatefulWidget {
  // Home({Key key, this.title}) : super(key: key);
  //final String title;

  @override
  _FeedBackListState createState() => _FeedBackListState();
}

class _FeedBackListState extends State<FeedBackList> {
  var rating;
  //String age;
  //String bloodtype;

  final dbRef = FirebaseDatabase.instance.reference().child("feedback");
  List<Map<dynamic, dynamic>> lists = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: dbRef.once(),
        builder: (context, AsyncSnapshot<DataSnapshot> snapshot) {
          if (snapshot.hasData) {
            lists.clear();
            Map<dynamic, dynamic> values = snapshot.data.value;
            values.forEach((key, values) {
              lists.add(values);
            });
            return new ListView.builder(
                shrinkWrap: true,
                itemCount: lists.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    color: Theme.of(context).accentColor,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("User: " + lists[index]["email"]),
                        Text("Rating: " + lists[index]["rate"].toString()),
                        //Text("Type: " + lists[index]["bloodtype"]),
                        //Text("uid: " + lists[index]["userName"]),
                        // String _dUserName = lists[index]["userName"];
                        // rating = lists[index]["rate"],
                        //Text(lists[index]),

                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            width: 200,
                            child: SmoothStarRating(
                              rating: lists[index]["rate"].toDouble(),
                              isReadOnly: true,
                              size: 30,
                              filledIconData: Icons.star,
                              halfFilledIconData: Icons.star_half,
                              defaultIconData: Icons.star_border,
                              starCount: 5,
                              allowHalfRating: true,
                              spacing: 2.0,
                              // onRated: (value) {
                              // print("rating value -> $value");
                              // rate = value;
                              // print("rating value dd -> ${value.truncate()}");
                              //},
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                });
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
