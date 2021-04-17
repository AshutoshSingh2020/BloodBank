import 'package:flutter/material.dart';
import '../widgets/about_us.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({Key key}) : super(key: key);
  static const routeName = '/about-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AboutUs'),
      ),
      body: Container(
        child: AboutUs(),
      ),
    );
  }
}
