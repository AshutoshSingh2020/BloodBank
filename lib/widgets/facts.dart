import 'dart:ui';

import 'package:flutter/material.dart';

class Facts extends StatelessWidget {
  const Facts({Key key}) : super(key: key);

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
          child: gridTile(
            Icons.hail,
            'Every year our nation requires about 5 Crore units of blood, out of which only a meager 2.5 Crore units of blood are available.',
            //Navigator.of(context).pushReplacementNamed('/');
            // Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
          ),
        ),
        Card(
          color: Theme.of(context).accentColor,
          child: gridTile(
            Icons.hail,
            'The gift of blood is the gift of life. There is no substitute for human blood',
            //Navigator.of(context).pushReplacementNamed('/');
            // Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
          ),
        ),
        Card(
          color: Theme.of(context).accentColor,
          child: gridTile(
            Icons.hail,
            'Every two seconds someone needs blood.',
            //Navigator.of(context).pushReplacementNamed('/');
            // Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
          ),
        ),
        Card(
          color: Theme.of(context).accentColor,
          child: gridTile(
            Icons.hail,
            'Every year our nation requires about 5 Crore units of blood, out of which only a meager 2.5 Crore units of blood are available.',
            //Navigator.of(context).pushReplacementNamed('/');
            // Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
          ),
        ),
        Card(
          color: Theme.of(context).accentColor,
          child: gridTile(
            Icons.hail,
            'More than 38,000 blood donations are needed every day.',
            //Navigator.of(context).pushReplacementNamed('/');
            // Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
          ),
        ),
        Card(
          color: Theme.of(context).accentColor,
          child: gridTile(
            Icons.hail,
            'A total of 30 million blood components are transfused each year.',
            //Navigator.of(context).pushReplacementNamed('/');
            // Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
          ),
        ),
        Card(
          color: Theme.of(context).accentColor,
          child: gridTile(
            Icons.hail,
            'The average red blood cell transfusion is approximately 3 pints.',
            //Navigator.of(context).pushReplacementNamed('/');
            // Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
          ),
        ),
        Card(
          color: Theme.of(context).accentColor,
          child: gridTile(
            Icons.hail,
            'The blood type most often requested by hospitals is Type O.',
            //Navigator.of(context).pushReplacementNamed('/');
            // Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
          ),
        ),
        Card(
          color: Theme.of(context).accentColor,
          child: gridTile(
            Icons.hail,
            'Sickle cell patients can require frequent blood transfusions throughout their lives.',
            //Navigator.of(context).pushReplacementNamed('/');
            // Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
          ),
        ),
        Card(
          color: Theme.of(context).accentColor,
          child: gridTile(
            Icons.hail,
            'More than 1 million new people are diagnosed with cancer each year. Many of them will need blood, sometimes daily, during their chemotherapy treatment.',
            //Navigator.of(context).pushReplacementNamed('/');
            // Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
          ),
        ),
        Card(
          color: Theme.of(context).accentColor,
          child: gridTile(
            Icons.hail,
            'A single car accident victim can require as many as 100 units of blood',
            //Navigator.of(context).pushReplacementNamed('/');
            // Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
          ),
        ),
        // Card(
        //   color: Theme.of(context).accentColor,
        //   child: gridTile(
        //     Icons.home,
        //     'The average red blood cell transfusion is approximately 3 pints.',
        //     //Navigator.of(context).pushReplacementNamed('/');
        //     // Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
        //   ),
        // ),
        // Card(
        //   color: Theme.of(context).accentColor,
        //   child: gridTile(
        //     Icons.home,
        //     'The average red blood cell transfusion is approximately 3 pints.',
        //     //Navigator.of(context).pushReplacementNamed('/');
        //     // Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
        //   ),
        // ),
        // Card(
        //   color: Theme.of(context).accentColor,
        //   child: gridTile(
        //     Icons.home,
        //     'The average red blood cell transfusion is approximately 3 pints.',
        //     //Navigator.of(context).pushReplacementNamed('/');
        //     // Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
        //   ),
        // ),
        // Card(
        //   color: Theme.of(context).accentColor,
        //   child: gridTile(
        //     Icons.home,
        //     'The average red blood cell transfusion is approximately 3 pints.',
        //     //Navigator.of(context).pushReplacementNamed('/');
        //     // Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
        //   ),
        // ),
      ],
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 300,
        childAspectRatio: 8 / 2,
        crossAxisSpacing: 25,
        mainAxisSpacing: 25,
      ),
    );
  }
}
