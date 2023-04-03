import 'package:dynamic_app/models/social_media_model.dart';
import 'package:dynamic_app/widgets/icon_label_button_widget.dart';
import 'package:flutter/material.dart';

class SocialMediaButtonWidget extends StatelessWidget {
  const SocialMediaButtonWidget(this.modal, {Key? key}) : super(key: key);

  final SocialMediaModel modal;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (modal.title != null) ...[
            Text(
              modal.title!,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
          ],
          Wrap(
            spacing: 12,
            runSpacing: 8,
            children: modal.socialMedia
                .map((button) => IconLabelButtonWidget(button))
                .toList(),
          ),
        ],
      ),
    );
  }
}
