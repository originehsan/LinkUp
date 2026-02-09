import 'package:shared_preferences/shared_preferences.dart';

class HelperFunctions {
  // keys
  static String userLoggedInKey = "LOGGEDINKEY";
  static String userNameKey = "USERNAMEKEY";
  static String userEmailInKey = "USEREMAILKEY";

  // saving to shared pref;

  static Future<bool?> getUserLoggedInStatus() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getBool(userLoggedInKey);
  }

  // getting data from sf
}

