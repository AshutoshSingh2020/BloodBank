import 'package:flutter/material.dart';
import '../widgets/check.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({Key key}) : super(key: key);
  static const routeName = '/map-screen';
  @override
  Widget build(BuildContext context) {
    return Container(
      child: DonorList(),
    );
  }
}
