import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'temperature_converter.dart';
import 'pressure_converter.dart';
import 'length_converter.dart';
import 'mass_converter.dart';
import 'speed_converter.dart';
import 'dart:math';

class TimeApp extends StatelessWidget {
  const TimeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Time',
      theme: ThemeData(
          textTheme: GoogleFonts.oswaldTextTheme(Theme.of(context).textTheme)),
      home: const HomePage(title: 'Time'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> list = <String>[
        'Nanosecond',
        'Microsecond',
        'Millisecond',
        'Second',
        'Minute',
        'Hour',
        'Day',
        'Week',
        'Month',
        'Calender Year',
        'Decade',
        'Century'
      ],
      units = <String>[
        'ns',
        'μs',
        'ms',
        's',
        'min',
        'hr',
        'day',
        'wks',
        'mon',
        'yr',
        'dec',
        'c'
      ];
  List<double> ns = <double>[
        1,
        0.001,
        1.0 * pow(10, -6),
        1.0 * pow(10, -9),
        1.6667 * pow(10, -11),
        2.77783 * pow(10, -13),
        1.1574 * pow(10, -14),
        1.6534 * pow(10, -15),
        3.8052 * pow(10, -16),
        3.171 * pow(10, -17),
        3.171 * pow(10, -18),
        3.171 * pow(10, -19)
      ],
      micro = <double>[
        1000,
        1,
        0.001,
        1.0 * pow(10, -6),
        1.6667 * pow(10, -8),
        2.77783 * pow(10, -10),
        1.1574 * pow(10, -11),
        1.6534 * pow(10, -12),
        3.8052 * pow(10, -13),
        3.171 * pow(10, -14),
        3.171 * pow(10, -15),
        3.171 * pow(10, -16)
      ],
      ms = <double>[
        1.0 * pow(10, 6),
        1000,
        1,
        .001,
        1.6667 * pow(10, -5),
        2.77783 * pow(10, -7),
        1.1574 * pow(10, -8),
        1.6534 * pow(10, -9),
        3.8052 * pow(10, -10),
        3.171 * pow(10, -11),
        3.171 * pow(10, -12),
        3.171 * pow(10, -13)
      ],
      s = <double>[
        1.0 * pow(10, 9),
        1.0 * pow(10, 6),
        1000,
        1,
        1 / 60,
        0.000277778,
        1.1574 * pow(10, -5),
        1.6534 * pow(10, -6),
        3.805 * pow(10, -7),
        3.171 * pow(10, -8),
        3.171 * pow(10, -9),
        3.171 * pow(10, -10)
      ],
      min = <double>[
        6.0 * pow(10, 10),
        6.0 * pow(10, 7),
        6.0 * pow(10, 4),
        60,
        1,
        1 / 60,
        1 / 1440,
        1 / 10080,
        2.2831 * pow(10, -5),
        1.9026 * pow(10, -6),
        1.9026 * pow(10, -7),
        1.9026 * pow(10, -8)
      ],
      hr = <double>[
        3.6 * pow(10, 12),
        3.6 * pow(10, 9),
        3.6 * pow(10, 6),
        3600,
        60,
        1,
        1 / 24,
        1 / 168,
        1 / 730,
        1 / 8760,
        1 / 87600,
        1 / 876000
      ],
      day = <double>[
        8.64 * pow(10, 13),
        8.64 * pow(10, 10),
        8.64 * pow(10, 7),
        8.64 * pow(10, 4),
        1440,
        24,
        1,
        1 / 7,
        1 / 30.417,
        1 / 365,
        1 / 3650,
        1 / 36500
      ],
      wks = <double>[
        6.048 * pow(10, 14),
        6.048 * pow(10, 11),
        6.048 * pow(10, 8),
        6.048 * pow(10, 5),
        10080,
        168,
        7,
        1,
        1 / 4.345,
        1 / 52.143,
        1 / 521.4,
        1 / 5214
      ],
      mon = <double>[
        2.628 * pow(10, 15),
        2.628 * pow(10, 12),
        2.628 * pow(10, 9),
        2.628 * pow(10, 6),
        43800,
        730,
        31,
        4.345,
        1,
        1 / 12,
        1 / 120,
        1 / 1200
      ],
      yr = <double>[
        3.154 * pow(10, 16),
        3.154 * pow(10, 13),
        3.154 * pow(10, 10),
        3.154 * pow(10, 7),
        525600,
        8760,
        365,
        52.143,
        12,
        1,
        1 / 10,
        1 / 100
      ],
      dec = <double>[
        3.154 * pow(10, 17),
        3.154 * pow(10, 14),
        3.154 * pow(10, 11),
        3.154 * pow(10, 8),
        5.256 * pow(10, 6),
        87600,
        3650,
        521.4,
        120,
        10,
        1,
        0.1
      ],
      c = <double>[
        3.154 * pow(10, 18),
        3.154 * pow(10, 15),
        3.154 * pow(10, 12),
        3.154 * pow(10, 9),
        5.256 * pow(10, 7),
        876000,
        36500,
        5214,
        1200,
        100,
        10,
        1
      ];
  String dropDownValue = 'Nanosecond',
      dropDownValue1 = 'Microsecond',
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
    if (units[index1] == 'ns') {
      value1 = value * ns[index2];
    } else if (units[index1] == 'μs') {
      value1 = value * micro[index2];
    } else if (units[index1] == 'ms') {
      value1 = value * ms[index2];
    } else if (units[index1] == 's') {
      value1 = value * s[index2];
    } else if (units[index1] == 'min') {
      value1 = value * min[index2];
    } else if (units[index1] == 'hr') {
      value1 = value * hr[index2];
    } else if (units[index1] == 'day') {
      value1 = value * day[index2];
    } else if (units[index1] == 'wks') {
      value1 = value * wks[index2];
    } else if (units[index1] == 'mon') {
      value1 = value * mon[index2];
    } else if (units[index1] == 'yr') {
      value1 = value * yr[index2];
    } else if (units[index1] == 'dec') {
      value1 = value * dec[index2];
    } else {
      value1 = value * c[index2];
    }
    print(value1);
    valueToDisplay = value1.toString();
    int indexOfDecimal = valueToDisplay.indexOf('.');
    String decPart = valueToDisplay.substring(
          indexOfDecimal + 1,
        ),
        intPart = valueToDisplay.substring(0, indexOfDecimal);

    if (intPart.length >= 6) {
      if (value1.toStringAsFixed(3).length <= 9) {
        valueToDisplay = valueToDisplay;
      } else {
        valueToDisplay = value1.toStringAsExponential(3);
      }
    } else {
      if (decPart.length >= 3) {
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
                      Icons.thermostat_sharp,
                      color: Colors.black,
                    ),
                    SizedBox(width: 5),
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
                    SizedBox(width: 5),
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
                    SizedBox(width: 5),
                    Text("Length"),
                  ],
                ),
              ),
              PopupMenuItem<int>(
                value: 3,
                child: Row(
                  children: const <Widget>[
                    Icon(
                      Icons.monitor_weight_sharp,
                      color: Colors.black,
                    ),
                    SizedBox(width: 5),
                    Text("Mass"),
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
                  MaterialPageRoute(builder: (context) => const MassApp()));
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
                      enabledBorder: OutlineInputBorder( //<-- SEE HERE
                        borderSide: BorderSide(color: Colors.black, width: 2),
                      ),
                      focusedBorder: OutlineInputBorder( //<-- SEE HERE
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
                    onChanged: (newValue){
                      setState(() {
                        dropDownValue=newValue.toString();
                        if (dropDownValue == dropDownValue1)
                        {
                          int i = list.indexOf(dropDownValue1);
                          if(i==(list.length -1))
                          {
                            dropDownValue1 = list[i-1];
                          }
                          else
                          {
                            dropDownValue1 = list[i+1];
                          }
                        }
                        convert();
                      });
                    },
                  ),
                ),
                const SizedBox(height: 10,),
                const SizedBox(
                  child: Text('To', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                ),
                const SizedBox(height: 10,),
                SizedBox(
                  width: 300,
                  child: DropdownButtonFormField(
                    borderRadius: BorderRadius.circular(15),
                    value: dropDownValue1,
                    isExpanded: true,
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder( //<-- SEE HERE
                        borderSide: BorderSide(color: Colors.black, width: 2),
                      ),
                      focusedBorder: OutlineInputBorder( //<-- SEE HERE
                        borderSide: BorderSide(color: Colors.black, width: 2),
                      ),
                      filled: true,
                      fillColor: Colors.black12,
                    ),
                    items: list.map<DropdownMenuItem<String>>((String tempList) {
                      return DropdownMenuItem<String>(
                        value: tempList,
                        child: Text(
                          tempList,
                        ),
                      );
                    }).toList(),
                    onChanged: (newValue){
                      setState(() {
                        dropDownValue1=newValue.toString();
                        if (dropDownValue1 == dropDownValue)
                        {
                          int i = list.indexOf(dropDownValue);
                          if(i==(list.length -1))
                          {
                            dropDownValue = list[i-1];
                          }
                          else
                          {
                            dropDownValue = list[i+1];
                          }
                        }
                        convert();
                      });
                    },
                  ),
                ),
                const SizedBox(height: 10,),
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
                              borderSide: BorderSide(color: Colors.black, width: 2),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black, width: 2),
                            ),
                            labelStyle: TextStyle(
                                color: Colors.black
                            ),
                            // iconColor: Colors.black,
                            filled: true,
                            fillColor: Colors.black12,
                            prefixIcon: Icon(Icons.alarm, color: Colors.blue),
                            hintText: 'Enter Time',
                            labelText: 'Enter Time',
                          ),
                          keyboardType: const TextInputType.numberWithOptions(decimal: true),
                        ),
                      ),
                    ),
                    const SizedBox(width: 5),
                    SizedBox(
                      height: 64,
                      width: 75,
                      child: OutlinedButton(onPressed: (){
                        setState(() {
                          convert();
                        });
                      },
                        style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.black,
                            foregroundColor: Colors.white
                        ), child: const Text('Convert', ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10,),
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
                        child: Center(child: Text(units[list.indexOf(dropDownValue1)], style:const TextStyle(color: Colors.white))),
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
                            child: Text(valueToDisplay, style: const TextStyle(fontSize: 20)
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 5),
                    SizedBox(
                      height: 64,
                      width: 75,
                      child: OutlinedButton(
                          onPressed: (){
                            Clipboard.setData(ClipboardData(text: value1.toString().replaceAll(RegExp(r"([.]*0+)(?!.*\d)"), "")));
                            const snackBar = SnackBar(elevation:0, backgroundColor: Colors.transparent, duration: Duration(seconds: 1), content: Center(
                                child: Icon(Icons.verified_outlined, color: Color.fromARGB(225, 0, 225, 0), size: 30)));
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          },
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.black,
                            foregroundColor: Colors.white,
                          ),
                          child: const Text("Copy")
                      ),
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
