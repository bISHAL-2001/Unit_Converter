import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unit_converter_using_flutter/length_converter.dart';
import 'package:unit_converter_using_flutter/mass_converter.dart';
import 'package:unit_converter_using_flutter/speed_converter.dart';
import 'package:unit_converter_using_flutter/time_converter.dart';
import 'pressure_converter.dart';

class TemperatureApp extends StatelessWidget
{
  const TemperatureApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Temperature',
      theme: ThemeData(textTheme: GoogleFonts.oswaldTextTheme(Theme.of(context).textTheme)),
      home: const HomePage(title: 'Temperature'),
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

  List<String> list = <String>['Celsius', 'Kelvin', 'Fahrenheit'];

  String dropDownValue = 'Celsius', unit1 = "", unit2="", value1 = "", value2 = "";
  double cValue = 0.0, fValue = 0.0, kValue = 0.0;
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
      unit1 = 'F';
      unit2 = 'K';
    }
    else if(dropDownValue == list[1])
    {
      unit1 = 'C';
      unit2 = 'F';
    }
    else if(dropDownValue == list[2])
    {
      unit1 = 'C';
      unit2 = 'K';
    }
  }
  void convert()
  {
    if(dropDownValue == list[0]) {
      fValue = double.parse(titleController.text.toString());
      fValue = (fValue*9)/5 + 32;
      kValue = double.parse(titleController.text.toString()) + 273.15;
      value1 = fValue.toStringAsFixed(4);
      value2 = kValue.toStringAsFixed(4);
    }
    else if (dropDownValue == list[1])
      {
        cValue = double.parse(titleController.text.toString()) - 273.15;
        fValue = (cValue * 9)/5 + 32;
        value1 = cValue.toStringAsFixed(4);
        value2 = fValue.toStringAsFixed(4);
      }
    else if(dropDownValue == list[2])
      {
        cValue = double.parse(titleController.text.toString());
        cValue = ((cValue - 32) * 5)/9;
        kValue = cValue + 273.15;
        value1 = cValue.toStringAsFixed(4);
        value2 = kValue.toStringAsFixed(4);
      }
    value1 = value1.replaceAll(RegExp(r"([.]*0+)(?!.*\d)"), "");
    value2 = value2.replaceAll(RegExp(r"([.]*0+)(?!.*\d)"), "");
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
                        Icon(Icons.padding, color: Colors.black,),
                        SizedBox(width: 5,),
                        Text("Pressure"),
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
                      builder: (context) => const PressureApp()));
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
                          iconColor: Colors.black,
                          filled: true,
                          fillColor: Colors.black12,
                          prefixIcon: Icon(Icons.thermostat, color: Colors.red,),
                          hintText: 'Enter temperature',
                          labelText: 'Enter Temperature',
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
                      child: Center(child: Text('°$unit1', style:const TextStyle(color: Colors.white, fontSize: 30))),
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
                        child: Text(value1,style: const TextStyle(fontSize: 30)
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
                      child: Center(child: Text('°$unit2', style:const TextStyle(color: Colors.white, fontSize: 30))),
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
                      child: Center(child: Text(value2, style: const TextStyle(fontSize: 30))),
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
            ],
          ),
        ),
      ),
    );
  }
}