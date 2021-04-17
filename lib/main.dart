import 'package:_bbank/screens/donor_detail.dart';
import './screens/about_us_screen.dart';
import 'package:flutter/material.dart';
import './screens/bloodbank_list.dart';
import './screens/donor_list_screen.dart';
import './screens/facts_screen.dart';
import './screens/map_screen.dart';
import './screens/registration_screen.dart';
import './screens/home_screen.dart';
import './screens/login_screen.dart';
import './screens/auth_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './screens/feedback_screen.dart';
import './widgets/feedback.dart';
import './screens/donor_detail.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BloodBank',

      theme: ThemeData(
        primarySwatch: Colors.red,
        accentColor: Colors.white70,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyText1: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            bodyText2: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            headline6: TextStyle(
              fontSize: 20,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold,
            )),
      ),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (ctx, userSnapShot) {
          if (userSnapShot.hasData) {
            return HomeScreen();
          }
          return AuthScreen();
        },
      ),

      initialRoute: '/', // default is '/'
      routes: {
        LoginScreen.routeName: (ctx) => LoginScreen(),
        RegistrationScreen.routeName: (ctx) => RegistrationScreen(),
        BloodBankListScreen.routeName: (ctx) => BloodBankListScreen(),
        DonorListScreen.routeName: (ctx) => DonorListScreen(),
        MapScreen.routeName: (ctx) => MapScreen(),
        FactsScreen.routeName: (ctx) => FactsScreen(),
        FeedBackScreen.routeName: (ctx) => FeedBackScreen(),
        StarFeedback.routeName: (ctx) => StarFeedback(),
        AboutUsScreen.routeName: (ctx) => AboutUsScreen(),
        DonorDetailScreen.routeName: (ctx) => DonorDetailScreen(),
      },
      // onGenerateRoute: (
      //   //settings
      //   ) {
      //   // print(settings.arguments);
      //   // // if (settings.name == '/meal-detail') {
      //   // //   return ...;
      //   // // } else if (settings.name == '/something-else') {
      //   // //   return ...;
      //   // // }
      //   // return MaterialPageRoute(
      //   //   builder: (ctx) => CategoriesScreen(),
      //   // );
      // },
      // onUnknownRoute: (settings) {
      //   return MaterialPageRoute(
      //     builder: (ctx) => CategoriesScreen(),
      //   );
      // },
    );
  }
}
