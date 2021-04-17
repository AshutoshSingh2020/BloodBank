import 'package:flutter/material.dart';
import '../widgets/feedback.dart';
import '../widgets/feedback_second.dart';

class FeedBackScreen extends StatelessWidget {
  const FeedBackScreen({Key key}) : super(key: key);
  static const routeName = '/feedback-screen';
  Widget gridTile(IconData icon, String text) {
    return ListTile(
      leading: Icon(
        icon,
        size: 20,
      ),
      title: Text(
        text,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 12,
          color: Colors.red,
          fontWeight: FontWeight.bold,
        ),
      ),
      // onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FeedBack'),
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Container(
                height: 500,
                child: GridView(
                  children: <Widget>[
                    GridTile(
                      child: FeedBackList(),
                    ),
                  ],
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 350,
                    childAspectRatio: 5 / 5,
                    crossAxisSpacing: 25,
                    mainAxisSpacing: 25,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 270.0, bottom: 20),
              child: Container(
                child: IconButton(
                  icon: Icon(Icons.star),
                  iconSize: 60,
                  onPressed: () {
                    Navigator.of(context).pushNamed(StarFeedback.routeName);
                    //
                    //  StarFeedback();
                  },
                ),
              ),
            ),
          ]),
    );
  }
}
