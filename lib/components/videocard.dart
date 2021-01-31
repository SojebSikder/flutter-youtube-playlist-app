import 'package:flutter/material.dart';
import 'package:flutteryoutubeplaylistapp/pages/Singlevideo.dart';
import 'package:youtube_api/youtube_api.dart';

class ListItem extends StatelessWidget {
  final List<YT_API> ytResult;
  final index;

  const ListItem({this.index, this.ytResult});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SingleVideoPage(
                      thumbnail: ytResult[index].thumbnail['default']['url'],
                      title: ytResult[index].title,
                      description: ytResult[index].description,
                      url: ytResult[index].url,
                    )));
      },
      child: Card(
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
      ),
    );
  }
}
