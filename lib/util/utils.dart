import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:url_launcher/url_launcher.dart';

class Utils {

  Utils._();

  static final GlobalKey<ScaffoldMessengerState> scaffoldKey = GlobalKey<ScaffoldMessengerState>();

  static Future<void> urlLauncher(String url, { bool isExternalUrl = false}) async {
    if (url.isEmpty) return;

    final uri = Uri.parse(url);
    final canLaunch = await canLaunchUrl(uri);
    if (canLaunch) {
      await launchUrl(
        uri,
        mode: isExternalUrl
            ? LaunchMode.externalApplication
            : LaunchMode.inAppWebView,
      );
    } else {
      showTextSnackBar("Something went wrong. Please try again later.");
      log("Fail to launch URL : $uri");
    }
  }

  static void showTextSnackBar(String msg) {
    final currentState = scaffoldKey.currentState;
    currentState?.hideCurrentSnackBar();
    currentState?.showSnackBar(SnackBar(content: Text(msg)));
  }

  static Widget html(String htmlData, {bool shrinkWrap = false}) {
    return Html(
      data: htmlData,
      shrinkWrap: shrinkWrap,
      onLinkTap: (url, _, data, ___) {
        bool isExternalLink = data["target"] == "_blank";
        Utils.urlLauncher(url ?? "", isExternalUrl: isExternalLink);
      },
    );
  }
}
