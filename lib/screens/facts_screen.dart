import 'package:flutter/material.dart';
import '../widgets/facts.dart';

class FactsScreen extends StatelessWidget {
  const FactsScreen({Key key}) : super(key: key);
  static const routeName = '/facts-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Facts'),
      ),
      body: Container(
        child: Facts(),
      ),
    );
  }
}
