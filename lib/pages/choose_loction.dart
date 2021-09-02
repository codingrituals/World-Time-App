import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  ChooseLocation({Key? key}) : super(key: key);

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              counter++;
            });
          },
          child: Text('Counter: $counter'),
        ),
      ),
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose A Location'),
        centerTitle: true,
        elevation: 0,
      ),
    );
  }
}
