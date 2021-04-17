import 'package:flutter/material.dart';
import '../widgets/donor_detail.dart';

class DonorDetailScreen extends StatelessWidget {
  const DonorDetailScreen({Key key}) : super(key: key);
  static const routeName = '/donor-detail';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Donor Dtail'),
      ),
      body: Userdetail(),
    );
  }
}
