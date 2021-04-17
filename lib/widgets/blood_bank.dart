import 'package:geocoder/geocoder.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:firebase_database/firebase_database.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Position _currentPosition;
  final bankController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final dbRef = FirebaseDatabase.instance.reference().child("bloodbanks");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: TextFormField(
                        controller: bankController,
                        decoration: InputDecoration(
                          labelText: "Enter Blood Bank Name",
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        // The validator receives the text that the user has entered.
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'blood Bank Name';
                          }
                          return null;
                        },
                      ),
                    ),
                    if (_currentPosition != null)
                      Text(
                          "LAT: ${_currentPosition.latitude}, LNG: ${_currentPosition.longitude}"),
                    ElevatedButton(
                      style: ButtonStyle(),
                      child: Text("Get location"),
                      onPressed: () {
                        _getCurrentLocation();
                      },
                    ),
                    TextButton(
                      //  style: ButtonStyle( backgroundColor: Colors.accents,),
                      style: TextButton.styleFrom(
                        primary: Colors.green,
                        backgroundColor: Colors.amber,
                        textStyle: TextStyle(
                            fontSize: 20,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold),
                      ),

                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          dbRef.push().set({
                            "name": bankController.text,
                            "lat": _currentPosition.latitude,
                            "long": _currentPosition.longitude,

                            // "repassword": repasswordController.text
                          }).then((_) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Successfully Added')));

                            bankController.clear();
                          }).catchError((onError) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(SnackBar(content: Text(onError)));
                          });
                        }
                      },
                      child: Text('Submit'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _getCurrentLocation() {
    Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });

      _getAddressFromLatLng();
    }).catchError((e) {
      print(e);
    });
  }

  _getAddressFromLatLng() async {
    try {
      final coordinates = new Coordinates(
          _currentPosition.latitude, _currentPosition.longitude);
      var addresses =
          await Geocoder.local.findAddressesFromCoordinates(coordinates);
      var first = addresses.first;
      print(
          ' ${first.locality}, ${first.adminArea},${first.subLocality}, ${first.subAdminArea},${first.addressLine}, ${first.featureName},${first.thoroughfare}, ${first.subThoroughfare}');
      return first;
      // List<Placemark> p = await geolocator.placemarkFromCoordinates(
      //     _currentPosition.latitude, _currentPosition.longitude);
      //      var addresses = await Ge.local.findAddressesFromCoordinates(
      //     coordinates);

      // Placemark place = p[0];

      // setState(() {
      //   _currentAddress =
      //       "${place.locality}, ${place.postalCode}, ${place.country}";
      // });
    } catch (e) {
      print(e);
    }
  }
}
