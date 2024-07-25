import 'package:flutter/material.dart';
//import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:custom_story_editor/src/theme/style.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// CaptionView is a StatelessWidget that provides UI for entering captions and initiating save operations.
class CaptionView extends StatefulWidget {
  final TextEditingController captionController; // Controller for text input.
  final VoidCallback onSaveClickListener; // Callback function when the save button is clicked.
  final FocusNode? focusNode; // Optional focus node to manage focus behavior.
  final bool isSaving; // Boolean indicating whether a save operation is in progress.
  final String? hintCaption;
  // Constructor initializing all fields with required annotations for mandatory fields.
   CaptionView({
    super.key,
    required this.captionController,
    required this.onSaveClickListener,
    required this.isSaving,
    this.focusNode, this.hintCaption
  });

  @override
  State<CaptionView> createState() => _CaptionViewState();
}

class _CaptionViewState extends State<CaptionView> {
  //final controller = TextEditingController();
  ScrollController scrollController = ScrollController();

  bool emojiShowing = false;

  @override
  Widget build(BuildContext context) {
    // Building the widget structure for the caption view.
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Row(
        children: [
          Expanded(
            child: Container(
              //margin: const EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              height: 45,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25), // Rounded corners for aesthetic appeal.
                  color: const Color(0xFFFAFAFA)), // Background color set to dark green.
              child: TextFormField(
                textAlignVertical: TextAlignVertical.center,
                focusNode: widget.focusNode, // Assigning focus node if provided.
                controller: widget.captionController, // Using the provided TextEditingController for text editing.
                style: const TextStyle(fontSize: 18), // Text style customization.
                cursorColor: const Color(0xFFFC9501), // Cursor color set to teal for visual consistency.
                decoration: InputDecoration(
                    isDense: true, // Added this
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                    border: InputBorder.none, // No visual border for the input field.
                    prefixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          emojiShowing = !emojiShowing;
                        });
                      },
                      child: const Icon(
                        Icons.emoji_emotions_outlined,
                        color: Colors.grey,
                        size: 28,
                      ),
                    ), // Icon for a visual hint at the start of the input field.
                    hintText: widget.hintCaption ?? "Enter a caption...", // Placeholder text.
                    //contentPadding: const EdgeInsets.symmetric(vertical: 15), // Padding inside the input field.
                    hintStyle: const TextStyle(
                        color: Colors.grey,
                      fontSize: 13
                    )), // Hint text style.
              ),
            ),
          ),
          const SizedBox(width: 20,),
          GestureDetector(
            onTap: widget.onSaveClickListener, // Gesture detector to handle tap events on the save button.
            child: Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25), // Rounded corners for the button.
                  color: const Color(0xFFFC9501)
              ), // Background color set to teal.
              child: Center(
                child: widget.isSaving
                    ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                ) // Circular progress indicator when saving.
                    : const Icon(
                  Icons.send_outlined,
                  color: Colors.white,
                ), // Icon indicating send action.
              ),
            ),
          )
        ],
      ),
    );
  }

  // emojiView(){
  //   return Offstage(
  //       offstage: !emojiShowing,
  //       child: EmojiPicker(
  //       textEditingController: widget.captionController,
  //       scrollController: scrollController,
  //       config: Config(
  //       height: 256,
  //       checkPlatformCompatibility: true,
  //       emojiViewConfig: EmojiViewConfig(
  //       // Issue: https://github.com/flutter/flutter/issues/28894
  //       emojiSizeMax: 28 *
  //       (foundation.defaultTargetPlatform ==
  //       TargetPlatform.iOS
  //       ? 1.2
  //       : 1.0),
  //   ),
  //   swapCategoryAndBottomBar: false,
  //   skinToneConfig: const SkinToneConfig(),
  //   categoryViewConfig: const CategoryViewConfig(),
  //   bottomActionBarConfig: const BottomActionBarConfig(),
  //   searchViewConfig: const SearchViewConfig(),
  //   )));
  // }
}
