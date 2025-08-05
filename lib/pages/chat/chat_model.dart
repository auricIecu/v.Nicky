import '/components/chat_bubbles/chat_bubbles_widget.dart';
import '/components/dark_light_switch_small_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'chat_widget.dart' show ChatWidget;
import 'package:flutter/material.dart';

class ChatModel extends FlutterFlowModel<ChatWidget> {
  ///  Local state fields for this page.

  String? promptText = 'Hello!';

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for Title widget.
  FocusNode? titleFocusNode;
  TextEditingController? titleTextController;
  String? Function(BuildContext, String?)? titleTextControllerValidator;
  String? _titleTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length > 40) {
      return 'Lets make that a bit smaller...';
    }

    return null;
  }

  // Models for ChatBubbles dynamic component.
  late FlutterFlowDynamicModels<ChatBubblesModel> chatBubblesModels;
  // State field(s) for Prompt widget.
  FocusNode? promptFocusNode;
  TextEditingController? promptTextController;
  String? Function(BuildContext, String?)? promptTextControllerValidator;
  // Stores action output result for [AI Agent - Send Message to Test] action in Prompt widget.
  String? botMessage;
  // Model for DarkLightSwitchSmall component.
  late DarkLightSwitchSmallModel darkLightSwitchSmallModel;

  @override
  void initState(BuildContext context) {
    titleTextControllerValidator = _titleTextControllerValidator;
    chatBubblesModels = FlutterFlowDynamicModels(() => ChatBubblesModel());
    darkLightSwitchSmallModel =
        createModel(context, () => DarkLightSwitchSmallModel());
  }

  @override
  void dispose() {
    titleFocusNode?.dispose();
    titleTextController?.dispose();

    chatBubblesModels.dispose();
    promptFocusNode?.dispose();
    promptTextController?.dispose();

    darkLightSwitchSmallModel.dispose();
  }
}
