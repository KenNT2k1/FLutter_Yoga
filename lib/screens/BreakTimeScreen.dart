import 'dart:async';

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:provider/provider.dart';
import 'FinishScreen.dart';

class BreakTimeScreen extends StatefulWidget {
  const BreakTimeScreen({Key? key}) : super(key: key);

  @override
  _BreakTimeScreenState createState() => _BreakTimeScreenState();
}

class _BreakTimeScreenState extends State<BreakTimeScreen> {
  late AudioCache audioCache;

  @override
  void initState() {
    super.initState();
    audioCache = AudioCache(prefix: 'assets/');
    audioCache.load('yoga.mp3');
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TimerModelSec>(
      create: (context) => TimerModelSec(context),
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage("assets/yoga3.jpeg"),
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "BREAK",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "DEEP BREATH",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 30),
                Consumer<TimerModelSec>(builder: (context, myModel, child) {
                  return Text(
                    "${myModel.countDown.toString()} Sec",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TimerModelSec with ChangeNotifier {
  TimerModelSec(context) {
    MyTimerSec(context);
  }

  int countDown = 20;

  MyTimerSec(context) async {
    AudioCache audioCache = AudioCache(prefix: 'assets/');
    audioCache.play('yoga.mp3');

    Timer.periodic(const Duration(seconds: 1), (timer) {
      countDown--;
      notifyListeners();

      if (countDown <= 0) {
        timer.cancel();
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const FinishScreen()),
        );
      }
    });
  }
}
