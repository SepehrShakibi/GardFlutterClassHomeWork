import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String currentYear = "--";
  String currentMonth = "--";
  String currentDate = "--";

  String testtext = "sss";
  DateTime birthdayDate = DateTime.now();
  Expanded dateCard(String title, String Value) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(0.5),
        child: Card(
          child: ListTile(
            title: Center(
                child: Text(
              title,
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.lightGreen.shade900,
                  fontFamily: 'BebasNeue'),
            )),
            subtitle: Center(
                child: Text(
              Value,
              style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'SourceSansProB',
                  color: Colors.grey[700]),
            )),
          ),
        ),
      ),
    );
  }

  Future<void> _showDatepicker() async {
    final DateTime? birthdayDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1970),
        lastDate: DateTime.now(),
        builder: (BuildContext context, Widget? child) {
          return Theme(
              data: ThemeData(
                  colorScheme: ColorScheme.light(
                primary: Color.fromRGBO(19, 42, 19, 1),
              )),
              child: child ?? Text(""));
        });
    if (birthdayDate != null)
      setState(() {
        currentYear = birthdayDate.toString().substring(0, 4);
        currentMonth = birthdayDate.toString().substring(5, 7);
        currentDate = birthdayDate.toString().substring(8, 10);
        testtext = birthdayDate.hour.toString();
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(49, 87, 44, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(19, 42, 19, 1),
        title: Text(
          "Age Caluclator",
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Icon(
                Icons.contact_support_outlined,
                size: 150,
                color: Color.fromRGBO(236, 243, 158, 1),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50, bottom: 30),
              child: Card(
                color: Color.fromRGBO(79, 119, 45, 1),
                child: MaterialButton(
                  onPressed: () {
                    _showDatepicker();
                  },
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Select Your Birthday",
                        style: TextStyle(
                            fontSize: 25,
                            fontFamily: 'CharisSIL',
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              child: Row(
                children: [
                  dateCard("Year", currentYear),
                  dateCard("Month", currentMonth),
                  dateCard("Date", currentDate)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
