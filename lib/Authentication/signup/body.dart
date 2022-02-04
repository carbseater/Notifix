import 'package:cloud_functions/cloud_functions.dart';
import 'package:appnewui/Authentication/Auth/firebase.dart';
import 'package:appnewui/Authentication/signup/background.dart';
import 'package:appnewui/Authentication/welcomePage/controller.dart';
import 'package:appnewui/Authentication/widget/button.dart';
import 'package:appnewui/Authentication/widget/circular_text_field.dart';
import 'package:appnewui/constrants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../indexPage.dart';

//import 'package:flutter_svg/svg.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool _isLoading = false;
  bool _isRegistering = false;
  String DropDownBranchValue = "CSE";
  String DropDownYearValue = "2018-22";
  String DropDownCollegeValue =
      "192 GL BAJAJ INSTITUTE OF TECHNOLOGY MANAGEMENT GAUTAM BUDDH NAGAR";
  String name = "";
  String UniRoll = "";
  String year = "";
  String phoneNo = "";
  String CollegeName = "";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return _isLoading
        ? Center(child: CircularProgressIndicator())
        : Background(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Here's your first step with us!",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 21,
                            color: Colors.black),
                      ),
                      SizedBox(height: size.height * .02),

                      // SvgPicture.asset(
                      //   "assets/images/signpage.svg",
                      //   //fit: BoxFit.cover,
                      //   height: size.height * .30,
                      // ),
                      SizedBox(height: size.height * 0.02),
                      RoundedTextField(
                        initial: name,
                        ontap: (value) {
                          name = value;
                        },
                        color: primaryColor,
                        icon: Icons.person,
                        keyType: TextInputType.name,
                        text: "Your Name",
                        privacy: false,
                        suffixicon: null,
                      ),
                      SizedBox(height: size.height * 0.02),

                      RoundedTextField(
                        initial: UniRoll,
                        ontap: (value) {
                          UniRoll = value;
                        },
                        color: primaryColor,
                        icon: Icons.list,
                        keyType: TextInputType.number,
                        text: "Unversity Roll Number",
                        privacy: false,
                        suffixicon: null,
                      ),
                      SizedBox(height: size.height * 0.02),

                      SizedBox(height: size.height * 0.02),
                      //<--------------------------Batch Selection Starts--------------------------->
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Color(0xffF1E6FF),
                        ),
                        height: 55,
                        width: size.width * .8,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(35, 0, 40, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                " Select Batch",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 17,
                                    fontWeight: FontWeight.normal),
                              ),
                              DropdownButton<String>(
                                value: DropDownYearValue,
                                icon: const Icon(Icons.arrow_downward),
                                elevation: 16,
                                style: const TextStyle(
                                  color: Color(0xff6F35A5),
                                ),
                                underline: Container(
                                  height: 2,
                                  color: Color(0xff6F35A5),
                                ),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    DropDownYearValue = newValue!;
                                    name = name;
                                    UniRoll = UniRoll;
                                    year = year;
                                    phoneNo = phoneNo;
                                  });
                                },
                                items: <String>[
                                  '2018-22',
                                  '2019-23',
                                  '2020-24',
                                  '2021-25',
                                  '2021-26'
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      value,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  );
                                }).toList(),
                              )
                            ],
                          ),
                        ),
                      ),
                      //<--------------------------Batch Selection ends--------------------------->
                      SizedBox(height: size.height * 0.02),
                      //<--------------------------Branch Selection STARTS-------------------------->
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Color(0xffF1E6FF),
                        ),
                        height: 55,
                        width: size.width * .8,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(35, 0, 40, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                " Select Branch",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 17,
                                    fontWeight: FontWeight.normal),
                              ),
                              DropdownButton<String>(
                                value: DropDownBranchValue,
                                icon: const Icon(Icons.arrow_downward),
                                elevation: 16,
                                style: const TextStyle(
                                  color: Color(0xff6F35A5),
                                ),
                                underline: Container(
                                  height: 2,
                                  color: Color(0xff6F35A5),
                                ),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    DropDownBranchValue = newValue!;
                                    name = name;
                                    UniRoll = UniRoll;
                                    year = year;
                                    phoneNo = phoneNo;
                                  });
                                },
                                items: <String>[
                                  'EE',
                                  'ECE',
                                  'CE',
                                  'CSE',
                                  'IT',
                                  'ME'
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      value,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  );
                                }).toList(),
                              )
                            ],
                          ),
                        ),
                      ),
                      //<-------------------------- Branch Selection ENDS-------------------------->

                      SizedBox(height: size.height * 0.02),

                      RoundedTextField(
                        initial: phoneNo,
                        ontap: (value) {
                          phoneNo = value;
                        },
                        color: primaryColor,
                        icon: Icons.phone,
                        keyType: TextInputType.phone,
                        text: "Phone no.",
                        privacy: false,
                        suffixicon: null,
                      ),
                      SizedBox(height: size.height * 0.02),
                      Text(
                        "Select Your College",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(height: size.height * 0.01),
                      //<--------------------------College Selection STARTS-------------------------->
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Color(0xffF1E6FF),
                        ),
                        height: 55,
                        width: size.width * .8,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(15, 16, 15, 15),
                          child: DropdownButton<String>(
                            //  menuMaxHeight: size.height,
                            isExpanded: true,
                            isDense: true,
                            value: DropDownCollegeValue,
                            // icon: const Icon(Icons.arrow_downward),
                            elevation: 16,
                            style: const TextStyle(
                              color: Color(0xff6F35A5),
                            ),
                            underline: Container(
                              height: 0,
                              width: size.width,
                              color: Color(0xff6F35A5),
                            ),
                            onChanged: (String? newValue) {
                              setState(() {
                                DropDownCollegeValue = newValue!;
                                name = name;
                                UniRoll = UniRoll;
                                year = year;
                                phoneNo = phoneNo;
                              });
                            },
                            items: <String>[
                              '192 GL BAJAJ INSTITUTE OF TECHNOLOGY MANAGEMENT GAUTAM BUDDH NAGAR',
                              '511 G L BAJAJ GROUP OF INSTITUTIONS MATHURA',
                              '222 ITS ENGG COLLEGE GAUTAM BUDDH NAGAR',
                              '492 KCC INSTITUTE OF TECHNOLOGY MANAGEMENT GAUTAM BUDDH NAGAR'
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      //<-------------------------- College Selection ENDS-------------------------->

                      SizedBox(height: size.height * 0.03),
                      CircularButton(
                        text: _isRegistering ? "Registering..." : "Register",
                        color: primaryColor,
                        textColor: Colors.white,
                        press: _isRegistering ? () {} : registerNewUser,
                      ),
                      SizedBox(height: size.height * 0.02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an Account ?",
                            style: TextStyle(color: Colors.black),
                          ),
                          TextButton(
                            onPressed: _isRegistering ? null : signInWithGoogle,
                            child: Text("Sign In",
                                style: TextStyle(
                                  color: primaryColor,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                        ],
                      ),

                      SizedBox(height: size.height * 0.02),
                    ]),
              ),
            ),
          );
  }

  void signInWithGoogle() async {
    setState(() {
      _isLoading = true;
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
    try {
      await provider.signInWithGoogle();
      final user = FirebaseAuth.instance.currentUser;
      final idTokenResult = await user!.getIdTokenResult(true);
      if (idTokenResult.claims!.containsKey("verified") == false ||
          idTokenResult.claims!["verified"] == false) {
        await provider.signOutGoogle();
        Fluttertoast.showToast(msg: "Need to register first");
      } else {
        String uid = user.uid;
        final db = FirebaseDatabase.instance.reference().child('allusers/$uid');
        await db.once().then((DataSnapshot snapshot) {
          Map<dynamic, dynamic> value = snapshot.value;
          prefs.setString('verified', 'true');
          prefs.setString('name', value['name']);
          prefs.setString('branch', value['branch']);
          prefs.setString('college', value['college']);
          prefs.setString('batch', value['batch']);
          prefs.setString('role', value['role']);
        });
        await FirebaseMessaging.instance.subscribeToTopic('new_user');
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => IndexPage()),
            (Route<dynamic> route) => false);
      }
    } catch (e) {
      if (FirebaseAuth.instance.currentUser != null) {
        await provider.signOutGoogle();
      }
      prefs.clear();
      Fluttertoast.showToast(msg: "$e");
    }
    setState(() {
      _isLoading = false;
    });
  }

  void registerNewUser() async {
    final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _isRegistering = true;
    });
    if (checkForm() == 1) {
      try {
        await provider.signInWithGoogle();
        final user = FirebaseAuth.instance.currentUser;
        final idTokenResult = await user!.getIdTokenResult(true);
        if (idTokenResult.claims!.containsKey("verified") == false ||
            idTokenResult.claims!["verified"] == false) {
          try {
            HttpsCallable callable =
                FirebaseFunctions.instance.httpsCallable('processSignUp');
            final result = await callable({
              'college': DropDownCollegeValue,
              'email': user.email,
              'roll': UniRoll,
              'branch': DropDownBranchValue,
              'name': name,
              'batch': DropDownYearValue,
              'verified': true,
              'phoneNo': phoneNo
            });

            if (result.data['msg'] == "You are registered now!") {
              FluttertoastErrors("You are registered, signing in...");
              // print("Subscribed");
              prefs.setString('verified', 'true');
              prefs.setString('name', name);
              prefs.setString('branch', DropDownBranchValue);
              prefs.setString('college', DropDownCollegeValue);
              prefs.setString('batch', DropDownYearValue);
              prefs.setString('role', '0');
              await FirebaseMessaging.instance.subscribeToTopic('new_user');
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => IndexPage()),
                  (Route<dynamic> route) => false);
            } else {
              if (FirebaseAuth.instance.currentUser != null) {
                await provider.signOutGoogle();
              }
              prefs.clear();
              FluttertoastErrors(result.data['msg']);
              setState(() {
                _isRegistering = false;
              });
            }
            // print(result.data);
          } catch (e) {
            prefs.clear();
            if (FirebaseAuth.instance.currentUser != null) {
              await provider.signOutGoogle();
            }

            setState(() {
              _isRegistering = false;
            });
            // print(e);
            FluttertoastErrors(e.toString());
          }
        } else {
          FluttertoastErrors("You are already registered");
        }
      } catch (e) {
        prefs.clear();
        FluttertoastErrors(e.toString());
        if (FirebaseAuth.instance.currentUser != null) {
          await provider.signOutGoogle();
        }

        setState(() {
          _isRegistering = false;
        });
      }
    } else {
      setState(() {
        _isRegistering = false;
      });
    }
  }

  int checkForm() {
    if (name.length < 3) {
      FluttertoastErrors("Enter correct name");
      return 0;
    } else if (UniRoll.length < 10) {
      FluttertoastErrors("Roll No should contains at least 10 digit");
      return 0;
    } else {
      if (phoneNo.length < 5) {
        FluttertoastErrors("Incorrect phone no");
        return 0;
      }
    }

    return 1;
  }

  void FluttertoastErrors(String msg) {
    Fluttertoast.showToast(msg: msg);
  }
}
