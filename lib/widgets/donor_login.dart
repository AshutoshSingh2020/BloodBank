import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthForm extends StatefulWidget {
  AuthForm(
    this.submitFn,
    this.isLoading,
  );

  final bool isLoading;
  final void Function(
    String email,
    String password,
    String userName,
    bool isLogin,
    BuildContext ctx,
  ) submitFn;

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  var _isLogin = true;
  var _userEmail = '';
  var _userName = '';
  var _userPassword = '';
  String _dUsername;

  // final dbRef = FirebaseDatabase.instance.reference().child("donors");
  // List<Map<dynamic, dynamic>> lists = [];
  Future getData() async {
    var response = await http.get(Uri.parse(
        'https://bbank-44a46-default-rtdb.firebaseio.com/donors.json'));
    final data = jsonDecode(response.body);
    // print(data['age']);
    // age = data['age'];
    return data;
  }

  void _trySubmit() {
    final isValid = _formKey.currentState.validate();
    FocusScope.of(context).unfocus();
    print(_userPassword);
    print(_userName);

    if (isValid) {
      _formKey.currentState.save();
      widget.submitFn(_userEmail.trim(), _userPassword.trim(), _userName.trim(),
          _isLogin, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            child: FutureBuilder(
                future: getData(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    // lists.clear();
                    // Map<dynamic, dynamic> values = snapshot.data.value;
                    // values.forEach((key, values) {
                    //   lists.add(values);
                    // });
                    print(snapshot.data['-MSU5vySdozgkAqrFx5U']['age']);
                  }

                  return Card(
                    margin: EdgeInsets.all(20),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              // DonorUsername.username,
                              // TextFormField(
                              //   key: ValueKey('email'),
                              //   validator: (value) {
                              //     if (value.isEmpty || !value.contains('@')) {
                              //       return 'Please enter a valid email address.';
                              //     }
                              //     return null;
                              //   },
                              //   keyboardType: TextInputType.emailAddress,
                              //   decoration: InputDecoration(
                              //     labelText: 'User Name',
                              //   ),
                              //   onSaved: (value) {
                              //     _userEmail = value;
                              //   },
                              // ),
                              if (_isLogin)
                                TextFormField(
                                  key: ValueKey('username'),
                                  validator: (value) {
                                    if (value.isEmpty || value.length < 4) {
                                      return 'Please enter at least 4 characters';
                                    }
                                    return null;
                                  },
                                  decoration:
                                      InputDecoration(labelText: 'Username'),
                                  onSaved: (value) {
                                    _userName = value;
                                  },
                                ),
                              TextFormField(
                                key: ValueKey('password'),
                                validator: (value) {
                                  if (value.isEmpty || value.length < 7) {
                                    return 'Password must be at least 7 characters long.';
                                  }
                                  return null;
                                },
                                decoration:
                                    InputDecoration(labelText: 'Password'),
                                obscureText: true,
                                onSaved: (value) {
                                  _userPassword = value;
                                  // print(_userPassword);
                                  // print(_userName);
                                },
                              ),
                              SizedBox(height: 12),
                              if (widget.isLoading) CircularProgressIndicator(),
                              if (!widget.isLoading)
                                ElevatedButton(
                                  child: Text(_isLogin ? 'Login' : 'Signup'),
                                  onPressed: _trySubmit,
                                ),
                              // if (!widget.isLoading)
                              //   TextButton(
                              //     // : Theme.of(context).primaryColor,
                              //     child: Text(_isLogin
                              //         ? ' Create new account'
                              //         : 'I already have an account'),
                              //     onPressed: () {
                              //       setState(() {
                              //         _isLogin = !_isLogin;
                              //       });
                              //     },
                              //   )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }

                //Card(
                //   color: Theme.of(context).accentColor,
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: <Widget>[
                //       Text("Name: " + lists[index]["name"]),
                //       Text("Age: " + lists[index]["age"]),
                //       Text("Type: " + lists[index]["bloodtype"]),
                //       Text("uid: " + lists[index]["userName"]),

                //       //lists[index]["userName"]  =>  _dUsername ,

                //       // _dUsername = lists[index]["userName"],

                //       //Text(lists[index]),
                //     ],
                //   ),
                // );
                )));
  }
}
