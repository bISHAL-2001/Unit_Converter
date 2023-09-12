import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'temperature_converter.dart';
import 'pressure_converter.dart';
import 'length_converter.dart';
import 'time_converter.dart';
import 'speed_converter.dart';

class MassApp extends StatelessWidget {
  const MassApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mass',
      theme: ThemeData(
          textTheme: GoogleFonts.oswaldTextTheme(Theme.of(context).textTheme)),
      home: const HomePage(title: 'Mass'),
    );
  }
}

class _HomePageState extends State<HomePage> {
  List<String> list = <String>[
        'Tonne',
        'Kilogram',
        'Gram',
        'Milligram',
        'Micrograms',
        'Imperial Ton',
        'US Ton',
        'Stone',
        'Pound',
        'Ounce',
      ],
      units = <String>[
        't',
        'kg',
        'gm',
        'mg',
        'μg',
        'T',
        'US t',
        'st',
        'lb',
        'oz',
      ];
  List<double> t = <double>[
        1,
        1000,
        1.0 * pow(10, 6),
        1.0 * pow(10, 9),
        1.0 * pow(10, 12),
        0.984207,
        1.102,
        157.473,
        2205,
        35274,
      ],
      kg = <double>[
        0.001,
        1,
        1000,
        1.0 * pow(10, 6),
        1.0 * pow(10, 9),
        1 / 1016,
        0.00110231,
        0.157473,
        2.20462,
        35.274
      ],
      gm = <double>[
        1.0 * pow(10, -6),
        .001,
        1,
        1000,
        1.0 * pow(10, 6),
        9.8421 * pow(10, -7),
        1.1023 * pow(10, -6),
        1 / 6350,
        0.00220462,
        0.035274
      ],
      mg = <double>[
        1.0 * pow(10, -9),
        1.0 * pow(10, -6),
        0.001,
        1,
        1000,
        0.000277778,
        9.8421 * pow(10, -10),
        1.1023 * pow(10, -9),
        1.5747 * pow(10, -7),
        2.2046 * pow(10, -6),
        3.5274 * pow(10, -5),
      ],
      micro = <double>[
        1.0 * pow(10, -12),
        1.0 * pow(10, -9),
        1.0 * pow(10, -6),
        1,
        0.001,
        9.8421 * pow(10, -13),
        1.1023 * pow(10, -12),
        1.5747 * pow(10, -10),
        2.2046 * pow(10, -9),
        3.5274 * pow(10, -8)
      ],
      T = <double>[
        1.01605,
        1016.05,
        1.016*pow(10, 6),
        1.016*pow(10, 9),
        1.016*pow(10, 12),
        1,
        1.12,
        168,
        2240,
        35840,
      ],
      usT = <double>[
        0.907185,
        907.185,
        907185,
        9.072*pow(10, 8),
        9.072*pow(10, 11),
        0.892857,
        1,
        142.857,
        2000,
        32000
      ],
      st = <double>[
        0.00635029,
        6.35029,
        6350.29,
        6.35*pow(10, 6),
        6.35*pow(10, 9),
        1/160,
        0.007,
        1,
        14,
        224
      ],
      lb = <double>[
        1/2205,
        1/2.205,
        453.592,
        453592,
        4.536*pow(10, 8),
        1/2240,
        1/2000,
        1/14,
        1,
        16
      ],
      oz = <double>[
        2.835*pow(10, -5),
        0.0283495,
        28.3495,
        28349.5,
        2.835*pow(10, 7),
        1/35840,
        1/32000,
        1 / 224 ,
        1 / 16,
        1
      ];
  String dropDownValue = 'Kilogram',
      dropDownValue1 = 'Gram',
      valueToDisplay = "";
  double value1 = 0.0;
  late TextEditingController titleController;

  @override
  void initState() {
    titleController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
  }

