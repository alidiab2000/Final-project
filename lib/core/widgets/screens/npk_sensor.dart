import 'package:flutter/material.dart';

void main() => runApp(NpkSensorApp());

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

  NpkSensorScreen({super.key});

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
              ...data.entries.map(
                (entry) => SensorRow(label: entry.key, value: entry.value),
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

  const SensorRow({super.key, required this.label, required this.value});

  @override
  _SensorRowState createState() => _SensorRowState();
}

class _SensorRowState extends State<SensorRow> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.value);
  }

  @override
  void dispose() {
    _controller.dispose();
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
              controller: _controller,
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
