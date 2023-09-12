import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'temperature_converter.dart';
import 'length_converter.dart';
import 'mass_converter.dart';
import 'time_converter.dart';
import 'speed_converter.dart';

class PressureApp extends StatelessWidget
{
  const PressureApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pressure',
      theme: ThemeData(textTheme: GoogleFonts.oswaldTextTheme(Theme.of(context).textTheme)),
      home: const HomePage(title: 'Pressure'),
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
  List<String> list = <String>['Bar', 'Pascal', 'Torr', 'Standard Atmosphere'];
  String dropDownValue = 'Bar', unit1 = "", unit2="", unit3="", value1 = "", value2 = "", value3 = "";
  double bar = 0.0, pascal = 0.0, torr = 0.0, stanAtm = 0.0;
  late TextEditingController titleController;

  @override
  void initState()
  {
    titleController = TextEditingController();
    unit();
    super.initState();
  }
  @override
  void dispose()
  {
    super.dispose();
    titleController.dispose();
  }

  void unit()
  {
    if(dropDownValue == list[0])
    {
      unit1 = list[1].substring(0, 2);
      unit2 = list[2];
      unit3 =  'atm';
    }
    else if(dropDownValue == list[1])
    {
      unit1 = list[0];
      unit2 = list[2];
      unit3 = 'atm';
    }
    else if(dropDownValue == list[2])
    {
      unit1 = list[0];
      unit2 = list[1].substring(0, 2);
      unit3 = 'atm';
    }
    else if(dropDownValue == list[3])
    {
      unit1 = list[0];
      unit2 = list[1].substring(0, 2);
      unit3 = list[2];
    }
  }
  void convert()
  {
    if(dropDownValue == list[0]) {
      pascal = double.parse(titleController.text.toString())*100000;
      torr = double.parse(titleController.text.toString())*750.062;
      stanAtm = double.parse(titleController.text.toString())*0.986;
      value1 = pascal.toStringAsFixed(7);
      value2 = torr.toStringAsFixed(7);
      value3 = stanAtm.toStringAsFixed(7);
    }
    else if (dropDownValue == list[1])
    {
      bar = double.parse(titleController.text.toString())/100000;
      torr = double.parse(titleController.text.toString())/133.3;
      stanAtm = double.parse(titleController.text.toString())/101300;
      value1 = bar.toStringAsFixed(7);
      value2 = torr.toStringAsFixed(7);
      value3 = stanAtm.toStringAsFixed(7);
    }
    else if(dropDownValue == list[2])
    {
      bar = double.parse(titleController.text.toString())/750.1;
      pascal = double.parse(titleController.text.toString())*133.3;
      stanAtm = double.parse(titleController.text.toString())/760;
      value1 = bar.toStringAsFixed(7);
      value2 = pascal.toStringAsFixed(7);
      value3 = stanAtm.toStringAsFixed(7);
    }
    else if(dropDownValue == list[3])
    {
      bar = double.parse(titleController.text.toString())*1.013;
      pascal = double.parse(titleController.text.toString())*101300;
      torr = double.parse(titleController.text.toString())*760;
      value1 = bar.toStringAsFixed(7);
      value2 = pascal.toStringAsFixed(7);
      value3 = torr.toStringAsFixed(7);
    }
    value1 = value1.replaceAll(RegExp(r"([.]*0+)(?!.*\d)"), "");
    value2 = value2.replaceAll(RegExp(r"([.]*0+)(?!.*\d)"), "");
    value3 = value3.replaceAll(RegExp(r"([.]*0+)(?!.*\d)"), "");
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
                      children: const <Widget>[
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
                        Icon(Icons.line_axis, color: Colors.black,),
                        SizedBox(width: 5,),
                        Text("Length"),
                      ],
                    ),
                  ),

                  PopupMenuItem<int>(
                    value: 2,
                    child: Row(
                      children: const <Widget>[
                        Icon(Icons.monitor_weight_sharp, color: Colors.black,),
                        SizedBox(width: 5,),
                        Text("Mass"),
                      ],
                    ),
                  ),

                  PopupMenuItem<int>(
                    value: 3,
                    child: Row(
                      children: const <Widget>[
                        Icon(Icons.alarm, color: Colors.black,),
                        SizedBox(width: 5,),
                        Text("Time"),
                      ],
                    ),                  ),

                  PopupMenuItem<int>(
                    value: 4,
                    child: Row(
                      children: const <Widget>[
                        Icon(Icons.speed, color: Colors.black,),
                        SizedBox(width: 5),
                        Text("Speed"),
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
                      builder: (context) => const LengthApp()));
                } else if (value == 2) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const MassApp()));
                } else if (value == 3) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const TimeApp()));
                } else if (value == 4) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const SpeedApp()));
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
                  onChanged: (newValue){
                    setState(() {
                      dropDownValue=newValue.toString();
                      unit();
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
                          prefixIcon: Icon(Icons.padding_rounded, color: Colors.blueGrey),
                          hintText: 'Enter Pressure',
                          labelText: 'Enter Pressure',
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
                      child: Center(child: Text(unit1, style:const TextStyle(color: Colors.white))),
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
                        child: Text(value1,style: const TextStyle(fontSize: 20)
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
                          Clipboard.setData(ClipboardData(text: value1));
                          const snackBar = SnackBar(elevation:0, backgroundColor: Colors.white, duration: Duration(seconds: 1), content: Center(
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
                      child: Center(child: Text(unit2, style:const TextStyle(color: Colors.white))),
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
                      child: Center(child: Text(value2, style: const TextStyle(fontSize: 20))),
                    ),
                  ),
                  const SizedBox(width: 5),
                  SizedBox(
                    height: 64,
                    width: 75,
                    child: OutlinedButton(
                        onPressed: (){
                          Clipboard.setData(ClipboardData(text: value2));
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
                      child: Center(child: Text(unit3, style:const TextStyle(color: Colors.white, ))),
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
                      child: Center(child: Text(value3, style: const TextStyle(fontSize: 20))),
                    ),
                  ),
                  const SizedBox(width: 5),
                  SizedBox(
                    height: 64,
                    width: 75,
                    child: OutlinedButton(
                        onPressed: (){
                          Clipboard.setData(ClipboardData(text: value3));
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
    );
  }
}