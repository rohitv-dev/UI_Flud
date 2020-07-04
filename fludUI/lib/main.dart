import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex;

  @override
  void initState() {
    _selectedIndex = 0;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    Widget sliderRow(String title,int index) {
      return Padding(
        padding: const EdgeInsets.only(top: 15),
        child: GestureDetector(
          child: AnimatedContainer(
              duration: Duration(milliseconds: 500),
              curve: Curves.easeIn,
              child: Column(
                children: <Widget>[
                  Text(title, style: TextStyle(color: _selectedIndex == index ? Colors.white : Colors.grey[100], fontSize: 15)),
                  Expanded(child: Container()),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 1.0),
                    child: _selectedIndex == index ? Container(
                        width: MediaQuery.of(context).size.width / 3, height: 3,
                        color: Colors.yellow
                    ) : Container(
                      width: MediaQuery.of(context).size.width / 3, height: 3,
                    ),
                  )
                ],
              )
          ),
          onTap: () {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
      );
    }

    Widget selectPage() {
      switch(_selectedIndex) {
        case 0:
          return Center(child: Text('ALL'));
          break;
        case 1:
          return Center(child: Text('QUEUED'));
          break;
        case 2:
          return Center(child: Text('FINISHED'));
          break;
      }
      return Container();
    }

    return SafeArea(
      child: Scaffold(
          body: Column(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 1/18,
                color: Colors.lightBlue,
                child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 16, top: 10),
                        child: Text('Flud', style: TextStyle(fontSize: 21, color: Colors.white, fontWeight: FontWeight.w600)),
                      ),
                      Expanded(child: Container()),
                      Padding(
                        padding: const EdgeInsets.only(right: 16, top: 10),
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.search, color: Colors.white, size: 26),
                            SizedBox(width: 10),
                            Icon(Icons.list, color: Colors.white, size: 26),
                            SizedBox(width: 10),
                            Icon(Icons.settings, color: Colors.white, size: 26),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
                ),
              ),
              Container(
                  height: MediaQuery.of(context).size.height * 1/14,
                  color: Colors.lightBlue,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      sliderRow('ALL', 0),
                      sliderRow('QUEUED', 1),
                      sliderRow('FINISHED', 2)
                    ],
                  )
              ),
              Container(
                child: selectPage()
              )
            ],
          )),
    );
  }
}