//import '../screens/filters_screen.dart';
import '../screens/about_us_screen.dart';
import 'package:flutter/material.dart';
import '../screens/bloodbank_list.dart';
import '../screens/donor_list_screen.dart';
import '../screens/facts_screen.dart';
import '../screens/login_screen.dart';
import '../screens/map_screen.dart';
import '../screens/registration_screen.dart';
import '../screens/feedback_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              'Online BloodBank',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 20,
                  color: Theme.of(context).primaryColor),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile('Login', Icons.login, () {
            //Navigator.of(context).pushReplacementNamed('/');
            Navigator.of(context).pushNamed(LoginScreen.routeName);
          }),
          buildListTile('Registration', Icons.app_registration, () {
            Navigator.of(context).pushNamed(RegistrationScreen.routeName);
          }),
          buildListTile('Donor_List', Icons.list, () {
            Navigator.of(context).pushNamed(DonorListScreen.routeName);
          }),
          buildListTile('Blood_Bank', Icons.list_rounded, () {
            Navigator.of(context).pushNamed(BloodBankListScreen.routeName);
          }),
          buildListTile('Facts', Icons.fact_check, () {
            Navigator.of(context).pushNamed(FactsScreen.routeName);
          }),
          buildListTile('Map', Icons.map, () {
            Navigator.of(context).pushNamed(MapScreen.routeName);
          }),
          buildListTile('About_Us', Icons.face, () {
            Navigator.of(context).pushNamed(AboutUsScreen.routeName);
          }),
          buildListTile('FeedBack', Icons.feedback, () {
            Navigator.of(context).pushNamed(FeedBackScreen.routeName);
          }),
        ],
      ),
    );
  }
}
