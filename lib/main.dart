import 'package:chewie/chewie.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:video_app/models/globals.dart';
import 'package:video_app/views/screens/videodisplay.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      "/": (context) => Video(),
      "display": (context) => Display(),
    },
    // home: Video(),
  ));
}

class Video extends StatefulWidget {
  const Video({super.key});

  @override
  State<Video> createState() => _VideoState();
}

class _VideoState extends State<Video> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Video Player"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ...videolist
                .map((e) => GestureDetector(
                      onTap: () {
                        setState(() {
                          currentdata = e;
                        });
                        Navigator.pushNamed(context, "display", arguments: e);
                      },
                      child: Container(
                        height: 330,
                        width: double.infinity,
                        color: Colors.grey,
                        margin: EdgeInsets.all(10),
                        child: Column(children: [
                          Container(
                            height: 300,
                            width: 400,
                            child: Image.asset(
                              e["img"],
                              fit: BoxFit.fill,
                            ),
                          ),
                          Text(
                            e["name"],
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w700),
                          ),
                        ]),
                      ),
                    ))
                .toList(),
          ],
        ),
      ),
    );
  }
}
