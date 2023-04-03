import 'dart:convert';
import 'dart:developer';

import 'package:dynamic_app/models/banner_model.dart';
import 'package:dynamic_app/models/icon_button_model.dart';
import 'package:dynamic_app/models/social_media_model.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';


class RemoteConfigService {

  static final FirebaseRemoteConfig _remoteConfig = FirebaseRemoteConfig.instance;

  const RemoteConfigService._();

  static final _remoteConfigSettings = RemoteConfigSettings(
    fetchTimeout: const Duration(minutes: 1),
    //Setting minimumFetchInterval: 0 for testing only
    //Set the appropriate value during production
    minimumFetchInterval: const Duration(seconds: 0),
  );

  static final Map<String, dynamic> _remoteConfigDefaults = {
    "banners": "",
    "socialMedia" : "",
    "contact" : "",
    "tnc" : "",
    "enableTNC" : false,
    "enableContact" : false,
  };

  static Future<void> initialize() async {
    try {
      await _remoteConfig.setConfigSettings(_remoteConfigSettings);
      await _remoteConfig.setDefaults(_remoteConfigDefaults);
      await _remoteConfig.fetchAndActivate();
    } catch (e, s) {
      log("Fail to get data from remote config, now default values will be used",error: e, stackTrace: s);
    }
  }

  static List<BannerModel> get banners  {
    final bannersStr = _remoteConfig.getString("banners");
    if(bannersStr.isEmpty)return [];
    try {
      final banners = jsonDecode(bannersStr);
      return List<BannerModel>.from(banners.map((x) => BannerModel.fromMap(x)));
    }catch(e, s){
      log("banners parsing failed",error: e, stackTrace: s);
      return [];
    }
  }

  static SocialMediaModel get socialMedia  {
    final socialMediaStr = _remoteConfig.getString("socialMedia");
    if(socialMediaStr.isEmpty)return SocialMediaModel();
    try {
      return SocialMediaModel.fromJson(socialMediaStr);
    }catch(e, s){
      log("SocialMediaModel parsing failed",error: e, stackTrace: s);
      return SocialMediaModel();
    }
  }

  static List<IconButtonModel> get contact  {
    final contactStr = _remoteConfig.getString("contact");
    if(contactStr.isEmpty)return [];
    try {
      final contact = jsonDecode(contactStr);
      return List<IconButtonModel>.from(contact.map((x) => IconButtonModel.fromMap(x)));
    }catch(e, s){
      log("contact parsing failed",error: e, stackTrace: s);
      return [];
    }
  }

  static String get tnc => _remoteConfig.getString("tnc");

  static bool get enableTNC => _remoteConfig.getBool("enableTNC");

  static bool get enableContact => _remoteConfig.getBool("enableContact");

}

