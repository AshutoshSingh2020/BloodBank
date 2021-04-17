import 'package:flutter/material.dart';

import '../widgets/donor_login.dart';
//import '../widgets/donor_list.dart';
import 'package:firebase_database/firebase_database.dart';

class LoginScreen extends StatelessWidget {
  //const LoginScreen({Key key}) : super(key: key);
  static const routeName = '/login-screen';
  final _isLoading = false;
  void _submitAuthForm(
    String email,
    String password,
    String username,
    bool isLogin,
    BuildContext ctx,
  ) async {
    //if( lists[index]["userName"] ==  username  )
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AuthForm(_submitAuthForm, _isLoading),
      // DonorList(),
    );
  }
}

// class AuthScreen extends StatefulWidget {
//   @override
//   _AuthScreenState createState() => _AuthScreenState();
// }

// class _AuthScreenState extends State<AuthScreen> {
//  // final _auth = FirebaseAuth.instance;
//   var _isLoading = false;

//   // void _submitAuthForm(
//   //   String email,
//   //   String password,
//   //   String username,
//   //   bool isLogin,
//   //   BuildContext ctx,
//   // ) async {
//   //   UserCredential authResult;

//   //   try {
//   //     setState(() {
//   //       _isLoading = true;
//   //     });
//   //     if (isLogin) {
//   //       authResult = await _auth.signInWithEmailAndPassword(
//   //         email: email,
//   //         password: password,
//   //       );
//   //     } else {
//   //       authResult = await _auth.createUserWithEmailAndPassword(
//   //         email: email,
//   //         password: password,
//   //       );
//   //       await FirebaseFirestore.instance
//   //           .collection('users')
//   //           .doc(authResult.user.uid)
//   //           .set({
//   //         'username': username,
//   //         'email': email,
//   //       });
//   //     }
//   //   } on PlatformException catch (err) {
//   //     var message = 'An error occurred, pelase check your credentials!';

//   //     if (err.message != null) {
//   //       message = err.message;
//   //     }

//   //     ScaffoldMessenger.of(ctx).showSnackBar(
//   //       SnackBar(
//   //         content: Text(message),
//   //         backgroundColor: Theme.of(ctx).errorColor,
//   //       ),
//   //     );
//   //     setState(() {
//   //       _isLoading = false;
//   //     });
//   //   } catch (err) {
//   //     print(err);
//   //     setState(() {
//   //       _isLoading = false;
//   //     });
//   //   }
//   // }
// //
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Theme.of(context).primaryColor,
//       body: AuthForm(
//         _submitAuthForm,
//         _isLoading,
//       ),
//     );
//   }
// }

//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:flutter/material.dart';

class DonorList extends StatefulWidget {
  // Home({Key key, this.title}) : super(key: key);
  //final String title;

  @override
  _DonorListState createState() => _DonorListState();
}

class _DonorListState extends State<DonorList> {
  String _dUsername;
  //String age;
  //String bloodtype;

  final dbRef = FirebaseDatabase.instance.reference().child("donors");
  List<Map<dynamic, dynamic>> lists = [];
  //print(dbRef);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: dbRef.once(),
        builder: (context, AsyncSnapshot<DataSnapshot> snapshot) {
          if (snapshot.hasData) {
            lists.clear();
            Map<dynamic, dynamic> values = snapshot.data.value;
            values.forEach((key, values) {
              lists.add(values);
            });
            //print(lists[gender]);
            return new ListView.builder(
                shrinkWrap: true,
                itemCount: lists.length,
                itemBuilder: (BuildContext context, int index) {
                  _dUsername = lists[index]['userName'];
                  // if(_userName == )
                  // print(_dUsername);
                  return Card(
                    color: Theme.of(context).accentColor,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Name: " + lists[index]["name"]),
                        Text("Age: " + lists[index]["age"]),
                        Text("Type: " + lists[index]["bloodtype"]),
                        Text("uid: " + lists[index]["userName"]),

                        //lists[index]["userName"]  =>  _dUsername ,

                        // _dUsername = lists[index]["userName"],

                        //Text(lists[index]),
                      ],
                    ),
                  );
                });
          }
          // print(_dUsername);
          return CircularProgressIndicator();
        },
      ),
    );
  }
}

// final FirebaseAuth auth = FirebaseAuth.instance;

// void inputData() {
//   final User user = auth.currentUser;
//   final uid = user.uid;
// here you write the codes to input the data into firestore
//}
