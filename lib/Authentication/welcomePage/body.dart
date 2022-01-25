import 'package:appnewui/Authentication/adminlogin/adminlogin.dart';
import 'package:appnewui/Authentication/welcomePage/Controller.dart';
import 'package:appnewui/Authentication/welcomePage/background.dart';
import 'package:appnewui/Authentication/widget/button.dart';
import 'package:appnewui/constrants.dart';
import 'package:flutter/material.dart';
import 'package:appnewui/Authentication/Auth/firebase.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:lottie/lottie.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  // bool _isLoading = false;
  // @override
  // void initState(){
  //   setState(() {
  //     _isLoading = false;
  //   });
  // }
  void click() async {
    // setState(() {
    //   _isLoading = true;
    // });
    print("Signing with google clicked------>");

    final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
    provider.signInWithGoogle();
    Navigator.push(context,MaterialPageRoute(builder: (context)=>Controller()));
    // Navigator.of(context).pushAndRemoveUntil(
    //     MaterialPageRoute(builder: (context) => Controller()),
    //         (Route<dynamic> route) => false);

    // setState(() {
    //   _isLoading = false;
    // });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // _isLoading ? Center(child:CircularProgressIndicator()):
    return WelcomeBackground(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: size.height * .05,
              ),
              Text(
                "WELCOME TO GLBITM",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27),
              ),
              Text(
                "FIND YOUR SPARK",
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
              ),
              SizedBox(height: size.height * 0.05),
              Lottie.asset("assets/images/welcome.json", height: 250),
              SizedBox(height: size.height * 0.05),
              CircularButton(
                text: "LOGIN",
                color: primaryColor,
                textColor: Colors.white,
                press: () => this.click(),
              ),
              SizedBox(height: size.height * 0.05),
            ],
          ),
        ),
      ),
    );
  }
}
