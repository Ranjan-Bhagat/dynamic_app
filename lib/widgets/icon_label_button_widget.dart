import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../models/icon_button_model.dart';
import '../util/utils.dart';

class IconLabelButtonWidget extends StatelessWidget {
  final IconButtonModel modal;

  const IconLabelButtonWidget(this.modal, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(40),
      child: InkWell(
        borderRadius: BorderRadius.circular(40),
        onTap: () => Utils.urlLauncher(modal.url, isExternalUrl: modal.isExternalUrl),
        child: Container(
          color: Colors.transparent,
          margin: const EdgeInsets.all(2),
          child: Column(
            children: [
              SvgPicture.network(
                modal.iconUrl,
                height: 40,
                width: 40,
              ),
              const SizedBox(height: 4),
              Text(
                modal.label,
                style: Theme.of(context).textTheme.labelSmall,
              )
            ],
          ),
        ),
      ),
    );
  }
}
