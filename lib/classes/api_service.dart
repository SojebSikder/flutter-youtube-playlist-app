import 'package:youtube_api/youtube_api.dart';

/**
 * Execute Youtube data api
 */
class ApiService {
  /**
   * Api key
   */
  static String key =
      "AIzaSyDSXnDKyvl-xgZN0WkTM1q5QPZmbpJBhIQ"; //"YOUR-API-KEY";

  static YoutubeAPI ytApi;
  static List<YT_API> ytResult = [];
  //
  //String type = "channel";
  //String type = "video";
  //String type = "playlist";

  /**
   * Initialize
   */
  static init({String type = "video"}) {
    ytApi = YoutubeAPI(key, type: type);
  }

  /**
   * Return all data
   */
  static getResult({String searchQuery}) async {
    String query = searchQuery;
    ytResult = await ytApi.search(query);
    ytResult = await ytApi.nextPage();
    return ytResult;
  }
}
