import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:onmarcy/model/city.dart';
import 'package:onmarcy/page/Home.dart';
import 'package:onmarcy/page/Login.dart';
import 'package:onmarcy/util/global.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'model/api.dart';

//You need to change the hex when calling, for example#223344 needs change to 0xFF223344
//That is to replace # with 0xFF
MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = <int, Color>{};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch);
}

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.removeAfter(initialization);

  runApp(const App());
}

Future initialization(BuildContext? context) async {
  await Future.delayed(const Duration(seconds: 3));
}

class App extends StatefulWidget {
  static List<City> listCity = [];
  static bool loadedCity = false;

  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  bool isSwitchedDarkMode = false;
  SharedPreferences? sharedPrefs;

  @override
  void initState() {
    super.initState();
    
    SharedPreferences.getInstance().then((prefs) {
      setState(() => sharedPrefs = prefs);

      App.loadedCity = Global.getSharedBool(key: Prefs.PREFS_CITY_LOADED);
      List<String> _dataCity = Global.getSharedList(key: Prefs.PREFS_CITY);
      App.listCity = [];
      for (var element in _dataCity) {
        App.listCity.add(City.fromJson(jsonDecode(element)));
      }

      Future.delayed(Duration.zero, () async {
        fetchCity();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Onmarcy',
      theme: ThemeData(
          primarySwatch: createMaterialColor(const Color(0xFFBE141F)),
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: Home(),
    );
  }

  Future<void> fetchCity() async {
    final response = API.fromJson(await City.select(context: context, showLoading: false));
    App.loadedCity = true;
    Global.setSharedBool(key: Prefs.PREFS_CITY_LOADED, value: true);
    if (response.success) {
      List<String> offline = [];
      App.listCity = [];
      response.data.forEach((data) {
        App.listCity.add(City.fromJson(data));
        offline.add(jsonEncode(data));
      });

      Fluttertoast.showToast(
        msg: "INIT : " + App.listCity.length.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
      );
      
      Global.setSharedList(key: Prefs.PREFS_CITY, value: offline);
    }
    setState(() {});
  }


  @override
  void dispose() {
    super.dispose();
  }
}

// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:flutter_native_splash/flutter_native_splash.dart';
// import 'package:onmarcy/model/city.dart';
// import 'package:onmarcy/page/Login.dart';
// import 'package:onmarcy/util/global.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import 'model/api.dart';

// //You need to change the hex when calling, for example#223344 needs change to 0xFF223344
// //That is to replace # with 0xFF
// MaterialColor createMaterialColor(Color color) {
//   List strengths = <double>[.05];
//   Map<int, Color> swatch = <int, Color>{};
//   final int r = color.red, g = color.green, b = color.blue;

//   for (int i = 1; i < 10; i++) {
//     strengths.add(0.1 * i);
//   }
//   for (var strength in strengths) {
//     final double ds = 0.5 - strength;
//     swatch[(strength * 1000).round()] = Color.fromRGBO(
//       r + ((ds < 0 ? r : (255 - r)) * ds).round(),
//       g + ((ds < 0 ? g : (255 - g)) * ds).round(),
//       b + ((ds < 0 ? b : (255 - b)) * ds).round(),
//       1,
//     );
//   }
//   return MaterialColor(color.value, swatch);
// }

// Future main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   FlutterNativeSplash.removeAfter(initialization);

//   runApp(const MyApp());
// }

// Future initialization(BuildContext? context) async {
//   await Future.delayed(const Duration(seconds: 3));
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Onmarcy',
//       theme: ThemeData(
//           primarySwatch: createMaterialColor(const Color(0xFFBE141F)),
//           visualDensity: VisualDensity.adaptivePlatformDensity),
//       // home: const MyHomePage(title: 'Onmarcy'),
//       home: const Login(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);

//   static List<City> listCity = [];
//   static bool loadedCity = false;

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   bool isSwitchedDarkMode = false;
//   SharedPreferences? sharedPrefs;
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     SharedPreferences.getInstance().then((prefs) {
//       setState(() => sharedPrefs = prefs);

//       MyHomePage.loadedCity = Global.getSharedBool(key: Prefs.PREFS_CITY_LOADED);
//       List<String> _dataCity = Global.getSharedList(key: Prefs.PREFS_CITY);
//       MyHomePage.listCity = [];
//       _dataCity.forEach((element) {
//         MyHomePage.listCity.add(City.fromJson(jsonDecode(element)));
//       });

//       Future.delayed(Duration.zero, () async {
//         fetchCity();
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headline4,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ),
//     );
//   }

//   Future<void> fetchCity() async {
//     final response = API.fromJson(await City.select(context: context, showLoading: false));
//     MyHomePage.loadedCity = true;
//     Global.setSharedBool(key: Prefs.PREFS_CITY_LOADED, value: true);
//     if (response.success) {
//       List<String> offline = [];
//       MyHomePage.listCity = [];
//       response.data.forEach((data) {
//         MyHomePage.listCity.add(City.fromJson(data));
//         offline.add(jsonEncode(data));
//       });
//       Global.setSharedList(key: Prefs.PREFS_CITY, value: offline);
//     }
//     setState(() {});
//   }
// }
