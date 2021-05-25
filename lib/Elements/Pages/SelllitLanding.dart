import 'package:flutter/material.dart';
import 'package:pentagonselllit/RowTypes/RowImageModel.dart';
import 'package:pentagonselllit/RowTypes/RowImagesRow.dart';
import 'package:pentagonselllit/RowTypes/RowSpaceModel.dart';
import 'package:pentagonselllit/RowTypes/RowTextModel.dart';

class LandingPage extends StatefulWidget {
  LandingPage({Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _LandingPageState();
  }
}

class _LandingPageState extends State<LandingPage> {
  ScrollController _controller;

  @override
  void initState() {
    //Initialize the  scrollController
    _controller = ScrollController();
    super.initState();
  }

  void scrollCallBack(DragUpdateDetails dragUpdate) {
    setState(() {
      // Note: 3.5 represents the theoretical height of all my scrollable content. This number will vary for you.
      _controller.position.moveTo(dragUpdate.globalPosition.dy * 3.5);
    });
  }

  @override
  Widget build(BuildContext context) {
    Map<String, Map<String, dynamic>> texts1 =
        new Map<String, Map<String, dynamic>>();

    rowSpaceModel rsm1 = new rowSpaceModel(height: 50, width: 50);
    rowImagesRow ri = new rowImagesRow(
        height: 400,
        images: [
          "https://image-cdn.hypb.st/https%3A%2F%2Fhypebeast.com%2Fimage%2F2018%2F09%2Foff-white-ssense-exclusive-mona-lisa-hoodie-001.jpg?quality=95&w=1170&cbr=1&q=90&fit=max",
          "https://i.mdel.net/i/db/2018/6/926344/926344-800w.jpg",
          "https://mediaslide-europe.storage.googleapis.com/brooks/pictures/218/2629/large-1516211778-ea8294fdf4d61661477de42fe6a0f440.jpg"
        ],
        radius: 40);
    texts1["hello world"] = {"fontSize": 36, "padding": "-1,-1,20,20"};

    Map<String, Map<String, dynamic>> texts2 =
        new Map<String, Map<String, dynamic>>();
    texts2["Today we gonna show you"] = {
      "fontSize": 36,
      "padding": "20,20,-1,-1"
    };

    RowTextModel t1 = new RowTextModel(
        text: "Check",
        fontSize: 26,
        style: "bold",
        align: "center",
        padding: "0,30,0,30",
        textColor: "0,0,0,0.9");
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            child: SingleChildScrollView(
              //Assign the controller to my scrollable widget
              controller: _controller,
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,
                    child: Column(
                      children: [
                        Container(
                          height: 40,
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              MediaQuery.of(context).size.width * 0.15,
                              10,
                              MediaQuery.of(context).size.width * 0.15,
                              10),
                          child: Text(
                            "בנה את האתר\n שלך דרך הטלפון",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: MediaQuery.of(context).size.width / 15,
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              MediaQuery.of(context).size.width * 0.25,
                              0,
                              MediaQuery.of(context).size.width * 0.25,
                              0),
                          child: Text(
                              "באמצעות הפלטפורמה הייחודית והחדשנית שלנו, כל אחד יכול לבנות לעצמו אתר אינטרנט מסחרי\n בכל מקום, בכל זמן",
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width / 15 / 3,
                                color: Colors.grey[700],
                              ),
                              textAlign: TextAlign.center),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                          child: RaisedButton(
                            textColor: Colors.white,
                            color: Colors.red[400],
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  right: 16, left: 16, bottom: 10, top: 10),
                              child: Text("וואלה, מעניין",
                                  style: TextStyle(fontSize: 24)),
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, "/selllit");
                            },
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Image.network(
                            "https://i.ibb.co/6P2Yg4M/Main.jpg",
                            height: 800,
                          ),
                        ),
                        /*m1.toWidget(context),
                        m2.toWidget(context),
                        m3.toWidget(context),
                        t1.toWidget(),
                        ri.toWidget(context),
                        rsm1.toWidget(),*/
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
