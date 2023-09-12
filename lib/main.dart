import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'temperature_converter.dart';
import 'pressure_converter.dart';
import 'length_converter.dart';
import 'mass_converter.dart';
import 'time_converter.dart';
import 'speed_converter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          textTheme: GoogleFonts.oswaldTextTheme(Theme.of(context).textTheme)),
      home: const MyHomePage(title: 'Unit Converter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          title: Text(widget.title),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    children: [
                      const Spacer(),
                      SizedBox(
                          width: 130,
                          height: 90,
                          child: ElevatedButton.icon(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const TemperatureApp()));
                            },
                            icon: const Icon(Icons.thermostat),
                            label: const Text('Temperature'),
                            style: ElevatedButton.styleFrom(
                              elevation: 10,
                              backgroundColor: Colors.black,
                            ),
                          )),
                      const SizedBox(
                        width: 10,
                        height: 120,
                      ),
                      SizedBox(
                          width: 130,
                          height: 90,
                          child: ElevatedButton.icon(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const PressureApp()));
                            },
                            icon: const Icon(Icons.padding),
                            label: const Text('Pressure'),
                            style: ElevatedButton.styleFrom(
                              elevation: 10,
                              backgroundColor: Colors.black45,
                            ),
                          )),
                      const Spacer(),
                    ],
                  ),
                  Row(
                    children: [
                      const Spacer(),
                      SizedBox(
                          width: 130,
                          height: 90,
                          child: ElevatedButton.icon(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const LengthApp()));
                            },
                            icon: const Icon(Icons.line_axis),
                            label: const Text('Length'),
                            style: ElevatedButton.styleFrom(
                              elevation: 10,
                              backgroundColor: Colors.black45,
                            ),
                          )),
                      const SizedBox(
                        width: 10,
                        height: 100,
                      ),
                      SizedBox(
                          width: 130,
                          height: 90,
                          child: ElevatedButton.icon(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const MassApp()));
                            },
                            icon: const Icon(
                              Icons.monitor_weight_rounded,
                              size: 24,
                            ),
                            label: const Text('Mass'),
                            style: ElevatedButton.styleFrom(
                              elevation: 10,
                              backgroundColor: Colors.black,
                            ),
                          )),
                      const Spacer(),
                    ],
                  ),
                  Row(
                    children: [
                      const Spacer(),
                      SizedBox(
                        width: 130,
                        height: 90,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const TimeApp()));
                          },
                          icon: const Icon(Icons.access_alarm),
                          label: const Text('Time'),
                          style: ElevatedButton.styleFrom(
                            elevation: 10,
                            backgroundColor: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                        height: 120,
                      ),
                      SizedBox(
                        width: 130,
                        height: 90,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SpeedApp()));
                          },
                          icon: const Icon(Icons.speed),
                          label: const Text('Speed'),
                          style: ElevatedButton.styleFrom(
                            elevation: 10,
                            backgroundColor: Colors.black45,
                          ),
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
