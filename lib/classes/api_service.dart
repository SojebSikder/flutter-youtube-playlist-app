import 'package:youtube_api/youtube_api.dart';

// ignore: slash_for_doc_comments
/**
 * Execute Youtube data api
 */
class ApiService {
  static String key =
      "AIzaSyDSXnDKyvl-xgZN0WkTM1q5QPZmbpJBhIQ"; //"YOUR-API-KEY";

  static YoutubeAPI ytApi;
  static List<YT_API> ytResult = [];
  //
  //String type = "channel";
  //String type = "video";
  //String type = "playlist";

// ignore: slash_for_doc_comments
/**
 * Initialize
 */
  static init({String type = "video"}) {
    ytApi = YoutubeAPI(ApiService.key, type: type);
  }

// ignore: slash_for_doc_comments
/**
 * Return all data
 */
  static getResult() async {
    String query = "sojebsoft";
    ytResult = await ytApi.search(query);
    ytResult = await ytApi.nextPage();
    return ytResult;
  }
}
