import 'package:flutter/material.dart';
import 'package:flutteryoutubeplaylistapp/classes/api_service.dart';
import 'package:flutteryoutubeplaylistapp/components/videocard.dart';
import 'package:flutteryoutubeplaylistapp/pages/Singlevideo.dart';
import 'package:youtube_api/youtube_api.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Initialize variable
  String type = "video";
  List<YT_API> ytResult = [];

  // Methods
  callAPI() async {
    ApiService.init(type: type);
    ytResult = await ApiService.getResult();
  }

  @override
  void initState() {
    super.initState();
    callAPI();
    print('hello');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Youtube Playlist"),
      ),
      body: Container(
        child: ListView.builder(
            itemCount: ytResult.length,
            itemBuilder: (_, index) => ListItem(
                  index: index,
                  ytResult: ytResult,
                ) //listItem(index),
            ),
      ),
    );
  }
}
