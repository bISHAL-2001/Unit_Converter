import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'temperature_converter.dart';
import 'pressure_converter.dart';
import 'length_converter.dart';
import 'mass_converter.dart';
import 'time_converter.dart';
class SpeedApp extends StatelessWidget
{
  const SpeedApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Speed',
      theme: ThemeData(textTheme: GoogleFonts.oswaldTextTheme(Theme.of(context).textTheme)),
      home: const HomePage(title: 'Speed'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;
  @override
  State<HomePage>  createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
{
  List<String> list = <String>['Miles Per Hour (MPH)', 'Kilometers Per Hour (KMH)', 'Kilometers Per Minute (KM/Min)', 'Kilometers Per Second (KM/S)', 'Meters Per Second (M/S)', 'Foot Per Second (Ft/S)', 'Knots', ],
      units = <String>['mph', 'km/h', 'km/min', 'km/s', 'm/s', 'ft/s', 'knot'],
      tempUnits = <String>[],
      values = <String>['', '', '', '', '', ''],
      valuesToDisplay = <String>['', '', '', '', '', ''];
  String dropDownValue = 'Miles Per Hour (MPH)';
  late TextEditingController titleController;

  @override
  void initState()
  {
    titleController = TextEditingController();
    assignUnits();
    super.initState();
  }
  @override
  void dispose()
  {
    super.dispose();
    titleController.dispose();
  }
  void assignUnits()
  {
    tempUnits = [];
    for(int i=0; i<units.length; i++)
      {
        if(dropDownValue != list[i])
          {
            tempUnits.add(units[i]);
          }
      }
  }
  void convert() {
      if (dropDownValue == list[0]) {
        values[0] =
            (double.parse(titleController.text) * 1.60934).toStringAsFixed(5);
        values[1] =
            (double.parse(titleController.text) * 0.0268224).toStringAsFixed(5);
        values[2] =
            (double.parse(titleController.text) * 0.000447).toStringAsFixed(5);
        values[3] =
            (double.parse(titleController.text) * 0.44704).toStringAsFixed(5);
        values[4] =
            (double.parse(titleController.text) * 1.46667).toStringAsFixed(5);
        values[5] =
            (double.parse(titleController.text) * 0.86898).toStringAsFixed(5);
      }
      else if (dropDownValue == list[1]) {
        values[0] =
            (double.parse(titleController.text) * 0.62137).toStringAsFixed(5);
        values[1] =
            (double.parse(titleController.text) * 0.0166667).toStringAsFixed(5);
        values[2] =
            (double.parse(titleController.text) * 0.000278).toStringAsFixed(5);
        values[3] =
            (double.parse(titleController.text) * 0.27778).toStringAsFixed(5);
        values[4] =
            (double.parse(titleController.text) * 0.91134).toStringAsFixed(5);
        values[5] =
            (double.parse(titleController.text) * 0.539957).toStringAsFixed(5);
      }
      else if (dropDownValue == list[2]) {
        values[0] =
            (double.parse(titleController.text) * 37.2823).toStringAsFixed(5);
        values[1] = (double.parse(titleController.text) * 60).toStringAsFixed(5);
        values[2] =
            (double.parse(titleController.text) * 0.0166667).toStringAsFixed(5);
        values[3] =
            (double.parse(titleController.text) * 16.6667).toStringAsFixed(5);
        values[4] =
            (double.parse(titleController.text) * 54.6807).toStringAsFixed(5);
        values[5] =
            (double.parse(titleController.text) * 32.3974).toStringAsFixed(5);
      }
      else if (dropDownValue == list[3]) {
        values[0] =
            (double.parse(titleController.text) * 2236.94).toStringAsFixed(5);
        values[1] =
            (double.parse(titleController.text) * 3600).toStringAsFixed(5);
        values[2] = (double.parse(titleController.text) * 60).toStringAsFixed(5);
        values[3] =
            (double.parse(titleController.text) * 1000).toStringAsFixed(5);
        values[4] =
            (double.parse(titleController.text) * 3280.84).toStringAsFixed(5);
        values[5] =
            (double.parse(titleController.text) * 1943.84).toStringAsFixed(5);
      }
      else if (dropDownValue == list[4]) {
        values[0] =
        ((double.parse(titleController.text) * 2.23694).toStringAsFixed(5));
        values[1] =
        ((double.parse(titleController.text) * 3.6).toStringAsFixed(5));
        values[2] =
        ((double.parse(titleController.text) * 0.06).toStringAsFixed(5));
        values[3] =
        ((double.parse(titleController.text) * 0.001).toStringAsFixed(5));
        values[4] =
        ((double.parse(titleController.text) * 3.28084).toStringAsFixed(5));
        values[5] =
        ((double.parse(titleController.text) * 1.943845).toStringAsFixed(5));
      }
      else if (dropDownValue == list[5]) {
        values[0] =
        ((double.parse(titleController.text) * 0.68181819).toStringAsFixed(5));
        values[1] =
        ((double.parse(titleController.text) * 1.09728).toStringAsFixed(5));
        values[2] =
        ((double.parse(titleController.text) * 0.018288).toStringAsFixed(5));
        values[3] =
        ((double.parse(titleController.text) * 0.0003048).toStringAsFixed(5));
        values[4] =
        ((double.parse(titleController.text) * 0.3048).toStringAsFixed(5));
        values[5] =
        ((double.parse(titleController.text) * 0.592484).toStringAsFixed(5));
      }
      else if (dropDownValue == list[6]) {
        values[0] =
            (double.parse(titleController.text) * 0.62137).toStringAsFixed(5);
        values[1] =
            (double.parse(titleController.text) * 0.000278).toStringAsFixed(5);
        values[2] =
            (double.parse(titleController.text) * 0.27778).toStringAsFixed(5);
        values[3] =
            (double.parse(titleController.text) * 0.91134).toStringAsFixed(5);
        values[4] =
            (double.parse(titleController.text) * 0.539957).toStringAsFixed(5);
      }
      for (int i = 0; i < values.length; i++) {
        values[i] = values[i].replaceAll(RegExp(r"([.]*0+)(?!.*\d)"), "");
      }
      for (int i = 0; i < values.length; i++) {
        int indexOfDecimal = values[i].indexOf('.');
        String decPart = values[i].substring(indexOfDecimal + 1,),
            intPart = values[i].substring(0, indexOfDecimal);

        if (intPart.length >= 6) {
          if (values[i].length <= 9) {
            valuesToDisplay[i] = values[i];
          }
          else {
            valuesToDisplay[i] = double.parse(values[i]).toStringAsExponential(3);
          }
        }
        else {
          if (decPart.length >= 5) {
            valuesToDisplay[i] = double.parse(values[i]).toStringAsFixed(4);
          }
          else {
            valuesToDisplay[i] = values[i];
          }
        }
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
            PopupMenuButton(
                itemBuilder: (context){
                  return [
                    PopupMenuItem<int>(
                      value: 0,
                      child: Row(
                        children: const  <Widget>[
                          Icon(Icons.thermostat_rounded, color: Colors.black,),
                          SizedBox(width: 5,),
                          Text("Temperature"),
                        ],
                      ),
                    ),

                    PopupMenuItem<int>(
                      value: 1,
                      child: Row(
                        children: const <Widget>[
                          Icon(Icons.padding, color: Colors.black,),
                          SizedBox(width: 5,),
                          Text("Pressure"),
                        ],
                      ),
                    ),

                    PopupMenuItem<int>(
                      value: 2,
                      child: Row(
                        children: const <Widget>[
                          Icon(Icons.line_axis, color: Colors.black,),
                          SizedBox(width: 5,),
                          Text("Length"),
                        ],
                      ),
                    ),

                    PopupMenuItem<int>(
                      value: 3,
                      child: Row(
                        children: const <Widget>[
                          Icon(Icons.monitor_weight_sharp, color: Colors.black,),
                          SizedBox(width: 5,),
                          Text("Mass"),
                        ],
                      ),                  ),

                    PopupMenuItem<int>(
                      value: 4,
                      child: Row(
                        children: const <Widget>[
                          Icon(Icons.alarm, color: Colors.black,),
                          SizedBox(width: 5),
                          Text("Time"),
                        ],
                      ),                  ),
                  ];
                },
                onSelected:(value) {
                  if (value == 0) {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => const TemperatureApp()));
                  } else if (value == 1) {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => const PressureApp()));
                  } else if (value == 2) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const LengthApp()));
                  } else if (value == 3) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const MassApp()));
                  } else if (value == 4) {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const TimeApp()));
                  }
                }
            ),
          ],
        ),
        body: Center(
          child: SingleChildScrollView(
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
                    onChanged: (newValue) {
                      setState(() {
                        dropDownValue = newValue.toString();
                        assignUnits();
                      });
                      convert();
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
                              borderSide: BorderSide(
                                  color: Colors.black, width: 2),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.black, width: 2),
                            ),
                            labelStyle: TextStyle(
                                color: Colors.black
                            ),
                            iconColor: Colors.black,
                            filled: true,
                            fillColor: Colors.black12,
                            prefixIcon: Icon(
                                Icons.speed, color: Colors.deepOrange),
                            hintText: 'Enter Speed',
                            labelText: 'Enter Speed',
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
                      child: OutlinedButton(onPressed: () {
                        setState(() {
                          convert();
                        });
                      },
                        style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.black,
                            foregroundColor: Colors.white
                        ), child: const Text('Convert',),
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
                        child: Center(child: Text(tempUnits[0],
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
                          child: Text(valuesToDisplay[0],
                              style: const TextStyle(fontSize: 25)
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
                            Clipboard.setData(ClipboardData(text: values[0]));
                            const snackBar = SnackBar(elevation: 0,
                                backgroundColor: Colors.transparent,
                                duration: Duration(seconds: 1),
                                content: Center(
                                    child: Icon(Icons.verified_outlined,
                                        color: Color.fromARGB(225, 0, 225, 0),
                                        size: 30)));
                            ScaffoldMessenger.of(context).showSnackBar(
                                snackBar);
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
                        child: Center(child: Text(tempUnits[1],
                            style: const TextStyle(color: Colors.white))),
                      ),
                    ),
                    Container(
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
                        child: Center(child: Text(valuesToDisplay[1],
                            style: const TextStyle(fontSize: 25))),
                      ),
                    ),
                    const SizedBox(width: 5),
                    SizedBox(
                      height: 64,
                      width: 75,
                      child: OutlinedButton(
                          onPressed: () {
                            Clipboard.setData(ClipboardData(text: values[1]));
                            const snackBar = SnackBar(elevation: 0,
                                backgroundColor: Colors.transparent,
                                duration: Duration(seconds: 1),
                                content: Center(
                                    child: Icon(Icons.verified_outlined,
                                        color: Color.fromARGB(225, 0, 225, 0),
                                        size: 30)));
                            ScaffoldMessenger.of(context).showSnackBar(
                                snackBar);
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
                        child: Center(child: Text(tempUnits[2],
                            style: const TextStyle(color: Colors.white))),
                      ),
                    ),
                    Container(
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
                        child: Center(child: Text(valuesToDisplay[2],
                            style: const TextStyle(fontSize: 25))),
                      ),
                    ),
                    const SizedBox(width: 5),
                    SizedBox(
                      height: 64,
                      width: 75,
                      child: OutlinedButton(
                          onPressed: () {
                            Clipboard.setData(ClipboardData(text: values[2]));
                            const snackBar = SnackBar(elevation: 0,
                                backgroundColor: Colors.transparent,
                                duration: Duration(seconds: 1),
                                content: Center(
                                    child: Icon(Icons.verified_outlined,
                                        color: Color.fromARGB(225, 0, 225, 0),
                                        size: 30)));
                            ScaffoldMessenger.of(context).showSnackBar(
                                snackBar);
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
                        child: Center(child: Text(tempUnits[3],
                            style: const TextStyle(color: Colors.white))),
                      ),
                    ),
                    Container(
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
                        child: Center(child: Text(valuesToDisplay[3],
                            style: const TextStyle(fontSize: 25))),
                      ),
                    ),
                    const SizedBox(width: 5),
                    SizedBox(
                      height: 64,
                      width: 75,
                      child: OutlinedButton(
                          onPressed: () {
                            Clipboard.setData(ClipboardData(text: values[3]));
                            const snackBar = SnackBar(elevation: 0,
                                backgroundColor: Colors.transparent,
                                duration: Duration(seconds: 1),
                                content: Center(
                                    child: Icon(Icons.verified_outlined,
                                        color: Color.fromARGB(225, 0, 225, 0),
                                        size: 30)));
                            ScaffoldMessenger.of(context).showSnackBar(
                                snackBar);
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
                        child: Center(child: Text(tempUnits[4],
                            style: const TextStyle(color: Colors.white))),
                      ),
                    ),
                    Container(
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
                        child: Center(child: Text(valuesToDisplay[4],
                            style: const TextStyle(fontSize: 25))),
                      ),
                    ),
                    const SizedBox(width: 5),
                    SizedBox(
                      height: 64,
                      width: 75,
                      child: OutlinedButton(
                          onPressed: () {
                            Clipboard.setData(ClipboardData(text: values[4]));
                            const snackBar = SnackBar(elevation: 0,
                                backgroundColor: Colors.transparent,
                                duration: Duration(seconds: 1),
                                content: Center(
                                    child: Icon(Icons.verified_outlined,
                                        color: Color.fromARGB(225, 0, 225, 0),
                                        size: 30)));
                            ScaffoldMessenger.of(context).showSnackBar(
                                snackBar);
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
                        child: Center(child: Text(tempUnits[5],
                            style: const TextStyle(color: Colors.white))),
                      ),
                    ),
                    Container(
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
                        child: Center(child: Text(valuesToDisplay[5],
                            style: const TextStyle(fontSize: 25))),
                      ),
                    ),
                    const SizedBox(width: 5),
                    SizedBox(
                      height: 64,
                      width: 75,
                      child: OutlinedButton(
                          onPressed: () {
                            Clipboard.setData(ClipboardData(text: values[5]));
                            const snackBar = SnackBar(elevation: 0,
                                backgroundColor: Colors.transparent,
                                duration: Duration(seconds: 1),
                                content: Center(
                                    child: Icon(Icons.verified_outlined,
                                        color: Color.fromARGB(225, 0, 225, 0),
                                        size: 30)));
                            ScaffoldMessenger.of(context).showSnackBar(
                                snackBar);
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
      );
    }
  }
