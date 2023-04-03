
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../models/icon_button_model.dart';
import '../util/utils.dart';

class ContactButton extends StatelessWidget {

  final IconButtonModel modal;

  const ContactButton(this.modal,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      icon: SvgPicture.network(
        modal.iconUrl,
        height: 30,
        width: 30,
        alignment: Alignment.centerLeft,
      ),
      onPressed: () => Utils.urlLauncher(modal.url, isExternalUrl: modal.isExternalUrl),
      label: Text(
        modal.label,
        style: const TextStyle(
          color: Colors.blueAccent,
          fontSize: 20.0,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
