import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'dart:async';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        actions: <Widget>[
          ButtonBar(
            children: <Widget>[
              FlatButton(
                child: Text(
                  "01. Home",
                  style: GoogleFonts.robotoMono(
                      color: const Color(0xFF39CEC0), fontSize: 12.0),
                ),
                onPressed: () {},
              ),
              FlatButton(
                child: Text(
                  "02. About",
                  style: GoogleFonts.robotoMono(
                      color: const Color(0xFF39CEC0), fontSize: 12.0),
                ),
                onPressed: () => print("Null"),
              ),
              FlatButton(
                child: Text(
                  "03. Works",
                  style: GoogleFonts.robotoMono(
                      color: const Color(0xFF39CEC0), fontSize: 12.0),
                ),
                onPressed: () => print("Null"),
              ),
              FlatButton(
                child: Text(
                  "04. Contact",
                  style: GoogleFonts.robotoMono(
                      color: const Color(0xFF39CEC0), fontSize: 12.0),
                ),
                onPressed: () => print("Null"),
              )
            ],
          )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(color: const Color(0xFF041E40)),
        child: Center(
          child: Row(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, top: 400.0),
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
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 200.0, top: 100.0),
                child: Container(
                  height: 550.0,
                  width: 800.0,
                  child: Card(
                    color: const Color(0xFF041E40),
                    elevation: 0.0,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Row(children: <Widget>[
                          Text(
                            "Hi There!",
                            style: GoogleFonts.robotoMono(color: Colors.white),
                          ),
                        ]),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Row(
                            children: <Widget>[
                              Text(
                                "I'm Manthan",
                                style: GoogleFonts.roboto(
                                    color: const Color(0xFF44EFB7),
                                    fontSize: 60.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(top: 40.0),
                                  child: Text(
                                    "An undergraduate in sophomore year at Bennett University for Computer Science \nEngineering with experience in App Development, Cloud Technology and Web Development.\nI'm passionate about Technology and learning new things everyday.",
                                    textAlign: TextAlign.left,
                                    style: GoogleFonts.robotoMono(
                                        color: Colors.white, height: 2.0),
                                  ),
                                ),
                              ],
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
                                      onPressed: ()=>setState(() async{
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
              Container(
                height: 400.0,
                width: 400.0,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
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
