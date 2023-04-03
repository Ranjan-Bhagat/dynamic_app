import 'package:dynamic_app/services/remote_config_service.dart';
import 'package:dynamic_app/util/utils.dart';
import 'package:flutter/material.dart';

class TNCScreen extends StatelessWidget {
  const TNCScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(child: Utils.html(RemoteConfigService.tnc)),
    );
  }
}
