import 'package:flutter/material.dart';
import 'package:onmarcy/util/theme.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({ Key? key }) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {},
              child: Icon(
                Icons.search,
                size: 26.0,
              ),
            )
          ),
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {},
              child: Icon(
                Icons.filter_alt,
                size: 26.0,
              ),
            )
          ),
          // Padding(
          //   padding: EdgeInsets.only(right: 20.0),
          //   child: GestureDetector(
          //     onTap: () {},
          //     child: Icon(
          //         Icons.more_vert
          //     ),
          //   )
          // )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
        },
        // backgroundColor: Colors.green,
        child: const Icon(
          Icons.add,
          size: 35,
        ),
      ),
      body: SingleChildScrollView(),
    );
  }
}