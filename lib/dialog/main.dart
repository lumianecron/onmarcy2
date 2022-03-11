import 'package:flutter/material.dart';

class Dialogs{
  //TO DISMISS A DIALOG
  static void hideDialog({@required BuildContext? context}) {
    Navigator.pop(context!);
  }

  //TO SHOW A LOADING DIALOG
  static void showLoading({@required BuildContext? context}) {
    showDialog(
      context: context!,
      barrierDismissible: false,
      builder: (context) => WillPopScope(
        onWillPop: () async => false,
        child: AlertDialog(
          elevation: 0,
          backgroundColor: Colors.transparent,
          content: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              CircularProgressIndicator(
                valueColor: new AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor)
              ),
            ],
          )
        )
      )
    );
  }


  //TO SHOW A SIMPLE TEXT DIALOG
  static void showSimpleText({
    @required BuildContext? context,
    @required String? text,
    String title = '',
    void Function()? action
  }){
    showDialog(
      context: context!,
      barrierDismissible: false,
      builder: (context) => WillPopScope(
        onWillPop: () async => false,
        child: AlertDialog(
          title: title != ''
              ? Text(title, style: TextStyle(fontWeight: FontWeight.bold))
              : null,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
          actions: <Widget>[
            TextButton(
              child: Text("OK"),
              onPressed: () {
                hideDialog(context: context);
                if (action != null) action();
              })
          ],
          content: Text(text!)
        )
      )
    );
  }


  //TO SHOW A YES NO DIALOG
  //Action digunakan untuk mengirimkan action yang akan dilakukan ketika user memilih yes atau no
  static void showYesNo({
    @required BuildContext? context,
    @required String? text,
    @required void Function(bool)? action
  }){
    showDialog(
      context: context!,
      barrierDismissible: false, // IF SCREEN PRESSED
      builder: (context) => WillPopScope(
        onWillPop: () async => false, // IF BACK PRESSED
        child: AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
          actions: <Widget>[
            TextButton(
              child: Text("NO"),
              onPressed: () {
                hideDialog(context: context);
                action!(false);
              },
            ),
            TextButton(
              child: Text("YES"),
              onPressed: () {
                hideDialog(context: context);
                action!(true);
              },
            )
          ],
          content: Text(text!)
        )
      )
    );
  }
}