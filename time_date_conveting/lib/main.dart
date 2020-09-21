import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  _timeDateConvertToMili createState() => _timeDateConvertToMili();
}

class _timeDateConvertToMili extends State<MyApp>{

  final format = DateFormat("dd-MM-yyyy HH:mm");
  final initialValue = DateTime.now();

  bool autoValidate = false;
  bool showResetIcon = true;
  DateTime value = DateTime.now();


  TextEditingController _startTimeController = TextEditingController();
  TextEditingController _endTimeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          child: Column(
            children: [
              SizedBox(height: 50,),
              Container(
                padding: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                    border: Border(
                      // bottom: BorderSide(color: Colors.grey[100])
                    )),
                child: DateTimeField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Start Time',
                    labelStyle: TextStyle(color: Colors.black),
                  ),
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  controller: _startTimeController,
                  format: format,
                  onShowPicker: (context, currentValue) async {
                    final date = await showDatePicker(
                        context: context,
                        firstDate: DateTime(2000),
                        initialDate: currentValue ?? DateTime.now(),
                        lastDate: DateTime(2100));
                    if (date != null) {
                      final time = await showTimePicker(
                        context: context,
                        initialTime:
                        TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
                      );
                      return DateTimeField.combine(date, time);
                    } else {
                      return currentValue;
                    }
                  },
                  resetIcon: showResetIcon ? Icon(Icons.delete) : null,
                ),
              ),
              Container(
                padding: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                    border: Border(
                      // bottom: BorderSide(color: Colors.grey[100])
                    )),
                child: DateTimeField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'End Time',
                    labelStyle: TextStyle(color: Colors.black),
                  ),
                  style: TextStyle(
                    color: Colors.black,
                  ),

                  controller: _endTimeController,
                  format: format,
                  onShowPicker: (context, currentValue) async {
                    final date = await showDatePicker(
                        context: context,
                        firstDate: DateTime(2000),
                        initialDate: currentValue ?? DateTime.now(),
                        lastDate: DateTime(2100));
                    if (date != null) {
                      final time = await showTimePicker(
                        context: context,
                        initialTime:
                        TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
                      );
                      return DateTimeField.combine(date, time);
                    } else {
                      return currentValue;
                    }
                  },
                  resetIcon: showResetIcon ? Icon(Icons.delete) : null,
                ),
              ),
              Container(
                child: RaisedButton(
                  onPressed: () { 
                    convertNow();
                  },
                  child: Text('Convert to Epoch'),
                ),
              ),
              
              Container(
                child: Text('Result is :'

                ),
              ),
            ],
          ),

        ),
      ),

    );
  }

  void convertNow() {
    print ('inputted time is : $_startTimeController');
    //var unix = DateTime.parse(_startTimeController.toString()).millisecondsSinceEpoch / 1000;

  }


}
