import 'package:youtube_api/youtube_api.dart';

/**
 * Execute Youtube data api
 */
class ApiService {
  static String key = "YOUR-API-KEY";

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
    ytApi = YoutubeAPI(ApiService.key, type: type);
  }

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
