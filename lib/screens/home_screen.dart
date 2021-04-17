import '../widgets/main_drawer.dart';
import 'package:flutter/material.dart';
import '../widgets/home_item.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: <Widget>[
          DropdownButton(
            icon: Icon(
              Icons.more_vert,
              color: Theme.of(context).primaryIconTheme.color,
            ),
            items: [
              DropdownMenuItem(
                child: Container(
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.exit_to_app),
                      SizedBox(width: 8),
                      Text('Logout')
                    ],
                  ),
                ),
                value: 'logout',
              )
            ],
            onChanged: (itemIdentifier) {
              if (itemIdentifier == 'logout') {
                FirebaseAuth.instance.signOut();
              }
            },
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: HomeItem(),
            ),
            //MainDrawer(),
          ],
        ),
      ),
    );
// GridView(
//       padding: const EdgeInsets.all(25),
//       //  margin: const EdgeInsets.only(left: 10, top: 20),

//       // children: DUMMY_CATEGORIES
//       //     .map((catData) => CategoryItem(
//       //           catData.id,
//       //           catData.title,
//       //           catData.color,
//       //         ))
//       //     .toList(),
//       children: <Widget>[
//         Card(
//           child: Text('Login'),
//           color: Theme.of(context).accentColor,
//         ),
//         Card(
//           //  margin: const EdgeInsets.only(left: 10, top: 20),
//           child: Center(
//             child: Text(
//               'Registration',
//               style: TextStyle(
//                 color: Theme.of(context).primaryColor,
//                 fontFamily: 'Raleway',
//                 fontWeight:      FontWeight.bold,
//                 fontSize: 20,
//               ),
//             ),
//           ),
//           color: Theme.of(context).accentColor,
//         ),
//       ],
//       gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
//         maxCrossAxisExtent: 200,
//         childAspectRatio: 3 / 2,
//         crossAxisSpacing: 20,
//         mainAxisSpacing: 20,
//       ),
//     );
  }
}
