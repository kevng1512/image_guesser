import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        //visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String currentImageName = "nameOfImage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(2, 3, 2, 0),
              child: Container(
                height: 450,
                color: Color.fromARGB(100, 224, 202, 207),
              ),
            ),
            OutlineButton(
              onPressed: () => {},
              padding: EdgeInsets.all(7),
              child: Text(
                "Show Answer",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              borderSide: BorderSide(
                color: Colors.black,
                width: 2.0,
              ),
              highlightedBorderColor: Colors.amber,
              splashColor: Colors.amber,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14.0),
              ),
            ),
            Text(
              currentImageName,
              style: TextStyle(
                fontSize: 38,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0,
                color: Colors.amber,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
