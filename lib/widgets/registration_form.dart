import 'package:firebase_database/firebase_database.dart';
import 'package:gender_selection/utils/gradients.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
//import './home.dart';
import 'package:flutter/material.dart';
import 'package:gender_selection/gender_selection.dart';
//import 'package:mailer/mailer.dart';
//import 'package:mailer/smtp_server.dart';
//import './mail.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Users',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(title: 'Register Donor'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);
//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//           child: SingleChildScrollView(
//         child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text("Please Register Donor ",
//                   style: TextStyle(
//                       fontWeight: FontWeight.w200,
//                       fontSize: 30,
//                       fontFamily: 'Roboto',
//                       fontStyle: FontStyle.italic)),
//               RegisterPet(),
//             ]),
//       )),
//     );
//   }
// }

class DonorRegister extends StatefulWidget {
  DonorRegister({Key key}) : super(key: key);

  @override
  _DonorRegisterState createState() => _DonorRegisterState();
}

class _DonorRegisterState extends State<DonorRegister> {
  final _formKey = GlobalKey<FormState>();
  final listOfPets = [
    "A",
    "A-",
    "B",
    "B-",
    "O",
    "O-",
    "AB",
    "AB-",
  ];
  String dropdownValue = 'A';
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final emailController = TextEditingController();
  final mobileController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final repasswordController = TextEditingController();
  var genderController;
  bool _checkboxFirstController;
  bool _checkboxSecondController;
  var _password;
  //var _rePassword;
  bool valuefirst = false;
  bool valuesecond = false;
  final dbRef = FirebaseDatabase.instance.reference().child("donors");

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: SingleChildScrollView(
            child: Column(children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20.0),
            child: TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: "Enter Donor Name",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value.isEmpty) {
                  return 'Enter Donor Name';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 30.0, right: 20, top: 0, bottom: 0),
            child: GenderSelection(
              maleText: "", //default Male
              femaleText: "", //default Female
              linearGradient: balbirGradient,
              selectedGenderIconBackgroundColor: Colors.indigo, // default red
              checkIconAlignment: Alignment.centerRight, // default bottomRight
              selectedGenderCheckIcon: null, // default Icons.check
              onChanged: (Gender gender) {
                print(gender);
                genderController = gender;
              },
              equallyAligned: true,
              animationDuration: Duration(milliseconds: 400),
              isCircular: true, // default : true,
              isSelectedGenderIconCircular: true,
              opacityOfGradient: 0.6,
              padding: const EdgeInsets.all(3),
              size: 60, //default : 120
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 0, left: 20.0, right: 20, bottom: 20),
            child: IntlPhoneField(
              controller: mobileController,
              decoration: InputDecoration(
                labelText: "Enter Mobile No.",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onChanged: (phone) {
                print(phone.completeNumber);
              },
              keyboardType: TextInputType.number,
              initialCountryCode: 'IN',
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value.isEmpty) {
                  return 'Enter Mobile No.';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: "Enter email",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              keyboardType: TextInputType.emailAddress,
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value.isEmpty || !value.contains('@')) {
                  return 'Enter a valid email address.';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: DropdownButtonFormField(
              value: dropdownValue,
              icon: Icon(Icons.arrow_downward),
              decoration: InputDecoration(
                labelText: "Select Blood Group Type",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              items: listOfPets.map((String value) {
                return new DropdownMenuItem<String>(
                  value: value,
                  child: new Text(value),
                );
              }).toList(),
              onChanged: (String newValue) {
                setState(() {
                  dropdownValue = newValue;
                });
              },
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please Select Bloodgroup';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: TextFormField(
              keyboardType: TextInputType.number,
              controller: ageController,
              decoration: InputDecoration(
                labelText: "Enter donor Age",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),

              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please donor Age';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: TextFormField(
              controller: usernameController,
              decoration: InputDecoration(
                labelText: "Enter UserName.",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value.isEmpty || value.length < 4) {
                  return 'Enter UserName at least 4 char';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: TextFormField(
              key: ValueKey('password'),
              controller: passwordController,
              decoration: InputDecoration(
                labelText: "Enter Password.",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              obscureText: true,
              onSaved: (value) {
                _password = value;
              },
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value.isEmpty || value.length < 7) {
                  return 'Password at least 7 char.';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 20.0,
              right: 70.0,
            ),
            child: Text(
              'Do you have medical certificate: ',
              style: TextStyle(fontSize: 17.0),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Row(
              children: <Widget>[
                Text('Yes'),
                Checkbox(
                  checkColor: Colors.greenAccent,
                  activeColor: Colors.red,
                  value: this.valuefirst,
                  onChanged: (bool value) {
                    if (valuesecond == false) {
                      setState(() {
                        this.valuefirst = value;
                      });
                      if (valuefirst == true) {
                        setState(
                          () {
                            _checkboxFirstController = true;
                            _checkboxSecondController = false;
                          },
                        );
                      }
                    }
                  },
                ),
                Text('No'),
                Checkbox(
                  value: this.valuesecond,
                  onChanged: (bool value) {
                    if (valuefirst == false) {
                      setState(
                        () {
                          this.valuesecond = value;
                        },
                      );

                      if (valuesecond == true) {
                        setState(
                          () {
                            //this.valuesecond = value;
                            _checkboxFirstController = false;
                            _checkboxSecondController = true;
                          },
                        );
                      }
                    }
                    // print(valuesecond);
                  },
                ),
              ],
            ),
            // TextFormField(
            //   controller: repasswordController,
            //   decoration: InputDecoration(
            //     labelText: "Renter password.",
            //     enabledBorder: OutlineInputBorder(
            //       borderRadius: BorderRadius.circular(10.0),
            //     ),
            //   ),
            //   obscureText: true,
            //   onSaved: (value) {
            //     _rePassword = value;
            //   },
            //   // The validator receives the text that the user has entered.
            //   validator: (value) {
            //     if (value.isEmpty || value.length < 7) {
            //       return 'Password at least 7 char.';
            //     }
            //     if (_password == _rePassword) {
            //       return null;
            //     }
            //     return 'password not matched';
            //   },
          ),
          Padding(
              padding: EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  TextButton(
                    //  style: ButtonStyle( backgroundColor: Colors.accents,),

                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        dbRef.push().set({
                          "name": nameController.text,
                          "gender": genderController.toString(),
                          "age": ageController.text,
                          "bloodtype": dropdownValue,
                          "email": emailController.text,
                          "mobile": mobileController.text,
                          "userName": usernameController.text,
                          "password": passwordController.text,
                          "checkboxFirst": _checkboxFirstController,
                          "checkboxSecond": _checkboxSecondController
                          // "repassword": repasswordController.text
                        }).then((_) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Successfully Added')));
                          ageController.clear();
                          nameController.clear();
                          emailController.clear();
                          passwordController.clear();
                          repasswordController.clear();
                          usernameController.clear();
                          mobileController.clear();
                          valuefirst = false;
                          valuesecond = false;
                          //valuefirst/.clear();
                        }).catchError((onError) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(content: Text(onError)));
                        });
                      }
                    },
                    child: Text('Submit'),
                  ),
                  // RaisedButton(
                  //   color: Colors.amber,
                  //   onPressed: () {
                  //     // Navigator.push(
                  //     //   context,
                  //     //   MaterialPageRoute(builder: (context) => Home()),
                  //     // );
                  //   },
                  //   child: Text('Navigate'),
                  // ),
                ],
              )),
        ])));
  }

  @override
  void dispose() {
    super.dispose();
    ageController.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    repasswordController.dispose();
    usernameController.dispose();
    mobileController.dispose();
    valuefirst = false;
    valuesecond = false;
  }
}
