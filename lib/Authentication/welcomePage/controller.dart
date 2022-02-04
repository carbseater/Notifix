import 'package:appnewui/Authentication/signup/signup.dart';
import 'package:appnewui/indexPage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Controller extends StatefulWidget {
  const Controller({Key? key}) : super(key: key);

  @override
  _ControllerState createState() => _ControllerState();
}

class _ControllerState extends State<Controller> {
  bool user = false;
  @override
  Widget build(BuildContext context) {
    return user ? IndexPage():SignupPage();
  }

  @override
  void initState() {
    super.initState();
    check_if_already_login();
  }

  void check_if_already_login() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.containsKey('verified')){
      setState(() {
        user = true;
      });
    }
  }
  //helloi
}

