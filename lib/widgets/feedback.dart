import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class StarFeedback extends StatefulWidget {
  static const routeName = '/feedbackform-screen';
  @override
  _StarFeedbackState createState() => _StarFeedbackState();
}

class _StarFeedbackState extends State<StarFeedback> {
  var rating = 0.0;
  var rate;
  final dbRef = FirebaseDatabase.instance.reference().child("feedback");
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Give FeedBack'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            color: Color(0xffE5E5E5),
            child: Column(
              children: <Widget>[
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                        child: Text(
                      "Please give the rating",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
                SizedBox(height: 30.0),
                Container(
                  child: Align(
                    child: Material(
                        color: Colors.white,
                        elevation: 14.0,
                        borderRadius: BorderRadius.circular(24.0),
                        shadowColor: Color(0x802196F3),
                        child: Container(
                          width: 300.0,
                          height: 150.0,
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Container(
                                  child: SmoothStarRating(
                                    rating: rating,
                                    isReadOnly: false,
                                    size: 40,
                                    filledIconData: Icons.star,
                                    halfFilledIconData: Icons.star_half,
                                    defaultIconData: Icons.star_border,
                                    starCount: 5,
                                    allowHalfRating: true,
                                    spacing: 2.0,
                                    onRated: (value) {
                                      // print("rating value -> $value");
                                      rate = value;
                                      // print("rating value dd -> ${value.truncate()}");
                                    },
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                    child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: RaisedButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            new BorderRadius.circular(30.0)),
                                    color: Color(0xffed1e79),
                                    child: Text(
                                      'Submit',
                                      style:
                                          TextStyle(color: Color(0xffffffff)),
                                    ),
                                    onPressed: () {
                                      var email;
                                      if (_auth.currentUser != null) {
                                        print(_auth.currentUser.uid);
                                        print(_auth.currentUser.email);
                                        email = _auth.currentUser.email;
                                      }
                                      dbRef.push().set({
                                        "rate": rate,
                                        "email": email,
                                      }).then((_) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                content: Text(
                                                    'Successfully Added')));
                                      });
                                      Navigator.of(context).pop();

                                      //print(rate);
                                    },
                                  ),
                                )),
                              ),
                            ],
                          ),
                        )),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
