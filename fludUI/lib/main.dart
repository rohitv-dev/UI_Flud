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
          child: Container(
              child: Column(
                children: <Widget>[
                  Text(title, style: TextStyle(color: _selectedIndex == index ? Colors.white : Colors.grey[100], fontSize: 15, fontWeight: FontWeight.w600)),
                  Expanded(child: Container()),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 1.0),
                    child: _selectedIndex == index ? Container(
                        width: MediaQuery.of(context).size.width / 3, height: 3,
                        color: Colors.yellow
                    ) : Container(
                      width: MediaQuery.of(context).size.width / 3, height: 3,
                    ),
                  ),
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
          return Container(
            child: listView()
          );
          break;
        case 1:
          return Container(
              child: listView()
          );
          break;
        case 2:
          return Container(
              child: listView()
          );
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

Widget listView() {
  List<String> torrentTitle = ['The Truman Show (1998) 1080p', 'The Man from Nowhere [2010]', 'The Theory of Everything (2014)'];
  List<String> progress = ['1.2 GB/1.6 GB', '823 MB/1.8GB', '1.5 GB/1.5GB'];
  List<String> status = ['In Progress: 75%', 'In Progress: 45%', 'In Progress: 99%'];
  List<double> value = [0.75, 0.45, 0.99];
  return ListView.builder(
    shrinkWrap: true,
    itemCount: progress.length,
    itemBuilder: (context, index) {
      return Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          children: <Widget>[
            SizedBox(height: 10),
            Row(
              children: <Widget>[
                Icon(Icons.play_circle_filled, color: Colors.lightBlue, size: 70),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(torrentTitle[index], style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16)),
                      SizedBox(height: 7),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.4,
                        child: LinearProgressIndicator(value: value[index]),
                      ),
                      SizedBox(height: 7),
                      Text(status[index], style: TextStyle(color: Colors.grey[600], fontWeight: FontWeight.w400)),
                      SizedBox(height: 7),
                      Text(progress[index], style: TextStyle(fontWeight: FontWeight.w400))
                    ],
                  ),
                )
              ],
            ),
            Divider(indent: 20, endIndent: 20, color: Colors.grey[400], thickness: 1)
          ],
        ),
      );
    },
  );
}