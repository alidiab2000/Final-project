import 'package:flutter/material.dart';

class NpkSensorApp extends StatelessWidget {
  const NpkSensorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NpkSensorScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class NpkSensorScreen extends StatelessWidget {
  final data = {
    'PH': '6.6',
    'Humidity': '33%',
    'Temperature': '25 c',
    'Nitrogen': '12mg/km',
    'Phosphorus': '74mg/km',
    'Potassium': '67mg/km',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.grid_view), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              SizedBox(height: 20),
              Text(
                'NPK Sensor',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff1E640A),
                ),
              ),
              SizedBox(height: 30),
              SensorRow(
                label: "PH",
                value: "0.0",
                controller: TextEditingController(),
              ),
              SensorRow(
                label: "Humidity",
                value: "0.0",
                controller: TextEditingController(),
              ),
              SensorRow(
                label: "Temperature",
                value: "0.0",
                controller: TextEditingController(),
              ),
              SensorRow(
                label: "Naitrogen",
                value: "0.0",
                controller: TextEditingController(),
              ),
              SensorRow(
                label: "Phosphorus",
                value: "0.0",
                controller: TextEditingController(),
              ),
              SensorRow(
                label: "Potassium",
                value: "0.0",
                controller: TextEditingController(),
              ),

              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff1E640A),
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Send',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SensorRow extends StatefulWidget {
  final String label;
  final String value;
  final TextEditingController controller;

  const SensorRow({
    required this.label,
    required this.value,
    required this.controller,
  });

  @override
  _SensorRowState createState() => _SensorRowState();
}

class _SensorRowState extends State<SensorRow> {
  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.label,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xff1E640A),
            ),
          ),
          Container(
            width: 120,
            padding: EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xff1E640A)),
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextField(
              controller: widget.controller,
              decoration: InputDecoration(border: InputBorder.none),
              style: TextStyle(fontSize: 16, color: Colors.black),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
