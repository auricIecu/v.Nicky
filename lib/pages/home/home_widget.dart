import '/auth/firebase_auth/auth_util.dart';
import '/backend/ai_agents/ai_agent.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home_model.dart';
export 'home_model.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  static String routeName = 'Home';
  static String routePath = '/home';

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> with TickerProviderStateMixin {
  late HomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Home'});
    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    animationsMap.addAll({
      'rowOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 260.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 260.0.ms,
            begin: Offset(0.0, 18.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        applyInitialState: true,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 100.0.ms,
            duration: 260.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 100.0.ms,
            duration: 260.0.ms,
            begin: Offset(0.0, 18.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 350.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(64.0, 100.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 350.0.ms,
            begin: 1.0,
            end: 0.0,
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                  border: Border(
                    bottom: BorderSide(
                      color: Color(0xFF2a2a2a),
                      width: 1.0,
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.all(8.0),
                      child: Image.asset(
                        'assets/botones v1/Singo usuario.png',
                        width: 24.0,
                        height: 24.0,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Text(
                      'Orito',
                      style: GoogleFonts.duruSans(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFFf7c61a),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(8.0),
                      child: Image.asset(
                        'assets/botones v1/Mensajes peer to peer.png',
                        width: 24.0,
                        height: 24.0,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              ),
              
              // Main Content Area
              Expanded(
                child: Container(
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Logo
                      Image.asset(
                        'assets/botones v1/Logo1.png',
                        width: 120.0,
                        height: 120.0,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(height: 32.0),
                      
                      // Welcome Text
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 32.0),
                        child: Text(
                          'Inicio del saber',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.duruSans(
                            fontSize: 24.0,
                            fontWeight: FontWeight.w300,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 32.0),
                        child: Text(
                          'Pregunta algo para comenzar',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.duruSans(
                            fontSize: 16.0,
                            color: Colors.white.withOpacity(0.7),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
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
                          width: 20.0,
                          height: 20.0,
                          fit: BoxFit.contain,
                        ),
                      ),
                      
                      // Text input
                      Expanded(
                        child: TextFormField(
                          controller: _model.textController,
                          focusNode: _model.textFieldFocusNode,
                          onFieldSubmitted: (_) async {
                            if (_model.textController.text.trim().isNotEmpty) {
                              // Create new chat and navigate
                              logFirebaseEvent('HOME_PAGE_TextField_ON_TEXTFIELD_SUBMIT');
                              logFirebaseEvent('TextField_backend_call');
                              var chatsRecordReference = ChatsRecord.collection.doc();
                              await chatsRecordReference.set(createChatsRecordData(
                                uid: currentUserReference,
                                timestamp: getCurrentTimestamp,
                                title: _model.textController.text,
                              ));
                              _model.chatRef = ChatsRecord.getDocumentFromData(
                                createChatsRecordData(
                                  uid: currentUserReference,
                                  timestamp: getCurrentTimestamp,
                                  title: _model.textController.text,
                                ),
                                chatsRecordReference,
                              );
                              logFirebaseEvent('TextField_backend_call');
                              await MessagesRecord.createDoc(_model.chatRef!.reference)
                                  .set(createMessagesRecordData(
                                timestamp: getCurrentTimestamp,
                                firstMessage: true,
                                message: _model.textController.text,
                                user: 'user',
                                uid: currentUserReference,
                              ));
                              logFirebaseEvent('TextField_update_app_state');
                              FFAppState().awaitingReply = true;
                              safeSetState(() {});
                              logFirebaseEvent('TextField_a_i_agent');
                              await callAiAgent(
                                context: context,
                                prompt: _model.textController.text,
                                threadId: _model.chatRef?.reference.id ?? '',
                                agentCloudFunctionName: 'test',
                                provider: 'GOOGLE',
                                agentJson: "{\"status\":\"LIVE\",\"identifier\":{\"name\":\"test\",\"key\":\"a48q0\"},\"name\":\"Test\",\"description\":\"Asistente IA en Español llamado Orito IA\",\"aiModel\":{\"provider\":\"GOOGLE\",\"model\":\"gemini-2.5-pro\",\"parameters\":{\"temperature\":{\"inputValue\":1},\"maxTokens\":{\"inputValue\":32000},\"topP\":{\"inputValue\":0.95}},\"messages\":[{\"role\":\"SYSTEM\",\"text\":\"Asistente IA en Español llamado Orito IA\"}]},\"requestOptions\":{\"requestTypes\":[\"PLAINTEXT\"]},\"responseOptions\":{\"responseType\":\"PLAINTEXT\"}}",
                                responseType: 'PLAINTEXT',
                              ).then((generatedText) {
                                safeSetState(() => _model.botMessage = generatedText);
                              });
                              logFirebaseEvent('TextField_backend_call');
                              await MessagesRecord.createDoc(_model.chatRef!.reference)
                                  .set(createMessagesRecordData(
                                timestamp: getCurrentTimestamp,
                                firstMessage: false,
                                message: _model.botMessage,
                                user: 'gpt',
                                uid: currentUserReference,
                              ));
                              logFirebaseEvent('TextField_update_app_state');
                              FFAppState().awaitingReply = false;
                              safeSetState(() {});
                              logFirebaseEvent('TextField_navigate_to');
                              context.goNamed(
                                ChatWidget.routeName,
                                queryParameters: {
                                  'chatRef': serializeParam(
                                    _model.chatRef?.reference,
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
                          if (_model.textController.text.trim().isNotEmpty) {
                            // Same logic as onFieldSubmitted
                            logFirebaseEvent('HOME_PAGE_Send_Button_ON_TAP');
                            logFirebaseEvent('Send_Button_backend_call');
                            var chatsRecordReference = ChatsRecord.collection.doc();
                            await chatsRecordReference.set(createChatsRecordData(
                              uid: currentUserReference,
                              timestamp: getCurrentTimestamp,
                              title: _model.textController.text,
                            ));
                            _model.chatRef = ChatsRecord.getDocumentFromData(
                              createChatsRecordData(
                                uid: currentUserReference,
                                timestamp: getCurrentTimestamp,
                                title: _model.textController.text,
                              ),
                              chatsRecordReference,
                            );
                            logFirebaseEvent('Send_Button_backend_call');
                            await MessagesRecord.createDoc(_model.chatRef!.reference)
                                .set(createMessagesRecordData(
                              timestamp: getCurrentTimestamp,
                              firstMessage: true,
                              message: _model.textController.text,
                              user: 'user',
                              uid: currentUserReference,
                            ));
                            logFirebaseEvent('Send_Button_update_app_state');
                            FFAppState().awaitingReply = true;
                            safeSetState(() {});
                            logFirebaseEvent('Send_Button_a_i_agent');
                            await callAiAgent(
                              context: context,
                              prompt: _model.textController.text,
                              threadId: _model.chatRef?.reference.id ?? '',
                              agentCloudFunctionName: 'test',
                              provider: 'GOOGLE',
                              agentJson: "{\"status\":\"LIVE\",\"identifier\":{\"name\":\"test\",\"key\":\"a48q0\"},\"name\":\"Test\",\"description\":\"Asistente IA en Español llamado Orito IA\",\"aiModel\":{\"provider\":\"GOOGLE\",\"model\":\"gemini-2.5-pro\",\"parameters\":{\"temperature\":{\"inputValue\":1},\"maxTokens\":{\"inputValue\":32000},\"topP\":{\"inputValue\":0.95}},\"messages\":[{\"role\":\"SYSTEM\",\"text\":\"Asistente IA en Español llamado Orito IA\"}]},\"requestOptions\":{\"requestTypes\":[\"PLAINTEXT\"]},\"responseOptions\":{\"responseType\":\"PLAINTEXT\"}}",
                              responseType: 'PLAINTEXT',
                            ).then((generatedText) {
                              safeSetState(() => _model.botMessage = generatedText);
                            });
                            logFirebaseEvent('Send_Button_backend_call');
                            await MessagesRecord.createDoc(_model.chatRef!.reference)
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
                            logFirebaseEvent('Send_Button_navigate_to');
                            context.goNamed(
                              ChatWidget.routeName,
                              queryParameters: {
                                'chatRef': serializeParam(
                                  _model.chatRef?.reference,
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
                            safeSetState(() {});
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.all(12.0),
                          child: Image.asset(
                            'assets/botones v1/Signo enviar.png',
                            width: 20.0,
                            height: 20.0,
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
                  border: Border(
                    top: BorderSide(
                      color: Color(0xFF2a2a2a),
                      width: 1.0,
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildNavButton('assets/botones v1/Signo buscar.png', () {}),
                    _buildNavButton('assets/botones v1/Signo inventario.png', () {}),
                    _buildNavButton('assets/botones v1/Signo importaciones.png', () {}),
                    _buildNavButton('assets/botones v1/Signo historial.png', () {}),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  Widget _buildNavButton(String assetPath, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(12.0),
        child: Image.asset(
          assetPath,
          width: 24.0,
          height: 24.0,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
