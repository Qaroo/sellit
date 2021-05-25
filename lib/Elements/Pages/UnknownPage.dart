import 'package:flutter/material.dart';

class UnknownPage extends StatefulWidget {
  UnknownPage({Key key}) : super(key: key);

  @override
  _UnknownPageState createState() => _UnknownPageState();
}

class _UnknownPageState extends State<UnknownPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromRGBO(250, 250, 250, 1),
        child: Positioned(
          child: Center(
            child: Container(
              height: MediaQuery.of(context).size.height - 100,
              width: MediaQuery.of(context).size.width - 150,
              decoration: BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 1),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                children: [
                  Image.network(
                      "https://miro.medium.com/max/1200/1*9HFCpxhVrnPAlgdrKhOXdg.png",
                      height: MediaQuery.of(context).size.height - 350),
                  Text(
                    "Failed to load page",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color.fromRGBO(241, 88, 111, 1),
                        fontSize: 48,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    height: 20,
                  ),
                  TextButton(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 26, left: 26),
                        child:
                            Text("Back home", style: TextStyle(fontSize: 26)),
                      ),
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              EdgeInsets.all(15)),
                          foregroundColor: MaterialStateProperty.all<Color>(
                              Color.fromRGBO(241, 65, 104, 1)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                side: BorderSide(
                                    color: Color.fromRGBO(241, 65, 104, 1))),
                          )),
                      onPressed: () => null),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
