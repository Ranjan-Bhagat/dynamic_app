import 'package:dynamic_app/services/remote_config_service.dart';
import 'package:dynamic_app/widgets/banners_widget.dart';
import 'package:dynamic_app/widgets/social_media_buttons_Widget.dart';
import 'package:flutter/material.dart';

import '../widgets/contact_button_widget.dart';
import '../widgets/tnc_button_widget.dart';

class HomeScreen extends StatelessWidget {

  final String title;

  const HomeScreen({super.key, required this.title, });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          BannersWidget(RemoteConfigService.banners),
          SocialMediaButtonWidget(RemoteConfigService.socialMedia),
          if(RemoteConfigService.enableContact)
            ...RemoteConfigService.contact.map((e) =>  ContactButton(e)),
          if(RemoteConfigService.enableTNC)
            const Center(child: TNCButton())
        ],
      ),
    );
  }
}
