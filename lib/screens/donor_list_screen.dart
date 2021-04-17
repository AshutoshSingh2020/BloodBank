import 'package:flutter/material.dart';
import '../widgets/donor_list.dart';

class DonorListScreen extends StatelessWidget {
  const DonorListScreen({Key key}) : super(key: key);
  static const routeName = '/donor-list';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Donor List'),
      ),
      body: DonorList(),
    );
  }
}
