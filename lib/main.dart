import 'package:flutter/material.dart';
import 'image_reader.dart';

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
  List<String> imagesName = [
    'butterfly',
    'cheetahs',
    'chicken',
    'cow',
    'deer',
    'dog',
    'flamingo',
    'fox',
    'giraffe',
    'goat',
    'hamster',
    'jellyfish',
    'lion',
    'owl',
    'panda',
    'parrot',
    'peafowl',
    'rabbit',
    'raccoon',
    'rhinoceros',
    'shark',
    'squirrel',
    'tiger',
    'turtle',
    'whale',
  ];
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
            ImageReader(imageName: imagesName[0]),
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
