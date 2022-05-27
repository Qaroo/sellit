import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget AssosBottomBar(BuildContext context) {
  if (MediaQuery.of(context).size.width < MediaQuery.of(context).size.height) {
    return Container(
      color: Color.fromRGBO(245, 245, 245, 1),
      height: MediaQuery.of(context).size.height * 0.4,
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.4 - 80,
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Column(
                    children: [
                      Container(
                        height: 20,
                      ),
                      Text(
                        "Need help?",
                        style: GoogleFonts.almarai(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        height: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "Search",
                              style: GoogleFonts.almarai(
                                  fontSize: 18, color: Colors.black),
                            ),
                          ),
                          Container(width: 10),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "FAQ",
                              style: GoogleFonts.almarai(
                                  fontSize: 18, color: Colors.black),
                            ),
                          ),
                          Container(width: 10),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "Contact us",
                              style: GoogleFonts.almarai(
                                  fontSize: 18, color: Colors.black),
                            ),
                          ),
                          Container(width: 10),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "Terms",
                              style: GoogleFonts.almarai(
                                  fontSize: 18, color: Colors.black),
                            ),
                          ),
                          Container(width: 10),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Column(
                    children: [
                      Container(
                        height: 20,
                      ),
                      Text(
                        "Our Brands",
                        style: GoogleFonts.almarai(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        height: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "off white",
                            style: GoogleFonts.almarai(
                                fontSize: 18, color: Colors.black),
                          ),
                          Container(width: 10),
                          Text(
                            "Palm Angles",
                            style: GoogleFonts.almarai(
                                fontSize: 18, color: Colors.black),
                          ),
                          Container(width: 10),
                          Text(
                            "Fear of god",
                            style: GoogleFonts.almarai(
                                fontSize: 18, color: Colors.black),
                          ),
                          Container(width: 10),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 0.5,
            width: MediaQuery.of(context).size.width,
            color: Colors.grey,
          ),
          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 3,
                height: MediaQuery.of(context).size.height * 0.4 - 250,
                child: Center(
                    child: Container(
                  height: 40,
                )),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 3,
              ),
              Container(
                width: MediaQuery.of(context).size.width / 3,
                height: MediaQuery.of(context).size.height * 0.4 - 250,
                child: Center(
                  child: TextButton(
                    onPressed: () {},
                    child: Text("All terms save to sellit",
                        style: GoogleFonts.anaheim(
                            fontSize: 16, color: Colors.black)),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
  return Container(
    color: Color.fromRGBO(245, 245, 245, 1),
    height: MediaQuery.of(context).size.height * 0.4,
    child: Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.4 - 80,
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 2,
                child: Column(
                  children: [
                    Container(
                      height: 20,
                    ),
                    Text(
                      "Need help?",
                      style: GoogleFonts.almarai(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Search",
                            style: GoogleFonts.almarai(
                                fontSize: 18, color: Colors.black),
                          ),
                        ),
                        Container(width: 10),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "FAQ",
                            style: GoogleFonts.almarai(
                                fontSize: 18, color: Colors.black),
                          ),
                        ),
                        Container(width: 10),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Contact us",
                            style: GoogleFonts.almarai(
                                fontSize: 18, color: Colors.black),
                          ),
                        ),
                        Container(width: 10),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Terms",
                            style: GoogleFonts.almarai(
                                fontSize: 18, color: Colors.black),
                          ),
                        ),
                        Container(width: 10),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 2,
                child: Column(
                  children: [
                    Container(
                      height: 20,
                    ),
                    Text(
                      "Our Brands",
                      style: GoogleFonts.almarai(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "off white",
                          style: GoogleFonts.almarai(
                              fontSize: 18, color: Colors.black),
                        ),
                        Container(width: 10),
                        Text(
                          "Palm Angles",
                          style: GoogleFonts.almarai(
                              fontSize: 18, color: Colors.black),
                        ),
                        Container(width: 10),
                        Text(
                          "Fear of god",
                          style: GoogleFonts.almarai(
                              fontSize: 18, color: Colors.black),
                        ),
                        Container(width: 10),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 0.5,
          width: MediaQuery.of(context).size.width,
          color: Colors.grey,
        ),
        Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 3,
              height: MediaQuery.of(context).size.height * 0.4 - 250,
              child: Center(
                  child: Container(
                height: 40,
              )),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 3,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 3,
              height: MediaQuery.of(context).size.height * 0.4 - 250,
              child: Center(
                child: TextButton(
                  onPressed: () {},
                  child: Text("All terms save to sellit",
                      style: GoogleFonts.anaheim(
                          fontSize: 16, color: Colors.black)),
                ),
              ),
            ),
          ],
        )
      ],
    ),
  );
}
