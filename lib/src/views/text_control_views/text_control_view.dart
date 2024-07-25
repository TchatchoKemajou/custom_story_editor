
import 'package:flutter/material.dart';
import 'package:custom_story_editor/src/controller/controller.dart';

import 'text_top_view.dart';
class TextControlView extends StatelessWidget {
  final CustomStoryEditorController controller;
  final VoidCallback? onAlignChangeClickListener;
  final IconData? icon;
  final String? doneText;
  const TextControlView({super.key, required this.controller, this.onAlignChangeClickListener, this.icon, this.doneText});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: TextTopView(
            doneText: doneText,
            icon: icon,
            onAlignChangeClickListener: onAlignChangeClickListener,
            controller: controller,
          ),
        ),
      ],
    );
  }
}
