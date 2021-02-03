import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shiori_noodle_stopper/generated/l10n.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).about),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            margin: const EdgeInsets.only(top: 15.0, right: 15.0, left: 15.0),
            child:  Column(
              children: [
                Text(
                  AppLocalizations.of(context).title,
                  style: TextStyle(
                    fontSize: 25.0,
                  ),
                ),
                const SizedBox(
                  width: 10,
                  height: 10,
                ),
                const Text("V1.0.0"),
                const SizedBox(
                  width: 10,
                  height: 25,
                ),
                Text(
                  AppLocalizations.of(context).usedLib,
                  style: TextStyle(
                    fontSize: 25.0,
                  ),
                ),
                const SizedBox(
                  width: 10,
                  height: 10,
                ),
                Card(
                  child: Container(
                    margin: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("intl 0.16.1"),
                        const SizedBox(width: 10.0, height: 10.0,),
                        Text(AppLocalizations.of(context).license +  ": BSD"),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            FlatButton(
                              onPressed: () async {
                                const url = 'https://pub.dev/packages/intl';
                                if (await canLaunch(url)) {
                                  await launch(url, enableJavaScript: true);
                                } else {
                                  throw 'Could not launch $url';
                                }
                              },
                              color: Color(0xFF44393d),
                              textColor: Colors.white,
                              padding: const EdgeInsets.only(top: 6.0, right: 30.0, bottom: 7.0, left: 30.0),
                              child: visitButton(context),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Container(
                    margin: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("wakelock 0.2.1+1"),
                        const SizedBox(width: 10.0, height: 10.0,),
                        Text(AppLocalizations.of(context).license + ": BSD"),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            FlatButton(
                              onPressed: () async {
                                const url = 'https://pub.dev/packages/wakelock';
                                if (await canLaunch(url)) {
                                  await launch(url, enableJavaScript: true);
                                } else {
                                  throw 'Could not launch $url';
                                }
                              },
                              color: Color(0xFF44393d),
                              textColor: Colors.white,
                              padding: const EdgeInsets.only(top: 6.0, right: 30.0, bottom: 7.0, left: 30.0),
                              child: visitButton(context),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Container(
                    margin: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("audioplayers 0.17.0"),
                        const SizedBox(width: 10.0, height: 10.0,),
                        Text(AppLocalizations.of(context).license + ": MIT"),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            FlatButton(
                              onPressed: () async {
                                const url = 'https://pub.dev/packages/audioplayers';
                                if (await canLaunch(url)) {
                                  await launch(url, enableJavaScript: true);
                                } else {
                                  throw 'Could not launch $url';
                                }
                              },
                              color: Color(0xFF44393d),
                              textColor: Colors.white,
                              padding: const EdgeInsets.only(top: 6.0, right: 30.0, bottom: 7.0, left: 30.0),
                              child: visitButton(context),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Container(
                    margin: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("flutter_launcher_icons 0.8.1"),
                        const SizedBox(width: 10.0, height: 10.0,),
                        Text(AppLocalizations.of(context).license + ": MIT"),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            FlatButton(
                              onPressed: () async {
                                const url = 'https://pub.dev/packages/flutter_launcher_icons';
                                if (await canLaunch(url)) {
                                  await launch(url, enableJavaScript: true);
                                } else {
                                  throw 'Could not launch $url';
                                }
                              },
                              color: Color(0xFF44393d),
                              textColor: Colors.white,
                              padding: const EdgeInsets.only(top: 6.0, right: 30.0, bottom: 7.0, left: 30.0),
                              child: visitButton(context),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Container(
                    margin: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("url_launcher 5.7.10"),
                        const SizedBox(width: 10.0, height: 10.0,),
                        Text(AppLocalizations.of(context).license + ": BSD"),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            FlatButton(
                              onPressed: () async {
                                const url = 'https://pub.dev/packages/url_launcher';
                                if (await canLaunch(url)) {
                                  await launch(url, enableJavaScript: true);
                                } else {
                                  throw 'Could not launch $url';
                                }
                              },
                              color: Color(0xFF44393d),
                              textColor: Colors.white,
                              padding: const EdgeInsets.only(top: 6.0, right: 30.0, bottom: 7.0, left: 30.0),
                              child: visitButton(context),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget visitButton(BuildContext context) {
    return Text(
      AppLocalizations.of(context).visit,
      style: TextStyle(
        fontSize: 16.0,
      ),
    );
  }
}