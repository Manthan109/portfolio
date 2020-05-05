import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'dart:async';
import 'package:auto_size_text/auto_size_text.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<void> _launched;
  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final dev_height =
        MediaQuery.of(context).size.height; //height of device screen
    final dev_width = MediaQuery.of(context).size.width;
    final Email email = Email(
      body: 'We Love Your Profile! Contact us',
      subject: 'Hiring',
      recipients: ['manthangupta109@gmail.com'],
      isHTML: true,
    );
    const String resume =
        "https://drive.google.com/open?id=1mXPHcuns0BICqbEMlNw_WOjAV4gakT3c";
    const String linkedin = "https://www.linkedin.com/in/manthangupta109/";
    const String medium = "https://medium.com/@manthangupta109";
    const String github = "https://github.com/Manthan109";

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "MANTHAN GUPTA",
          style: GoogleFonts.dosis(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
              color: const Color(0xFF44EFB7)),
        ),
        elevation: 0.0,
        backgroundColor: const Color(0xFF041E40),
      ),
      body: Container(
        decoration: BoxDecoration(color: const Color(0xFF041E40)),
        child: Center(
          child: Row(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 20.0, top: dev_height*0.45),
                    child: Expanded(
                      child: Column(
                        children: <Widget>[
                          GFIconButton(
                            color: const Color(0xFF041E40),
                            shape: GFIconButtonShape.circle,
                            onPressed: () => setState(() {
                              _launched = _launchInBrowser(github);
                            }),
                            icon: Icon(
                              FontAwesomeIcons.github,
                              color: const Color(0xFFCCCCFF),
                            ),
                          ),
                          GFIconButton(
                            color: const Color(0xFF041E40),
                            shape: GFIconButtonShape.circle,
                            onPressed: () => setState(() {
                              _launched = _launchInBrowser(linkedin);
                            }),
                            icon: Icon(
                              FontAwesomeIcons.linkedin,
                              color: const Color(0xFFCCCCFF),
                            ),
                          ),
                          GFIconButton(
                            color: const Color(0xFF041E40),
                            shape: GFIconButtonShape.circle,
                            onPressed: () => setState(() {
                              _launched = _launchInBrowser(medium);
                            }),
                            icon: Icon(
                              FontAwesomeIcons.medium,
                              color: const Color(0xFFCCCCFF),
                            ),
                          ),
                          Container(
                            width: 1.0,
                            height: 90.0,
                            color: const Color(0xFFCCCCFF),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: dev_width * 0.1, top: dev_height * 0.15),
                child: Container(
                  height: dev_height * 0.65,
                  width: dev_width * 0.525,
                  child: Card(
                    color: const Color(0xFF041E40),
                    elevation: 0.0,
                    child: Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Row(children: <Widget>[
                            Text(
                              "Hi There!",
                              style:
                                  GoogleFonts.robotoMono(color: Colors.white),
                            ),
                          ]),
                          Padding(
                            padding: EdgeInsets.only(top: dev_height * 0.011),
                            child: Row(
                              children: <Widget>[
                                Text(
                                  "I'm Manthan",
                                  style: GoogleFonts.roboto(
                                      color: const Color(0xFF44EFB7),
                                      fontSize: dev_width * 0.05,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(top: 40.0),
                                      child: AutoSizeText(
                                        "A sophomore at Bennett University for Computer Science \nEngineering with experience in App Development, Cloud Technology and Web Development.\nI'm passionate about Technology and learning new things everyday.",
                                        textAlign: TextAlign.left,
                                        style: GoogleFonts.robotoMono(
                                            color: Colors.white, height: 2.0),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10.0, left: 0.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                ButtonBar(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 8.0, right: 20.0),
                                      child: GFButton(
                                        position: GFPosition.start,
                                        type: GFButtonType.outline,
                                        onPressed: () => setState(() {
                                          _launched = _launchInBrowser(resume);
                                        }),
                                        text: "Resume",
                                        textColor: const Color(0xFF39CEC0),
                                        borderSide: BorderSide(
                                            color: const Color(0xFF39CEC0),
                                            width: 2.0),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 8.0, right: 20.0),
                                      child: GFButton(
                                        position: GFPosition.start,
                                        type: GFButtonType.outline,
                                        onPressed: () => setState(() async {
                                          await FlutterEmailSender.send(email);
                                        }),
                                        text: "Hire Me",
                                        textColor: const Color(0xFF39CEC0),
                                        borderSide: BorderSide(
                                            color: const Color(0xFF39CEC0),
                                            width: 2.0),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: dev_height * 0.71,
                width: dev_width * 0.25,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Image.asset("assets/dev.png"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
