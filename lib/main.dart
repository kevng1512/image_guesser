import 'package:flutter/cupertino.dart';
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
  double scrollPercent = 0.0;
  double startDragPercentScroll, finishScrollStart, finishScrollEnd;
  Offset startDrag;

  List<Widget> buildCards() {
    List<Widget> cardList = [];

    for (int i = 0; i < imagesName.length; i++) {
      cardList.add(buildOneCard(i, scrollPercent));
    }
    return cardList;
  }

  Widget buildOneCard (int cardIndex, double scrollPercent){
    final cardScrollPercent = scrollPercent / (1 / imagesName.length);
    return FractionalTranslation(
      translation: Offset(cardIndex - cardScrollPercent, 0.0),
      child: Padding(
        padding: EdgeInsets.all(5.0),
        child: ImageReader(imageName: imagesName[cardIndex]),
      ),
    );
  }

  void onHorizontalDragStart(DragStartDetails details) {
    startDrag = details.globalPosition;
    startDragPercentScroll = scrollPercent;
  }

  onHorizontalDragUpdate(DragUpdateDetails details) {
    final currentDrag = details.globalPosition;
    final dragDistance = currentDrag.dx - startDrag.dx;
    final singleCardDragPercent = dragDistance / context.size.width;

    setState(() {
      scrollPercent = (startDragPercentScroll + (-singleCardDragPercent) / imagesName.length)
        .clamp(0.0, 1.0 - (1 / imagesName.length));
    });
  }

  onHorizontalDragEnd (DragEndDetails details) {
    finishScrollStart = scrollPercent;
    finishScrollEnd = (scrollPercent * imagesName.length).round() / imagesName.length;

    setState(() {
      startDrag = null;
      startDragPercentScroll = null;
      currentImageName = "";
    });
  }

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
            GestureDetector(
              onHorizontalDragStart: onHorizontalDragStart,
              onHorizontalDragUpdate: onHorizontalDragUpdate,
              onHorizontalDragEnd: onHorizontalDragEnd,
              behavior: HitTestBehavior.translucent,
              child: Stack(
                children: buildCards(),
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
