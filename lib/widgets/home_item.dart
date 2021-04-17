import 'package:flutter/material.dart';
import '../screens/login_screen.dart';
import '../screens/bloodbank_list.dart';
import '../screens/donor_list_screen.dart';
import '../screens/facts_screen.dart';
import '../screens/map_screen.dart';
import '../screens/registration_screen.dart';

class HomeItem extends StatelessWidget {
  const HomeItem({Key key}) : super(key: key);

  Widget gridTile(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 20,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 20,
          color: Colors.red,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(19),
      //  margin: const EdgeInsets.only(left: 10, top: 20),

      // children: DUMMY_CATEGORIES
      //     .map((catData) => CategoryItem(
      //           catData.id,
      //           catData.title,
      //           catData.color,
      //         ))
      //     .toList(),
      children: <Widget>[
        Card(
          color: Theme.of(context).accentColor,
          child: Center(
            child: gridTile('Login', Icons.home, () {
              //Navigator.of(context).pushReplacementNamed('/');
              Navigator.of(context).pushNamed(LoginScreen.routeName);
            }),
          ),
        ),
        Card(
          color: Theme.of(context).accentColor,
          child: Center(
            child: gridTile('DonorList', Icons.list, () {
              //Navigator.of(context).pushReplacementNamed('/');
              Navigator.of(context).pushNamed(DonorListScreen.routeName);
            }),
          ),
        ),
        Card(
          color: Theme.of(context).accentColor,
          child: Center(
            child: gridTile('DonorRegister', Icons.home, () {
              //Navigator.of(context).pushReplacementNamed('/');
              Navigator.of(context).pushNamed(RegistrationScreen.routeName);
            }),
          ),
        ),
        Card(
          color: Theme.of(context).accentColor,
          child: Center(
            child: gridTile('BloodBank', Icons.home_filled, () {
              //Navigator.of(context).pushReplacementNamed('/');
              Navigator.of(context).pushNamed(BloodBankListScreen.routeName);
            }),
          ),
        ),
        Card(
          color: Theme.of(context).accentColor,
          child: Center(
            child: gridTile('Facts', Icons.hail, () {
              //Navigator.of(context).pushReplacementNamed('/');
              Navigator.of(context).pushNamed(FactsScreen.routeName);
            }),
          ),
        ),
        Card(
          color: Theme.of(context).accentColor,
          child: Center(
            child: gridTile('Map', Icons.map, () {
              //Navigator.of(context).pushReplacementNamed('/');
              Navigator.of(context).pushNamed(MapScreen.routeName);
            }),
          ),
        ),
      ],
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 300,
        childAspectRatio: 6 / 2,
        crossAxisSpacing: 25,
        mainAxisSpacing: 25,
      ),
    );
  }
}
