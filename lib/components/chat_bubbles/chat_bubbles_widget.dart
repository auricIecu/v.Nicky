import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'chat_bubbles_model.dart';
export 'chat_bubbles_model.dart';

class ChatBubblesWidget extends StatefulWidget {
  const ChatBubblesWidget({
    super.key,
    required this.messageText,
    required this.gptResponse,
    required this.userMessage,
  });

  final String? messageText;
  final bool? gptResponse;
  final bool? userMessage;

  @override
  State<ChatBubblesWidget> createState() => _ChatBubblesWidgetState();
}

class _ChatBubblesWidgetState extends State<ChatBubblesWidget> {
  late ChatBubblesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatBubblesModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          if (widget.gptResponse == true)
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 5.0, 0.0),
                    child: Icon(
                      Icons.auto_awesome,
                      color: FlutterFlowTheme.of(context).primary,
                      size: 26.0,
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: MouseRegion(
                      opaque: false,
                      cursor: MouseCursor.defer ?? MouseCursor.defer,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Flexible(
                            child: Container(
                              constraints: BoxConstraints(
                                minHeight: 40.0,
                              ),
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    15.0, 10.0, 15.0, 10.0),
                                child: Text(
                                  widget.messageText!,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.duruSans(
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        fontSize: 11.5,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                            ),
                          ),
                          if (_model.copyHover ?? true)
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  5.0, 0.0, 0.0, 0.0),
                              child: FlutterFlowIconButton(
                                borderRadius: 8.0,
                                buttonSize: 40.0,
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                hoverColor: Color(0xFF222630),
                                hoverIconColor: Colors.white,
                                icon: Icon(
                                  Icons.content_copy_rounded,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 15.0,
                                ),
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'CHAT_BUBBLES_content_copy_rounded_ICN_ON');
                                  logFirebaseEvent(
                                      'IconButton_copy_to_clipboard');
                                  await Clipboard.setData(ClipboardData(
                                      text: widget.messageText!));
                                  logFirebaseEvent('IconButton_show_snack_bar');
                                  ScaffoldMessenger.of(context)
                                      .clearSnackBars();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Copied to clipboard!',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 3100),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .primaryText,
                                    ),
                                  );
                                },
                              ),
                            ),
                        ],
                      ),
                      onEnter: ((event) async {
                        safeSetState(() => _model.mouseRegionHovered = true);
                        logFirebaseEvent(
                            'CHAT_BUBBLES_MouseRegion_bb0u9cms_ON_TOG');
                        logFirebaseEvent('MouseRegion_update_component_state');
                        _model.copyHover = true;
                        safeSetState(() {});
                      }),
                      onExit: ((event) async {
                        safeSetState(() => _model.mouseRegionHovered = false);
                        logFirebaseEvent(
                            'CHAT_BUBBLES_MouseRegion_bb0u9cms_ON_TOG');
                        logFirebaseEvent('MouseRegion_update_component_state');
                        _model.copyHover = false;
                        safeSetState(() {});
                      }),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      width: 100.0,
                      height: 20.0,
                      decoration: BoxDecoration(),
                    ),
                  ),
                ],
              ),
            ),
          if (widget.userMessage == true)
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      width: 100.0,
                      height: 20.0,
                      decoration: BoxDecoration(),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Flexible(
                          child: Container(
                            constraints: BoxConstraints(
                              minHeight: 40.0,
                            ),
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).secondary,
                              borderRadius: BorderRadius.circular(18.0),
                              border: Border.all(
                                color: Color(0x0FFFFFFF),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  15.0, 10.0, 15.0, 10.0),
                              child: Text(
                                widget.messageText!,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.duruSans(
                                        fontWeight: FontWeight.normal,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context)
                                          .onSecondary,
                                      fontSize: 11.5,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
