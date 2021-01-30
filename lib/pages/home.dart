import 'package:flutter/material.dart';
import 'package:youtube_api/youtube_api.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Initialize variable
  //
  static String key =
      "AIzaSyDSXnDKyvl-xgZN0WkTM1q5QPZmbpJBhIQ"; //"YOUR-API-KEY";

  //String type = "channel";
  //String type = "video";
  //String type = "playlist";
  YoutubeAPI ytApi = YoutubeAPI(key, type: "playlist");
  List<YT_API> ytResult = [];

// Methods
  callAPI() async {
    String query = "sojebsoft";
    ytResult = await ytApi.search(query);
    ytResult = await ytApi.nextPage();
    setState(() {});
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
          itemBuilder: (_, index) => listItem(index),
        ),
      ),
    );
  }

  Widget listItem(index) {
    return Card(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 7.0),
        padding: EdgeInsets.all(12.0),
        child: Row(
          children: <Widget>[
            Image.network(
              ytResult[index].thumbnail['default']['url'],
            ),
            Padding(padding: EdgeInsets.only(right: 20.0)),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    ytResult[index].title,
                    softWrap: true,
                    style: TextStyle(fontSize: 18.0),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 1.5)),
                  Text(
                    ytResult[index].channelTitle,
                    softWrap: true,
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 3.0)),
                  Text(
                    ytResult[index].url,
                    softWrap: true,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
