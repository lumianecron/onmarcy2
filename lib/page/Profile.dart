import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:onmarcy/main.dart';
import 'package:onmarcy/util/theme.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController etName = TextEditingController();
  final TextEditingController etUsername = TextEditingController();
  final TextEditingController etEmail = TextEditingController();
  final TextEditingController etPhone = TextEditingController();
  final TextEditingController etPassword = TextEditingController();
  final TextEditingController etConfirmPassword = TextEditingController();

  List<String> listCity = ["Surabaya", "Malang", "Depansar", "Jakarta"];
  List<String> listCityName = [];
  String? selectedCityName = "Surabaya";

  @override
  Widget build(BuildContext context) {
    etName.text = "Lumia";
    etUsername.text = "lumia";
    etEmail.text = "octaviuskrist@gmail.com";
    etPhone.text = "085103382834";

    return Container(
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(defaultMargin),
          margin: EdgeInsets.only(bottom: 60),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: RawMaterialButton(
                      onPressed: () {},
                      elevation: 2.0,
                      fillColor: createMaterialColor(const Color(0xFFBE141F)),
                      constraints: BoxConstraints.tight(Size(40, 40)),
                      child: Center(
                        child: Icon(
                          Icons.add_photo_alternate,
                          size: 30,
                        ),
                      ),
                      padding: EdgeInsets.all(0),
                      shape: CircleBorder(),
                    ),
                  ),
                  radius: 75,
                  backgroundImage: NetworkImage(
                      "https://yt3.ggpht.com/yti/APfAmoFKCHvBxsuS3-jbylA-VatZIRsfZxBFZpYN-hvfBc8=s88-c-k-c0x00ffffff-no-rj-mo"),
                ),
                // Chip(
                //   padding: EdgeInsets.all(0),
                //   backgroundColor: Colors.deepPurple,
                //   label: Text('BADGE', style: TextStyle(color: Colors.white)),
                // ),
                Chip(
                  avatar: Icon(Icons.check_circle_outline, color: Colors.green),
                  padding: EdgeInsets.all(0),
                  backgroundColor: Color(0x00ffffff),
                  label: Text('Verified',
                      style: TextStyle(fontSize: 20, color: Colors.green)),
                ),
                nameInput(),
                usernameInput(),
                emailInput(),
                phoneInput(),
                passwordInput(),
                confirmPasswordInput(),
                cityInput(),
                // SizedBox(height: 15),
                // Text(
                //   "Lumia",
                //   style: TextStyle(
                //     fontSize: 25
                //   )
                // ),
                // SizedBox(height: 10),
                // Text(
                //   "octaviuskrist@gmail.com",
                //   style: TextStyle(
                //     fontSize: 15,
                //     color: Colors.grey,
                //     fontStyle: FontStyle.italic
                //   )
                // ),
                // SizedBox(
                //   child: Container(
                //     decoration: BoxDecoration(
                //       border: Border(bottom: BorderSide()),
                //     )
                //   ),
                //   height: 20,
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget nameInput() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Center(
        child: Expanded(
            child: TextFormField(
          style: primaryTextStyle,
          controller: etName,
          keyboardType: TextInputType.name,
          decoration: const InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12))
            ),
            prefixIcon: Icon(Icons.person),
            labelText: 'Name',
            // The MaterialStateProperty's value is a text style that is orange
            // by default, but the theme's error color if the input decorator
            // is in its error state.
            // labelStyle:
            //     MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
            //   final Color color = states.contains(MaterialState.error)
            //       ? Theme.of(context).errorColor
            //       : Colors.orange;
            //   return TextStyle(color: color, letterSpacing: 1.3);
            // }),
          ),
          validator: (String? value) {
            if (value == null || value == '') {
              return 'Enter name';
            }
            return null;
          },
          autovalidateMode: AutovalidateMode.always,
        )),
      ),
    );
  }

  Widget usernameInput() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Center(
        child: Expanded(
            child: TextFormField(
          style: primaryTextStyle,
          controller: etUsername,
          readOnly: true,
          decoration: const InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12))
            ),
            prefixIcon: Icon(Icons.person),
            labelText: 'Username',
            // The MaterialStateProperty's value is a text style that is orange
            // by default, but the theme's error color if the input decorator
            // is in its error state.
            // labelStyle:
            //     MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
            //   final Color color = states.contains(MaterialState.error)
            //       ? Theme.of(context).errorColor
            //       : Colors.orange;
            //   return TextStyle(color: color, letterSpacing: 1.3);
            // }),
          ),
        )),
      ),
    );
  }

  Widget emailInput() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Center(
        child: Expanded(
            child: TextFormField(
          style: primaryTextStyle,
          controller: etEmail,
          keyboardType: TextInputType.emailAddress,
          readOnly: true,
          decoration: const InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12))
            ),
            prefixIcon: Icon(Icons.mail),
            labelText: 'Email',
            // The MaterialStateProperty's value is a text style that is orange
            // by default, but the theme's error color if the input decorator
            // is in its error state.
            // labelStyle:
            //     MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
            //   final Color color = states.contains(MaterialState.error)
            //       ? Theme.of(context).errorColor
            //       : Colors.orange;
            //   return TextStyle(color: color, letterSpacing: 1.3);
            // }),
          ),
        )),
      ),
    );
  }

  Widget phoneInput() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Center(
        child: Expanded(
            child: TextFormField(
          style: primaryTextStyle,
          controller: etPhone,
          keyboardType: TextInputType.phone,
          decoration: const InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12))
            ),
            prefixIcon: Icon(Icons.phone),
            labelText: 'Phone',
            // The MaterialStateProperty's value is a text style that is orange
            // by default, but the theme's error color if the input decorator
            // is in its error state.
            // labelStyle:
            //     MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
            //   final Color color = states.contains(MaterialState.error)
            //       ? Theme.of(context).errorColor
            //       : Colors.orange;
            //   return TextStyle(color: color, letterSpacing: 1.3);
            // }),
          ),
          validator: (String? value) {
            if (value == null || value == '') {
              return 'Enter phone';
            }
            if (value.length < 12) {
              return 'Enter valid phone number';
            }
            return null;
          },
          autovalidateMode: AutovalidateMode.always,
        )),
      ),
    );
  }

  Widget passwordInput() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Center(
        child: Expanded(
            child: TextFormField(
          style: primaryTextStyle,
          controller: etPassword,
          keyboardType: TextInputType.text,
          obscureText: true,
          decoration: const InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12))
            ),
            prefixIcon: Icon(Icons.password),
            labelText: 'Password',
            // The MaterialStateProperty's value is a text style that is orange
            // by default, but the theme's error color if the input decorator
            // is in its error state.
            // labelStyle:
            //     MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
            //   final Color color = states.contains(MaterialState.error)
            //       ? Theme.of(context).errorColor
            //       : Colors.orange;
            //   return TextStyle(color: color, letterSpacing: 1.3);
            // }),
          ),
        )),
      ),
    );
  }

  Widget confirmPasswordInput() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Center(
        child: Expanded(
            child: TextFormField(
          style: primaryTextStyle,
          controller: etConfirmPassword,
          keyboardType: TextInputType.text,
          obscureText: true,
          decoration: const InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12))
            ),
            prefixIcon: Icon(Icons.password),
            labelText: 'Confirm Password',
            // The MaterialStateProperty's value is a text style that is orange
            // by default, but the theme's error color if the input decorator
            // is in its error state.
            // labelStyle:
            //     MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
            //   final Color color = states.contains(MaterialState.error)
            //       ? Theme.of(context).errorColor
            //       : Colors.orange;
            //   return TextStyle(color: color, letterSpacing: 1.3);
            // }),
          ),
        )),
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
                fontSize: 16, fontWeight: medium, color: Colors.grey),
          ),
          const SizedBox(
            height: 12,
          ),
          Container(
            height: 65,
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey),
            ),
            child: Expanded(
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  hint: const Text("Select any City"),
                  isExpanded: true,
                  value: selectedCityName,
                  items: listCity
                    .map((item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: primaryTextStyle,
                      )
                    )).toList(),
                  onChanged: (item) =>
                      setState(() => selectedCityName = item),
                ),
              )
            ),
          ),
        ],
      ),
    );
  }
}
