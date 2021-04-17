import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUs extends StatelessWidget {
  void customLaunch(command) async {
    if (await canLaunch(command)) {
      await launch(command);
    } else {
      print(' could not launch $command');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // Column(
        //   //mainAxisAlignment: MainAxisAlignment.center,
        //   children: <Widget>[
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(
                top: 15,
                left: 15,
                right: 15,
              ),
              width: 360,
              child: Image.asset('assets/images/grp.jpg'),
            ),

            Container(
              padding: EdgeInsets.only(
                top: 15,
                //bottom: 15,
              ),
              width: 300,
              //height: 40,
              child: TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.teal,
                  onSurface: Colors.grey,

                  //alignment: Alignment(1, 1),
                ),
                onPressed: () {
                  customLaunch(
                      'mailto:ashutoshk1112001@gmail.com?subject=test%20subject&body=test%20body');
                },
                child: Text('Email'),
              ),
            ),
            // Spacer(),
            Container(
              padding: EdgeInsets.only(
                top: 15,
                //bottom: 15,
              ),
              width: 300,
              //height: 40,
              child: TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.teal,
                  onSurface: Colors.grey,

                  //alignment: Alignment(1, 1),
                ),
                onPressed: () {
                  customLaunch('tel:+91 9955933761');
                },
                child: Text('Phone'),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 15),
              width: 300,
              // height: 40,
              child: TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.teal,
                  onSurface: Colors.grey,

                  //alignment: Alignment(1, 1),
                ),
                onPressed: () {
                  customLaunch('sms:9955933761');
                },
                child: Text('SMS'),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                top: 15,
                //bottom: 15,
              ),
              width: 300,
              //height: 40,
              child: TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.teal,
                  onSurface: Colors.grey,

                  //alignment: Alignment(1, 1),
                ),
                onPressed: () {
                  customLaunch('url:');
                },
                child: Text('Facebook'),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                top: 15,
                //bottom: 15,
              ),
              width: 300,
              //height: 40,
              child: TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.teal,
                  onSurface: Colors.grey,

                  //alignment: Alignment(1, 1),
                ),
                onPressed: () {
                  customLaunch('url:');
                },
                child: Text('Instagram'),
              ),
            ),
          ],
          // ),
          // ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