  void convert() {
    int index1 = list.indexOf(dropDownValue);
    int index2 = list.indexOf(dropDownValue1);

    double value = double.parse(titleController.text.toString());
    if (units[index1] == 't') {
      value1 = value * t[index2];
    } else if (units[index1] == 'kg') {
      value1 = value * kg[index2];
    } else if (units[index1] == 'gm') {
      value1 = value * gm[index2];
    } else if (units[index1] == 'mg') {
      value1 = value * mg[index2];
    } else if (units[index1] == 'μg') {
      value1 = value * micro[index2];
    } else if (units[index1] == 'T') {
      value1 = value * T[index2];
    } else if (units[index1] == 'US T') {
      value1 = value * usT[index2];
    } else if (units[index1] == 'st') {
      value1 = value * st[index2];
    } else if (units[index1] == 'lb') {
      value1 = value * lb[index2];
    } else {
      value1 = value * oz[index2];
    }

    print(value1);
    valueToDisplay = value1.toString();
    int indexOfDecimal = valueToDisplay.indexOf('.');
    String decPart = valueToDisplay.substring(
          indexOfDecimal + 1,
        ),
        intPart = valueToDisplay.substring(0, indexOfDecimal);

    if (intPart.length >= 7) {
      if (value1.toStringAsFixed(4).length <= 9) {
        valueToDisplay = valueToDisplay;
      } else {
        valueToDisplay = value1.toStringAsExponential();
      }
    } else {
      if (decPart.length >= 4) {
        valueToDisplay = value1.toStringAsExponential(3);
      } else {
        valueToDisplay = value1.toStringAsFixed(4);
      }
    }
    if (!valueToDisplay.contains('e')) {
      valueToDisplay =
          valueToDisplay.replaceAll(RegExp(r"([.]*0+)(?!.*\d)"), "");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        backgroundColor: Colors.black,
        actions: [
          PopupMenuButton(itemBuilder: (context) {
            return [
              PopupMenuItem<int>(
                value: 0,
                child: Row(
                  children: const <Widget>[
                    Icon(
                      Icons.thermostat_rounded,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Temperature"),
                  ],
                ),
              ),
              PopupMenuItem<int>(
                value: 1,
                child: Row(
                  children: const <Widget>[
                    Icon(
                      Icons.padding,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Pressure"),
                  ],
                ),
              ),
              PopupMenuItem<int>(
                value: 2,
                child: Row(
                  children: const <Widget>[
                    Icon(
                      Icons.line_axis,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Length"),
                  ],
                ),
              ),
              PopupMenuItem<int>(
                value: 3,
                child: Row(
                  children: const <Widget>[
                    Icon(
                      Icons.alarm,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Time"),
                  ],
                ),
              ),
              PopupMenuItem<int>(
                value: 4,
                child: Row(
                  children: const <Widget>[
                    Icon(
                      Icons.speed,
                      color: Colors.black,
                    ),
                    SizedBox(width: 5),
                    Text("Speed"),
                  ],
                ),
              ),
            ];
          }, onSelected: (value) {
            if (value == 0) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const TemperatureApp()));
            } else if (value == 1) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const PressureApp()));
            } else if (value == 2) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const LengthApp()));
            } else if (value == 3) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const TimeApp()));
            } else if (value == 4) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const SpeedApp()));
            }
          }),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.fromLTRB(0, 50, 0, 50),
            child: Column(
              children: <Widget>[
                SizedBox(
                  width: 300,
                  child: DropdownButtonFormField(
                    borderRadius: BorderRadius.circular(15),
                    value: dropDownValue,
                    isExpanded: true,
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderSide: BorderSide(color: Colors.black, width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderSide: BorderSide(color: Colors.black, width: 2),
                      ),
                      filled: true,
                      fillColor: Colors.black12,
                    ),
                    items: list.map<DropdownMenuItem<String>>((String list) {
                      return DropdownMenuItem<String>(
                        value: list,
                        child: Text(
                          list,
                        ),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        dropDownValue = newValue.toString();
                        if (dropDownValue == dropDownValue1) {
                          int i = list.indexOf(dropDownValue1);
                          if (i == (list.length - 1)) {
                            dropDownValue1 = list[i - 1];
                          } else {
                            dropDownValue1 = list[i + 1];
                          }
                        }
                        convert();
                      });
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  child: Text(
                    'To',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 300,
                  child: DropdownButtonFormField(
                    borderRadius: BorderRadius.circular(15),
                    value: dropDownValue1,
                    isExpanded: true,
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderSide: BorderSide(color: Colors.black, width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        //<-- SEE HERE
                        borderSide: BorderSide(color: Colors.black, width: 2),
                      ),
                      filled: true,
                      fillColor: Colors.black12,
                    ),
                    items:
                        list.map<DropdownMenuItem<String>>((String tempList) {
                      return DropdownMenuItem<String>(
                        value: tempList,
                        child: Text(
                          tempList,
                        ),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        dropDownValue1 = newValue.toString();
                        if (dropDownValue1 == dropDownValue) {
                          int i = list.indexOf(dropDownValue);
                          if (i == (list.length - 1)) {
                            dropDownValue = list[i - 1];
                          } else {
                            dropDownValue = list[i + 1];
                          }
                        }
                        convert();
                      });
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 220,
                      child: Center(
                        child: TextField(
                          cursorColor: Colors.black,
                          autofocus: false,
                          controller: titleController,
                          decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 2),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 2),
                            ),
                            labelStyle: TextStyle(color: Colors.black),
                            // iconColor: Colors.black,
                            filled: true,
                            fillColor: Colors.black12,
                            prefixIcon: Icon(Icons.monitor_weight_rounded,
                                color: Colors.blueGrey),
                            hintText: 'Enter Mass',
                            labelText: 'Enter Mass',
                          ),
                          keyboardType: const TextInputType.numberWithOptions(
                              decimal: true),
                        ),
                      ),
                    ),
                    const SizedBox(width: 5),
                    SizedBox(
                      height: 64,
                      width: 75,
                      child: OutlinedButton(
                        onPressed: () {
                          setState(() {
                            convert();
                          });
                        },
                        style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.black,
                            foregroundColor: Colors.white),
                        child: const Text(
                          'Convert',
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(7),
                          bottomLeft: Radius.circular(7),
                        ),
                        color: Colors.black,
                      ),
                      child: SizedBox(
                        width: 50,
                        height: 64,
                        child: Center(
                            child: Text(units[list.indexOf(dropDownValue1)],
                                style: const TextStyle(color: Colors.white))),
                      ),
                    ),
                    Container(
                      // color: Colors.black12,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(7),
                          bottomRight: Radius.circular(7),
                        ),
                        color: Colors.black12,
                      ),
                      child: SizedBox(
                        width: 170,
                        height: 64,
                        child: Center(
                          child: FittedBox(
                            child: Text(valueToDisplay,
                                style: const TextStyle(fontSize: 20)),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 5),
                    SizedBox(
                      height: 64,
                      width: 75,
                      child: OutlinedButton(
                          onPressed: () {
                            Clipboard.setData(ClipboardData(
                                text: value1.toString().replaceAll(
                                    RegExp(r"([.]*0+)(?!.*\d)"), "")));
                            const snackBar = SnackBar(
                                elevation: 0,
                                backgroundColor: Colors.transparent,
                                duration: Duration(seconds: 1),
                                content: Center(
                                    child: Icon(Icons.verified_outlined,
                                        color: Color.fromARGB(225, 0, 225, 0),
                                        size: 30)));
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          },
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.black,
                            foregroundColor: Colors.white,
                          ),
                          child: const Text("Copy")),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}
