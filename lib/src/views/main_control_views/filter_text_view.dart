
import 'package:flutter/material.dart';
import 'package:custom_story_editor/src/controller/controller.dart';
import 'package:custom_story_editor/src/enums/story_editing_modes.dart';

class FilterTextView extends StatelessWidget {
  final CustomStoryEditorController controller; // FlutterStoryEditorController to take decision based on certain editing state
  final String? filterText;
  const FilterTextView({super.key, required this.controller, this.filterText});

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 200),
      opacity: controller.editingModeSelected ==StoryEditingModes.filters  ? 0 : 1,
      child: AnimatedContainer(
        height:  controller.editingModeSelected ==StoryEditingModes.filters
            ? 100
            : 50, // change height based on showFilters
        duration: const Duration(milliseconds: 300),
        child: Column(
          children: [
            const Icon(
              Icons.keyboard_arrow_up,
              size: 25,
              color: Colors.white,
            ),
            Text(
              filterText ?? 'Filters',
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
