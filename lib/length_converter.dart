import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'temperature_converter.dart';
import 'pressure_converter.dart';
import 'mass_converter.dart';
import 'time_converter.dart';
import 'speed_converter.dart';

class LengthApp extends StatelessWidget
{
  const LengthApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Length',
      theme: ThemeData(textTheme: GoogleFonts.oswaldTextTheme(Theme.of(context).textTheme)),
      home: const HomePage(title: 'Length'),
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
  List<String> list = <String>['Nautical Mile', 'Mile', 'Kilometer', 'Meter', 'Centimeter', 'Millimeter', 'Micrometer', 'Nanometer', 'Yard', 'Foot', 'Inch'],
      units = <String>['nmi', 'mi', 'km', 'm', 'cm', 'mm', 'μm', 'nm', 'yd', 'ft', 'in'];

  List<double> nmi = <double>[1, 1.15078, 1.825, 1.825*pow(10, 3), 1.825*pow(10, 5), 1.825*pow(10, 6), 1.825*pow(10, 9), 1.825*pow(10, 12), 2025.37, 6076.12, 72913.4];
  List<double>  mi = <double>[0.86898, 1, 1.609344, 1.609344*pow(10, 3), 1.609344*pow(10, 5), 1.609344*pow(10, 6), 1.609344*pow(10, 9), 1.609344*pow(10, 12), 1760, 5280, 63360];
  List<double>  km = <double>[0.539957, 0.621371, 1, 1.0*pow(10, 3), 1.0*pow(10, 5), 1.0*pow(10, 6), 1.0*pow(10, 9),1.0*pow(10, 12), 1093.61, 3281, 39370.1];
  List<double>   m = <double>[0.000539957, 0.000621371, 1.0*pow(10, -3), 1, 1.0*pow(10, 2), 1.0*pow(10, 3), 1.0*pow(10, 6), 1.0*pow(10, 9), 1.0936133, 3.28084, 39.3701];
  List<double>  cm = <double>[5.3996*pow(10, -6), 6.2137*pow(10, -6), 1.0*pow(10, -5), 0.01, 10, 10000, 1.0*pow(10, 7), 0.010936134, 0.0328084, 0.393701];
  List<double>  mm = <double>[5.3996*pow(10, -7), 6.2137*pow(10, -7), 1.0*pow(10, -6), 1.0*pow(10, -3), 0.1, 1000, 1.0*pow(10, 6), 0.00109361, 0.00328084, 0.0393701];
  List<double> micro = <double>[5.3996*pow(10, -10), 6.2137*pow(10, -10), 1.0*pow(10, -9), 1.0*pow(10, -6), 1.0*pow(10, -4), 1.0*pow(10, -3), 1, 1000, 1.0936*pow(10, -6), 3.2808*pow(10, -6), 3.937*pow(10, -5)];
  List<double>  nm = <double>[5.3996*pow(10, -13), 6.2137*pow(10, -13), 1.0*pow(10, -12), 1.0*pow(10, -9), 1.0*pow(10, -7), 1.0*pow(10, -6), 1.0*pow(10, -3), 1.0936*pow(10, -9), 3.2808*pow(10, -9), 3.937*pow(10, -8)];
  List<double>  yd = <double>[0.000493737, 0.000568182, 0.0009144, 0.9144, 91.44, 914.4, 914400, 9.144*pow(10, 8), 1, 3, 36];
  List<double>  ft = <double>[0.000164579, 0.000189394, 0.0003048, 0.3048, 30.48, 304.8, 304800, 304800000, 0.333333, 1, 12];
  List<double> inch = <double>[1.3715*pow(10, -5), 1.5783*pow(10, -5), 2.54*pow(10, -5), 0.0254, 2.54, 25.4, 25400, 2.54*pow(10, 7) ,0.0277778, 0.0833333, 1];

  String dropDownValue = 'Nautical Mile', dropDownValue1 = 'Mile', valueToDisplay = "";
  double value1 = 0.0;
  late TextEditingController titleController;

  @override
  void initState()
  {
    titleController = TextEditingController();
    super.initState();
  }

  @override
  void dispose()
  {
    super.dispose();
    titleController.dispose();
  }

  void convert()
  {
    int index1 = list.indexOf(dropDownValue);
    int index2 = list.indexOf(dropDownValue1);

    double value = double.parse(titleController.text.toString());
    if(units[index1] == 'nmi')
      {
        value1 = value*nmi[index2];
      }
    else if(units[index1] == 'mi')
    {
      value1 = value*mi[index2];
    }
    else if(units[index1] == 'km')
    {
      value1 = value*km[index2];
    }
    else if(units[index1] == 'm')
    {
      value1 = value*m[index2];
    }
    else if(units[index1] == 'cm')
    {
      value1 = value*cm[index2];
    }
    else if(units[index1] == 'mm')
    {
      value1 = value*mm[index2];
    }
    else if(units[index1] == 'μm')
    {
      value1 = value*micro[index2];
    }
    else if(units[index1] == 'nm')
    {
      value1 = value*nm[index2];
    }
    else if(units[index1] == 'yd')
    {
      value1 = value*yd[index2];
    }
    else if(units[index1] == 'ft')
    {
      value1 = value*ft[index2];
    }
    else
      {
        value1 = value*inch[index2];
      }
    valueToDisplay = value1.toString();
    int indexOfDecimal = valueToDisplay.indexOf('.');
    String decPart = valueToDisplay.substring(indexOfDecimal+1, ), intPart = valueToDisplay.substring(0,indexOfDecimal);

    if(intPart.length >= 6)
      {
        if(value1.toStringAsFixed(3).length <=9)
          {
            valueToDisplay = valueToDisplay;
          }
        else
          {
            valueToDisplay = value1.toStringAsExponential(3);
          }
      }
    else
      {
        if(decPart.length >= 5)
          {
            valueToDisplay = value1.toStringAsFixed(4);
          }
        else
        {
          valueToDisplay = value1.toStringAsFixed(4);
        }
      }
    if(!valueToDisplay.contains('e'))
      {
        valueToDisplay = valueToDisplay.replaceAll(RegExp(r"([.]*0+)(?!.*\d)"), "");
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
                      builder: (context) => const PressureApp()));
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
                            prefixIcon: Icon(Icons.line_axis, color: Colors.green),
                            hintText: 'Enter Length',
                            labelText: 'Enter Length',
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
                            Clipboard.setData(ClipboardData(text: value1.toStringAsFixed(5).replaceAll(RegExp(r"([.]*0+)(?!.*\d)"), "")));
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