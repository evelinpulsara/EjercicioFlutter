import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WaterTrackerPage(),
    );
  }
}

class WaterTracker {
  int glasses;

  WaterTracker({this.glasses = 0});

  void addGlass() {
    glasses++;
  }

  void removeGlass() {
    if (glasses > 0) {
      glasses--;
    }
  }

  String getMessage() {
    if (glasses == 0) {
      return "Start drinking water!";
    } else if (glasses < 5) {
      return "Keep going!";
    } else if (glasses < 8) {
      return "Great job!";
    } else {
      return "You reached your goal!";
    }
  }
}

class WaterTrackerPage extends StatefulWidget {
  const WaterTrackerPage({super.key});

  @override
  State<WaterTrackerPage> createState() => _WaterTrackerPageState();
}

class _WaterTrackerPageState extends State<WaterTrackerPage> {
  final WaterTracker tracker = WaterTracker();

  void addWater() {
    setState(() {
      tracker.addGlass();
    });
  }

  void removeWater() {
    setState(() {
      tracker.removeGlass();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Water Intake Tracker"),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.water_drop,
                size: 80,
                color: Colors.blue,
              ),
              const SizedBox(height: 20),
              Text(
                "${tracker.glasses} glasses",
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                tracker.getMessage(),
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: addWater,
                    child: const Text("Add"),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: removeWater,
                    child: const Text("Remove"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
