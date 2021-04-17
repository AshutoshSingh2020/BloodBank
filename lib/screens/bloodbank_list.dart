import 'package:flutter/material.dart';
import '../widgets/blood_bank.dart';

class BloodBankListScreen extends StatelessWidget {
  const BloodBankListScreen({Key key}) : super(key: key);
  static const routeName = '/bloodbank-list';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blood Banks'),
      ),
      body: HomePage(),
    );
  }
}
