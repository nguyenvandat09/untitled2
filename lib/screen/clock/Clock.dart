import 'dart:async';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late DateTime now;
  late Timer _timer;
  Color color = Colors.black;
  String time = "00:00:00";
  String hexCode = "000000";
  String hrs = "00";
  String min = "00";
  String sec = "00";

  @override
  void initState() {
    super.initState();

    _updateTime();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _updateTime() {
    setState(
          () {
        now = DateTime.now();
        hrs = now.hour.toString().padLeft(2, '0');
        min = now.minute.toString().padLeft(2, '0');
        sec = now.second.toString().padLeft(2, '0');
        time = '$hrs : $min : $sec';
        hexCode = '#$hrs$min$sec';
        color = rgbValue(hrs, min, sec);

        _timer = Timer(
          const Duration(seconds: 1) - Duration(milliseconds: now.millisecond),
          _updateTime,
        );
      },
    );
  }

  Color rgbValue(h, m, s) {
    int r = int.parse(h, radix: 16);
    int g = int.parse((m), radix: 16);
    int b = int.parse((s), radix: 16);

    return Color.fromRGBO(r, g, b, 1.0);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
          '$time \n ',
          style: TextStyle(fontSize: getFontSize(context), color: Colors.white),
        ),

    );
  }
}
double getFontSize(BuildContext context) {
  final shortSide = MediaQuery.of(context).size.shortestSide;
  return ((shortSide * 0.07).roundToDouble());
}