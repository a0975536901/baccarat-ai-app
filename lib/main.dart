import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String result = "尚未開始";
  bool running = false;

  void startAI() {
    setState(() {
      running = true;
      result = "AI分析中...";
    });

    Timer.periodic(const Duration(seconds: 3), (timer) {
      if (!running) {
        timer.cancel();
      } else {
        setState(() {
          result = getFakePrediction();
        });
      }
    });
  }

  void stopAI() {
    setState(() {
      running = false;
      result = "已停止";
    });
  }

  String getFakePrediction() {
    List<String> outcomes = ["莊", "閒", "和"];
    outcomes.shuffle();
    return "預測結果：${outcomes.first}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("百家樂AI")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(result, style: const TextStyle(fontSize: 28)),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: startAI,
            child: const Text("開始分析"),
          ),
          ElevatedButton(
            onPressed: stopAI,
            child: const Text("停止"),
          ),
        ],
      ),
    );
  }
}
