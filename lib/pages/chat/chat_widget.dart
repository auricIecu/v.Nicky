import '/auth/firebase_auth/auth_util.dart';
import '/backend/ai_agents/ai_agent.dart';
import '/backend/backend.dart';
import '/components/chat_bubbles/chat_bubbles_widget.dart';
import '/components/dark_light_switch_small_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'chat_model.dart';
export 'chat_model.dart';

class ChatWidget extends StatefulWidget {
  const ChatWidget({
    super.key,
    required this.chatRef,
  });

  final DocumentReference? chatRef;

  static String routeName = 'Chat';
  static String routePath = '/chat';

  @override
  State<ChatWidget> createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> with TickerProviderStateMixin {
  late ChatModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Chat'});

    _model.titleFocusNode ??= FocusNode();

    _model.promptTextController ??= TextEditingController();
    _model.promptFocusNode ??= FocusNode();
    
    // Add listener to update send button opacity
    _model.promptTextController!.addListener(() {
      setState(() {});
    });

    animationsMap.addAll({
      'containerOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        applyInitialState: true,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 60.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        applyInitialState: true,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 60.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  Widget _buildNavButton(String assetPath, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(12.0),
        child: Image.asset(
          assetPath,
          width: 36.0,
          height: 36.0,
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<MessagesRecord>>(
      stream: queryMessagesRecord(
        parent: widget.chatRef,
        queryBuilder: (messagesRecord) => messagesRecord
            .where(
              'uid',
              isEqualTo: currentUserReference,
            )
            .orderBy('timestamp', descending: true),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: Color(0xFF1a1a1a),
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Color(0xFFf7c61a),
                  ),
                ),
              ),
            ),
          );
        }
        List<MessagesRecord> chatMessagesRecordList = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: Color(0xFF1a1a1a),
            body: SafeArea(
              child: Column(
                children: [
                  // Top Bar
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                    decoration: BoxDecoration(
                      color: Color(0xFF1a1a1a),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            scaffoldKey.currentState?.openDrawer();
                          },
                          child: Container(
                            padding: EdgeInsets.all(8.0),
                            child: Image.asset(
                              'assets/botones v1/Singo usuario.png',
                              width: 34.5,
                              height: 34.5,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        Text(
                          'Orito',
                          style: GoogleFonts.duruSans(
                            fontSize: 28.75,
                            fontWeight: FontWeight.w900,
                            color: Color(0xFFf7c61a),
                            letterSpacing: 1.0,
                            height: 1.0,
                            shadows: [
                              Shadow(
                                offset: Offset(0.5, 0.5),
                                color: Color(0xFFf7c61a),
                                blurRadius: 0,
                              ),
                              Shadow(
                                offset: Offset(-0.5, -0.5),
                                color: Color(0xFFf7c61a),
                                blurRadius: 0,
                              ),
                              Shadow(
                                offset: Offset(0.5, -0.5),
                                color: Color(0xFFf7c61a),
                                blurRadius: 0,
                              ),
                              Shadow(
                                offset: Offset(-0.5, 0.5),
                                color: Color(0xFFf7c61a),
                                blurRadius: 0,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(8.0),
                          child: Image.asset(
                            'assets/botones v1/Mensajes peer to peer.png',
                            width: 34.5,
                            height: 34.5,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  // Chat Messages Area
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      child: Stack(
                        children: [
                          // Background with blurred logo
                          if (chatMessagesRecordList.isEmpty)
                            Center(
                              child: Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/botones v1/Logo1.png',
                                      width: 120.0,
                                      height: 120.0,
                                      opacity: AlwaysStoppedAnimation(0.1),
                                    ),
                                    SizedBox(height: 16.0),
                                    Text(
                                      'Explícame el origen del apodo Don Broken',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.duruSans(
                                        fontSize: 16.0,
                                        color: Colors.white.withOpacity(0.7),
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          
                          // Messages List
                          if (chatMessagesRecordList.isNotEmpty)
                            ListView.builder(
                              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                              reverse: true,
                              itemCount: chatMessagesRecordList.length,
                              itemBuilder: (context, messageIndex) {
                                final messageItem = chatMessagesRecordList[messageIndex];
                                return Padding(
                                  padding: EdgeInsets.only(bottom: 16.0),
                                  child: Row(
                                    mainAxisAlignment: messageItem.user == 'user'
                                        ? MainAxisAlignment.end
                                        : MainAxisAlignment.start,
                                    children: [
                                      Flexible(
                                        child: Container(
                                          constraints: BoxConstraints(
                                            maxWidth: MediaQuery.of(context).size.width * 0.8,
                                          ),
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 16.0,
                                            vertical: 12.0,
                                          ),
                                          decoration: BoxDecoration(
                                            color: messageItem.user == 'user'
                                                ? Color(0xFF2a2a2a)
                                                : Color(0xFF1e1e1e),
                                            borderRadius: BorderRadius.circular(20.0),
                                            border: Border.all(
                                              color: Color(0xFF3a3a3a),
                                              width: 1.0,
                                            ),
                                          ),
                                          child: Text(
                                            messageItem.message ?? 'Hello!',
                                            style: GoogleFonts.duruSans(
                                              fontSize: 14.0,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                        ],
                      ),
                    ),
                  ),
                  
                  // Input Area
                  Container(
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Color(0xFF1a1a1a),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFF2a2a2a),
                        borderRadius: BorderRadius.circular(25.0),
                        border: Border.all(
                          color: Color(0xFF3a3a3a),
                          width: 1.0,
                        ),
                      ),
                      child: Row(
                        children: [
                          // Attach button
                          Container(
                            padding: EdgeInsets.all(12.0),
                            child: Image.asset(
                              'assets/botones v1/Signo adjuntar.png',
                              width: 31.0,
                              height: 31.0,
                              fit: BoxFit.contain,
                            ),
                          ),
                          
                          // Text input
                          Expanded(
                            child: TextFormField(
                              controller: _model.promptTextController,
                              focusNode: _model.promptFocusNode,
                              textAlign: TextAlign.center,
                              onFieldSubmitted: (_) async {
                                if (_model.promptTextController.text.trim().isNotEmpty) {
                                  // Handle message sending
                                  logFirebaseEvent('CHAT_PAGE_Prompt_ON_TEXTFIELD_SUBMIT');
                                  logFirebaseEvent('Prompt_update_page_state');
                                  _model.promptText = _model.promptTextController.text;
                                  safeSetState(() {});
                                  logFirebaseEvent('Prompt_backend_call');

                                  await MessagesRecord.createDoc(widget.chatRef!)
                                      .set(createMessagesRecordData(
                                    timestamp: getCurrentTimestamp,
                                    firstMessage: false,
                                    message: _model.promptTextController.text,
                                    user: 'user',
                                    uid: currentUserReference,
                                  ));
                                  logFirebaseEvent('Prompt_clear_text_fields_pin_codes');
                                  safeSetState(() {
                                    _model.promptTextController?.clear();
                                  });
                                  logFirebaseEvent('Prompt_update_app_state');
                                  FFAppState().awaitingReply = true;
                                  safeSetState(() {});
                                  logFirebaseEvent('Prompt_a_i_agent');
                                  await callAiAgent(
                                    context: context,
                                    prompt: valueOrDefault<String>(
                                      _model.promptText,
                                      'null',
                                    ),
                                    threadId: valueOrDefault<String>(
                                      widget.chatRef?.id,
                                      'null',
                                    ),
                                    agentCloudFunctionName: 'test',
                                    provider: 'GOOGLE',
                                    agentJson: "{\"status\":\"LIVE\",\"identifier\":{\"name\":\"test\",\"key\":\"a48q0\"},\"name\":\"Test\",\"description\":\"Asistente IA en Español llamado Orito IA\",\"aiModel\":{\"provider\":\"GOOGLE\",\"model\":\"gemini-2.5-pro\",\"parameters\":{\"temperature\":{\"inputValue\":1},\"maxTokens\":{\"inputValue\":32000},\"topP\":{\"inputValue\":0.95}},\"messages\":[{\"role\":\"SYSTEM\",\"text\":\"Asistente IA en Español llamado Orito IA\"}]},\"requestOptions\":{\"requestTypes\":[\"PLAINTEXT\"]},\"responseOptions\":{\"responseType\":\"PLAINTEXT\"}}",
                                    responseType: 'PLAINTEXT',
                                  ).then((generatedText) {
                                    safeSetState(() => _model.botMessage = generatedText);
                                  });

                                  logFirebaseEvent('Prompt_backend_call');
                                  await MessagesRecord.createDoc(widget.chatRef!)
                                      .set(createMessagesRecordData(
                                    timestamp: getCurrentTimestamp,
                                    firstMessage: false,
                                    message: _model.botMessage,
                                    user: 'gpt',
                                    uid: currentUserReference,
                                  ));
                                  logFirebaseEvent('Prompt_update_app_state');
                                  FFAppState().awaitingReply = false;
                                  safeSetState(() {});
                                }
                              },
                              decoration: InputDecoration(
                                hintText: 'Pregúntame algo',
                                hintStyle: GoogleFonts.duruSans(
                                  color: Color(0xFF666666),
                                  fontSize: 16.0,
                                ),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16.0,
                                  vertical: 12.0,
                                ),
                              ),
                              style: GoogleFonts.duruSans(
                                color: Colors.white,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                          
                          // Send button
                          GestureDetector(
                            onTap: () async {
                              if (_model.promptTextController.text.trim().isNotEmpty) {
                                // Handle message sending - same logic as onFieldSubmitted
                                logFirebaseEvent('CHAT_PAGE_Send_Button_ON_TAP');
                                logFirebaseEvent('Send_Button_update_page_state');
                                _model.promptText = _model.promptTextController.text;
                                safeSetState(() {});
                                logFirebaseEvent('Send_Button_backend_call');

                                await MessagesRecord.createDoc(widget.chatRef!)
                                    .set(createMessagesRecordData(
                                  timestamp: getCurrentTimestamp,
                                  firstMessage: false,
                                  message: _model.promptTextController.text,
                                  user: 'user',
                                  uid: currentUserReference,
                                ));
                                logFirebaseEvent('Send_Button_clear_text_fields_pin_codes');
                                safeSetState(() {
                                  _model.promptTextController?.clear();
                                });
                                logFirebaseEvent('Send_Button_update_app_state');
                                FFAppState().awaitingReply = true;
                                safeSetState(() {});
                                logFirebaseEvent('Send_Button_a_i_agent');
                                await callAiAgent(
                                  context: context,
                                  prompt: valueOrDefault<String>(
                                    _model.promptText,
                                    'null',
                                  ),
                                  threadId: valueOrDefault<String>(
                                    widget.chatRef?.id,
                                    'null',
                                  ),
                                  agentCloudFunctionName: 'test',
                                  provider: 'GOOGLE',
                                  agentJson: "{\"status\":\"LIVE\",\"identifier\":{\"name\":\"test\",\"key\":\"a48q0\"},\"name\":\"Test\",\"description\":\"Asistente IA en Español llamado Orito IA\",\"aiModel\":{\"provider\":\"GOOGLE\",\"model\":\"gemini-2.5-pro\",\"parameters\":{\"temperature\":{\"inputValue\":1},\"maxTokens\":{\"inputValue\":32000},\"topP\":{\"inputValue\":0.95}},\"messages\":[{\"role\":\"SYSTEM\",\"text\":\"Asistente IA en Español llamado Orito IA\"}]},\"requestOptions\":{\"requestTypes\":[\"PLAINTEXT\"]},\"responseOptions\":{\"responseType\":\"PLAINTEXT\"}}",
                                  responseType: 'PLAINTEXT',
                                ).then((generatedText) {
                                  safeSetState(() => _model.botMessage = generatedText);
                                });

                                logFirebaseEvent('Send_Button_backend_call');
                                await MessagesRecord.createDoc(widget.chatRef!)
                                    .set(createMessagesRecordData(
                                  timestamp: getCurrentTimestamp,
                                  firstMessage: false,
                                  message: _model.botMessage,
                                  user: 'gpt',
                                  uid: currentUserReference,
                                ));
                                logFirebaseEvent('Send_Button_update_app_state');
                                FFAppState().awaitingReply = false;
                                safeSetState(() {});
                              }
                            },
                            child: Container(
                              padding: EdgeInsets.all(12.0),
                              child: Image.asset(
                                'assets/botones v1/Signo enviar.png',
                                width: 31.0,
                                height: 31.0,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  
                  // Bottom Navigation Bar
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    decoration: BoxDecoration(
                      color: Color(0xFF1a1a1a),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildNavButton('assets/botones v1/Signo buscar.png', () {}),
                        _buildNavButton('assets/botones v1/Signo inventario.png', () {}),
                        _buildNavButton('assets/botones v1/Signo importaciones.png', () {}),
                        _buildNavButton('assets/botones v1/Signo historial 2.png', () {
                          scaffoldKey.currentState?.openDrawer();
                        }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            drawer: Container(
              width: 275.0,
              child: Drawer(
                elevation: 12.0,
                backgroundColor: Color(0xFF1a1a1a),
                child: StreamBuilder<List<ChatsRecord>>(
                  stream: queryChatsRecord(
                    queryBuilder: (chatsRecord) => chatsRecord
                        .where(
                          'uid',
                          isEqualTo: currentUserReference,
                        )
                        .orderBy('timestamp', descending: true),
                  ),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Color(0xFFf7c61a),
                            ),
                          ),
                        ),
                      );
                    }
                    List<ChatsRecord> containerChatsRecordList = snapshot.data!;

                    return Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xFF1a1a1a),
                      ),
                      child: SafeArea(
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              // Header
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Historial',
                                    style: GoogleFonts.duruSans(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFFf7c61a),
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: Icon(
                                      Icons.close,
                                      color: Colors.white,
                                      size: 24.0,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 16.0),
                              
                              // New Chat Button
                              Container(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () async {
                                    logFirebaseEvent('CHAT_PAGE_NEW_CHAT_BTN_ON_TAP');
                                    logFirebaseEvent('Button_navigate_to');
                                    Navigator.pop(context);
                                    context.goNamed(
                                      HomeWidget.routeName,
                                      extra: <String, dynamic>{
                                        kTransitionInfoKey: TransitionInfo(
                                          hasTransition: true,
                                          transitionType: PageTransitionType.fade,
                                        ),
                                      },
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xFFf7c61a),
                                    foregroundColor: Color(0xFF1a1a1a),
                                    padding: EdgeInsets.symmetric(vertical: 12.0),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                  child: Text(
                                    'Nueva Conversación',
                                    style: GoogleFonts.duruSans(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 16.0),
                              
                              // Chat List
                              Expanded(
                                child: ListView.separated(
                                  itemCount: containerChatsRecordList.length,
                                  separatorBuilder: (_, __) => SizedBox(height: 8.0),
                                  itemBuilder: (context, chatIndex) {
                                    final chatItem = containerChatsRecordList[chatIndex];
                                    return GestureDetector(
                                      onTap: () async {
                                        logFirebaseEvent('CHAT_PAGE_Container_f0z1510t_ON_TAP');
                                        logFirebaseEvent('Container_navigate_to');
                                        Navigator.pop(context);
                                        context.goNamed(
                                          ChatWidget.routeName,
                                          queryParameters: {
                                            'chatRef': serializeParam(
                                              chatItem.reference,
                                              ParamType.DocumentReference,
                                            ),
                                          }.withoutNulls,
                                          extra: <String, dynamic>{
                                            kTransitionInfoKey: TransitionInfo(
                                              hasTransition: true,
                                              transitionType: PageTransitionType.fade,
                                            ),
                                          },
                                        );
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        padding: EdgeInsets.all(12.0),
                                        decoration: BoxDecoration(
                                          color: widget.chatRef == chatItem.reference
                                              ? Color(0xFF2a2a2a)
                                              : Color(0xFF1e1e1e),
                                          borderRadius: BorderRadius.circular(8.0),
                                          border: Border.all(
                                            color: Color(0xFF3a3a3a),
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              valueOrDefault<String>(
                                                chatItem.title,
                                                'Nueva Conversación',
                                              ),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.duruSans(
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.white,
                                              ),
                                            ),
                                            SizedBox(height: 4.0),
                                            Text(
                                              dateTimeFormat("relative", chatItem.timestamp!),
                                              style: GoogleFonts.duruSans(
                                                fontSize: 12.0,
                                                color: Color(0xFF666666),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              
                              SizedBox(height: 16.0),
                              
                              // Sign Out Button
                              Container(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () async {
                                    logFirebaseEvent('CHAT_PAGE_exit_to_app_ICN_ON_TAP');
                                    logFirebaseEvent('IconButton_auth');
                                    GoRouter.of(context).prepareAuthEvent();
                                    await authManager.signOut();
                                    GoRouter.of(context).clearRedirectLocation();
                                    context.goNamedAuth(SignInWidget.routeName, context.mounted);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xFF2a2a2a),
                                    foregroundColor: Colors.white,
                                    padding: EdgeInsets.symmetric(vertical: 12.0),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.exit_to_app, size: 18.0),
                                      SizedBox(width: 8.0),
                                      Text(
                                        'Cerrar Sesión',
                                        style: GoogleFonts.duruSans(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
