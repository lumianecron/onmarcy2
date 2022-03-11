import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:onmarcy/main.dart';
import 'package:onmarcy/model/city.dart';
import 'package:onmarcy/page/Login.dart';
import 'package:onmarcy/util/theme.dart';

import '../util/global.dart';
// import 'package:sweetalert/sweetalert.dart';
// import 'package:sweet_alert_dialogs/sweet_alert_dialogs.dart';

// PAGE REGISTER
class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController etUsername = TextEditingController();
  final TextEditingController etEmail = TextEditingController();
  final TextEditingController etPassword = TextEditingController();
  final TextEditingController etConfirmPassword = TextEditingController();
  final TextEditingController etReferral = TextEditingController();
  FocusNode pwdFocusNode = FocusNode();

  List<String> listCity = ["Surabaya", "Malang", "Depansar", "Jakarta"];
  List<String> listCityName = [];
  String? selectedCityName = "Surabaya";
  
  List<String> listType = ["Brand", "Marketer"];
  String? selectedUserType = "Brand";

  @override
  void dispose() {
    super.dispose();
    etUsername.dispose();
    etEmail.dispose();
    etPassword.dispose();
    etConfirmPassword.dispose();
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
    // for (int i = 0; i < App.listCity.length; i++) {
    //   listCityName.add(App.listCity[i].name);
    // }
    // log("BUILD : " + listCityName.length.toString());
    // Fluttertoast.showToast(
    //     msg: "BUILD : " + listCityName.length.toString(),
    //     toastLength: Toast.LENGTH_SHORT,
    //     gravity: ToastGravity.CENTER,
    //     timeInSecForIosWeb: 1,
    //     backgroundColor: Colors.red,
    //     textColor: Colors.white,
    //     fontSize: 16.0
    // );
    init();
    
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
                    emailInput(),
                    passwordInput(),
                    confirmPasswordInput(),
                    cityInput(),
                    userTypeInput(),
                    referralCodeInput(),
                    signUpButton(),
                    //  Spacer(),
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
            child: Text(
              'Register',
              style: primaryTextStyle.copyWith(
                fontSize: 24,
                fontWeight: semiBold,
              ),
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

  Widget confirmPasswordInput() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Confirm Password',
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

  Widget referralCodeInput() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Referral Code (Optional)',
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
                    Icons.abc,
                    size: 17,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: TextFormField(
                        style: primaryTextStyle,
                        controller: etReferral,
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

  Widget cityInput() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'City',
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
            child: Row(
              children: [
                const Icon(
                  Icons.location_city,
                  size: 17,
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      hint: const Text("Select any City"),
                      isExpanded: true,
                      value: selectedCityName,
                      items: listCity
                        .map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(item)
                        )).toList(),
                      onChanged: (item) =>
                          setState(() => selectedCityName = item),
                    ),
                  )
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget userTypeInput() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Account Type',
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
            child: Row(
              children: [
              const Icon(
                  Icons.account_box,
                  size: 17,
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      isExpanded: true,
                      value: selectedUserType,
                      items: listType
                        .map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(item)
                        )).toList(),
                      onChanged: (item) =>
                          setState(() => selectedUserType = item),
                    ),
                  )
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget cityInput() {
  //   return Container(
  //     margin: const EdgeInsets.only(top: 20),
  //     child: Center(
  //       child: DropdownButton<String>(
  //         value: selectedCityName,
  //         items: listCity
  //           .map((item) => DropdownMenuItem<String>(
  //             value: item,
  //             child: Text(item, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20))
  //           )).toList(),
  //         onChanged: (item) =>
  //             setState(() => selectedCityName = item),
  //       )
  //     ),
  //   );
  // }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      );

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

  Widget emailInput() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Email Address',
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
                    Icons.mail,
                    size: 17,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: TextFormField(
                        style: primaryTextStyle,
                        controller: etEmail,
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

  Widget signUpButton() {
    return Container(
      height: 50,
      width: double.infinity,
      margin: const EdgeInsets.only(top: 30),
      child: TextButton(
        onPressed: () {
          const Login();
          Global.materialNavigateReplace(context, const Login())
              .then((value) => setState(() {}));
          // submitLogin();
        },
        style: TextButton.styleFrom(
          backgroundColor: onmarcyPrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
        child: Text(
          'Register',
          style: primaryTextStyle.copyWith(
              fontSize: 16, fontWeight: medium, color: whiteColor),
        ),
      ),
    );
  }

  // Submit Login
  void submitLogin() async {
    if (_formKey.currentState!.validate()) {
      if (etEmail.text == "admin" && etPassword.text == "admin") {
        // ignore: avoid_print
        print("login admin success");
        // SweetAlert.show(context,
        //               title: "Just show a message",
        //               subtitle: "Sweet alert is pretty",
        //               style: SweetAlertStyle.success);
        // showSuccessAlertDialog();
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

  void init(){
    listCityName.clear();
    for(int j = 0; j < App.listCity.length; j++){
      listCityName.add(App.listCity[j].name);
    }
    setState((){
      Fluttertoast.showToast(
        msg: "INIT : " + App.listCity.length.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
      );
    });
  }
}
