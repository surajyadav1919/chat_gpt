import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class  MainPageController extends GetxController{
  String countryCode = "";
  String languageCode = "";

  getLanguageCode() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    languageCode = prefs.getString('languageCode') ?? "en";
    countryCode = prefs.getString('countryCode') ?? "US";
    update();
  }


  @override
  void onInit() {
    getLanguageCode();
    // TODO: implement onInit
    super.onInit();
  }
}