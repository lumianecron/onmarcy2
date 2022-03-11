import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:onmarcy/model/category.dart';
import 'package:onmarcy/page/Home.dart';
import 'package:onmarcy/page/Register.dart';
import 'package:onmarcy/util/theme.dart';

import '../model/api.dart';
import '../model/users.dart';
import '../util/global.dart';
// import 'package:sweetalert/sweetalert.dart';
// import 'package:sweet_alert_dialogs/sweet_alert_dialogs.dart';

// #################################################
// UNTUK MENGGUNAKAN GOOGLE SIGN IN DAN FIREBASE  ##
// #################################################
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';

//PAGE LOGIN
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController etUsername = TextEditingController();
  final TextEditingController etPassword = TextEditingController();
  FocusNode pwdFocusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();
    etUsername.dispose();
    etPassword.dispose();
    pwdFocusNode.dispose();
  }

  @override
  void initState() {
    super.initState();
    // PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
    //   version = packageInfo.version;
    //   setState(() {});
    // });
    // Future.delayed(const Duration(seconds: 1), () {
    //   if (Global.getShared(key: Prefs.PREFS_USER_ID, defaults: "") != "") {
    //     Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
    //       return ContentHome();
    //     }));
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor6,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: defaultMargin,
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    header(),
                    usernameInput(),
                    passwordInput(),
                    signInButton(),
                    or(),
                    signInWithGoogleButton(),
                    //  Spacer(),
                    footer(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget header() {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Image.asset(
              'assets/logo.png',
              width: 200,
            ),
          ),
          // Text(
          //   'Login',
          //   style: primaryTextStyle.copyWith(
          //     fontSize: 24,
          //     fontWeight: semiBold,
          //   ),
          // ),
          // SizedBox(
          //   height: 2,
          // ),
          // Text(
          //   'Sign in To continue',
          //   style: subtitleTextStyle,
          // ),
        ],
      ),
    );
  }

  Widget passwordInput() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Password',
            style: primaryTextStyle.copyWith(
                fontSize: 16, fontWeight: medium, color: onmarcyPrimaryColor),
          ),
          const SizedBox(
            height: 12,
          ),
          Container(
            height: 50,
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: onmarcyPrimaryColor),
            ),
            child: Center(
              child: Row(
                children: [
                  // Image.asset(
                  //   'assets/ic_password.png',
                  //   width: 17,
                  // ),
                  const Icon(
                    Icons.password,
                    size: 17,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: TextFormField(
                        style: primaryTextStyle,
                        obscureText: true,
                        controller: etPassword,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                        )),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget footer() {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Don\'t have an account? ',
            style: subtitleTextStyle.copyWith(
              fontSize: 12,
            ),
          ),
          GestureDetector(
            onTap: () {
              Global.materialNavigateReplace(context, const Register())
                  .then((value) => setState(() {}));
              // Navigator.pushNamed(context, '/sign-up');
            },
            child: Text(
              'Register now',
              style: purpleTextStyle.copyWith(
                fontSize: 12,
                fontWeight: medium,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget usernameInput() {
    return Container(
      margin: const EdgeInsets.only(top: 70),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Username',
            style: primaryTextStyle.copyWith(
                fontSize: 16, fontWeight: medium, color: onmarcyPrimaryColor),
          ),
          const SizedBox(
            height: 12,
          ),
          Container(
            height: 50,
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            decoration: BoxDecoration(
              border: Border.all(color: onmarcyPrimaryColor),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Row(
                children: [
                  // Image.asset(
                  //   'assets/image/ic_email.png',
                  //   width: 17,
                  // ),
                  const Icon(
                    Icons.person,
                    size: 17,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: TextFormField(
                        style: primaryTextStyle,
                        controller: etUsername,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                        )),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget signInButton() {
    return Container(
      height: 50,
      width: double.infinity,
      margin: const EdgeInsets.only(top: 30),
      child: TextButton(
        onPressed: () {
          submitLogin();
        },
        style: TextButton.styleFrom(
          backgroundColor: onmarcyPrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
        child: Text(
          'Login',
          style: primaryTextStyle.copyWith(
              fontSize: 16, fontWeight: medium, color: whiteColor),
        ),
      ),
    );
  }

  Widget signInWithGoogleButton() {
    return Container(
      height: 50,
      width: double.infinity,
      margin: const EdgeInsets.only(top: 10),
      child: TextButton(
        onPressed: () {
          submitLogin();
        },
        style: TextButton.styleFrom(
          backgroundColor: grayColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
              side: BorderSide(color: blackColor)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Image.asset(
                'assets/google.png',
                width: 17,
              ),
              Expanded(
                child: Text(
                  'Login With Google',
                  textAlign: TextAlign.center,
                  style: primaryTextStyle.copyWith(
                      fontSize: 16, fontWeight: medium, color: blackColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget or() {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 1,
              child: Container(color: blackColor),
            ),
          ),
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: const Text("OR")),
          Expanded(
            child: SizedBox(
              height: 1,
              child: Container(color: blackColor),
            ),
          )
        ],
      ),
    );
  }

  // Submit Login
  void submitLogin() async {
    if (_formKey.currentState!.validate()) {
      if (etUsername.text == "admin" && etPassword.text == "admin") {
        print("login admin success");
        // SweetAlert.show(context,
        //               title: "Just show a message",
        //               subtitle: "Sweet alert is pretty",
        //               style: SweetAlertStyle.success);
        // showSuccessAlertDialog();
      } else {
        final response = API.fromJson(await Users.login(context: context, username: etUsername.text, password: etPassword.text, showLoading: false));
        if (response.success) {
          Global.setShared(key: Prefs.PREFS_USER, value: jsonEncode(response.data));
          
          Users user = Users.fromJson(jsonDecode(Global.getShared(key: Prefs.PREFS_USER)));
          print(user.name);
          log(user.name);

          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(user.name),
          ));

          Global.materialNavigate(context, Home()).then((value) => setState(() {}));
          Global.materialNavigateReplace(context, Home()).then((value) => setState(() {}));
        }

        Users user = Users.fromJson(jsonDecode(Global.getShared(key: Prefs.PREFS_USER)));
        print(user.name);
        log(user.name);

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(user.name),
        ));
      }

      // final response = API.fromJson(await Auth.login(context: context, email: etEmail.text, password: etPassword.text));

      // if (response.success) {
      //   Auth auth = Auth.fromJson(response.data);
      //   Global.setShared(key: Prefs.PREFS_USER_ID, value: auth.id);
      //   Global.setShared(key: Prefs.PREFS_USER_TYPE, value: auth.type);
      //   Global.setShared(key: Prefs.PREFS_USER_STORE, value: auth.storeId);
      //   // Global.cupertinoNavigate(context, ContentHome());
      //   Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
      //     return ContentHome();
      //   }));
      // } else
      //   Dialogs.showSimpleText(context: context, text: response.message);
    }
  }

  void showSuccessAlertDialog() {
    // showDialog(
    //   context: context,
    //   builder: (BuildContext context) {
    //     return RichAlertDialog(
    //         alertTitle: richTitle("Success"),
    //         alertSubtitle: richSubtitle("This is a Sucess alert"),
    //         alertType: RichAlertType.SUCCESS,
    //         actions: <Widget>[
    //           ElevatedButton(
    //             child: Text("OK"),
    //             onPressed: (){Navigator.pop(context);},
    //           ),
    //           ElevatedButton(
    //             child: Text("Cancel"),
    //             onPressed: (){Navigator.pop(context);},
    //           ),
    //         ],
    //     );
    //   }
    // );
  }
}
