import 'package:chat_gpt/screens/home_pages/home_screen.dart';
import 'package:chat_gpt/screens/lenguage_pages/lenguage_screen.dart';
import 'package:chat_gpt/screens/splash_screen_pages/splash_screen.dart';
import 'package:chat_gpt/theme/app_theme.dart';
import 'package:chat_gpt/theme/theme_services.dart';
import 'package:flutter/material.dart';
import 'package:chat_gpt/screens/setting_pages/setting_page_controller.dart';
import 'package:chat_gpt/utils/lenguage.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'main_controller.dart';


void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  await MobileAds.instance.initialize();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  void initState() {

    // TODO: implement initState
    super.initState();
    getLanguageCode();
  }

  String countryCode = "";
  String languageCode = "";

  getLanguageCode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    languageCode = prefs.getString('languageCode') ?? "en";
    countryCode = prefs.getString('countryCode') ?? "US";
    Get.updateLocale(Locale(languageCode,countryCode));
    setState(() {});
    print("language code -----> $languageCode");
    print("country Code -----> $countryCode");
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale:  Locale(languageCode,countryCode),
      translations: LocalString(),
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeServices().theme,
      home: const SplashScreen(),
    );
  }
}