
import 'package:fizook/model/auth_bag_provider.dart';
import 'package:fizook/model/common_provider.dart';
import 'package:fizook/pages/profile.dart';
import 'package:fizook/services/auth_service.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../model/response.dart';

class LoginWidget extends StatelessWidget {
  LoginWidget({Key? key}) : super(key: key);

  //final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  Widget build(BuildContext context) {
    final authBag = Provider.of<AuthBagProvider>(context);
    final common = Provider.of<CommonProvider>(context);

    void signIn() async {
      Response<AuthBagProvider> response = await AuthService().signInWithGoogle();

      if (!response.hasError) {
        authBag.classes = response.result.classes;
        authBag.isAuthenticated = response.result.isAuthenticated;
        authBag.oauthUid = response.result.oauthUid;
        authBag.permissions = response.result.permissions;
        authBag.role = response.result.role;
        authBag.user = response.result.user;

        common.currentIndex = 2;
        
        Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => const ProfileWidget()
        ));
      }
    }

    animationsMap.addAll({
      'containerOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effects: [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 400.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 400.0.ms,
            begin: const Offset(3.0, 3.0),
            end: const Offset(1.0, 1.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effects: [
          VisibilityEffect(duration: 300.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 300.0.ms,
            duration: 300.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          ScaleEffect(
            curve: Curves.bounceOut,
            delay: 300.0.ms,
            duration: 300.0.ms,
            begin: const Offset(0.6, 0.6),
            end: const Offset(1.0, 1.0),
          ),
        ],
      ),
      'textOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effects: [
          VisibilityEffect(duration: 350.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 350.0.ms,
            duration: 400.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 350.0.ms,
            duration: 400.0.ms,
            begin: const Offset(0.0, 30.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'rowOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effects: [
          VisibilityEffect(duration: 300.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 300.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          ScaleEffect(
            curve: Curves.bounceOut,
            delay: 300.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.6, 0.6),
            end: const Offset(1.0, 1.0),
          ),
        ],
      ),
      'textOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effects: [
          VisibilityEffect(duration: 400.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 400.0.ms,
            duration: 400.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 400.0.ms,
            duration: 400.0.ms,
            begin: const Offset(0.0, 30.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'rowOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effects: [
          VisibilityEffect(duration: 300.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 300.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          ScaleEffect(
            curve: Curves.bounceOut,
            delay: 300.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.6, 0.6),
            end: const Offset(1.0, 1.0),
          ),
        ],
      ),
    });

    return GestureDetector(
      child: Scaffold(
        //key: scaffoldKey,
        backgroundColor: Colors.white,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                height: 500,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF4B39EF),
                      Color(0xFFFF5963),
                      Color(0xFFEE8B60)
                    ],
                    stops: [0, 0.5, 1],
                    begin: AlignmentDirectional(-1, -1),
                    end: AlignmentDirectional(1, 1),
                  ),
                ),
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0x00FFFFFF), Colors.white],
                      stops: [0, 1],
                      begin: AlignmentDirectional(0, -1),
                      end: AlignmentDirectional(0, 1),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Flexible(
                                    child: Container(
                                      width: 120,
                                      height: 120,
                                      decoration: const BoxDecoration(
                                        color: Color(0xCCFFFFFF),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          child: Image.asset(
                                            "assets/images/fizook-logo.png",
                                            width: 100,
                                            height: 100,
                                            fit: BoxFit.fill,
                                            errorBuilder:
                                                (context, error, stackTrace) =>
                                                    Image.asset(
                                              "assets/images/fizook-logo.png",
                                              width: 100,
                                              height: 100,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ).animateOnPageLoad(animationsMap[
                                        'containerOnPageLoadAnimation2']!),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0, 15, 0, 0),
                                    child: Text(
                                      'FiZooK',
                                      style: FlutterFlowTheme.of(context)
                                          .displaySmall
                                          .override(
                                            fontFamily: 'PT Sans',
                                            color: const Color(0xFF101213),
                                            fontSize: 36,
                                            letterSpacing: 0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ).animateOnPageLoad(animationsMap[
                                        'textOnPageLoadAnimation1']!),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(16, 24, 16, 24),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    44, 8, 44, 0),
                                child: Text(
                                  'Accedi  con il tuo account ',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Plus Jakarta Sans',
                                        color: const Color(0xFF57636C),
                                        fontSize: 16,
                                        letterSpacing: 1,
                                        fontWeight: FontWeight.w600,
                                        lineHeight: 1.5,
                                      ),
                                ).animateOnPageLoad(
                                    animationsMap['textOnPageLoadAnimation2']!),
                              ),
                            ),
                          ],
                        ).animateOnPageLoad(
                            animationsMap['rowOnPageLoadAnimation1']!),
                      ),
                    ],
                  ),
                ),
              ).animateOnPageLoad(
                  animationsMap['containerOnPageLoadAnimation1']!),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16, 24, 16, 44),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Align(
                      alignment: const AlignmentDirectional(0, 0),
                      child: FFButtonWidget(
                        onPressed: () {
                          signIn();
                        },
                        text: 'Continua con Google',
                        icon: const FaIcon(
                          FontAwesomeIcons.google,
                          size: 20,
                        ),
                        options: FFButtonOptions(
                          width: 230,
                          height: 44,
                          padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                          iconPadding:
                              const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                          color: Colors.white,
                          textStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Plus Jakarta Sans',
                                    color: const Color(0xFF101213),
                                    fontSize: 14,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.bold,
                                  ),
                          elevation: 0,
                          borderSide: const BorderSide(
                            color: Color(0xFFE0E3E7),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(40),
                          hoverColor: const Color(0xFFF1F4F8),
                        ),
                      ),
                    ),
                  ),
                ],
              ).animateOnPageLoad(animationsMap['rowOnPageLoadAnimation2']!),
            ),
          ],
        ),
      ),
    );
  }
}
