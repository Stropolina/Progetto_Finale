import 'package:fizook/model/auth_bag_provider.dart';
import 'package:fizook/model/common_provider.dart';
import 'package:fizook/pages/booking.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import 'home.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({Key? key}) : super(key: key);

  //final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final common = Provider.of<CommonProvider>(context);

    void onItemTapped(int index) {
      common.currentIndex = index;

      switch (index) {
        case 0:
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => const HomeWidget()));
          break;

        case 1:
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => const BookingWidget()));
          break;

        case 2:
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => const ProfileWidget()));
          break;
      }
    }

    return Consumer<AuthBagProvider>(builder: (context, authBag, _) => 
      GestureDetector(
        child: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: common.currentIndex,
            onTap: onItemTapped,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedIconTheme:
                const IconThemeData(color: Color(0xFFDB2777), size: 30),
            unselectedIconTheme: const IconThemeData(size: 30),
            backgroundColor: Colors.white,
            elevation: 0,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Symbols.calendar_today),
                label: 'Timetable',
              ),
              BottomNavigationBarItem(
                icon: Icon(Symbols.edit_calendar),
                label: 'Booking',
              ),
              BottomNavigationBarItem(
                icon: Icon(Symbols.account_circle),
                label: 'Profile',
              ),
            ],
          ),
          //key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).info,
          body: Align(
            alignment: const AlignmentDirectional(0, 0),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 100, 0, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                        child: Container(
                          width: 200,
                          height: 200,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color(0xFF4B39EF), Color(0xFFEE8B60)],
                              stops: [0, 1],
                              begin: AlignmentDirectional(1, -1),
                              end: AlignmentDirectional(-1, 1),
                            ),
                            shape: BoxShape.circle,
                          ),
                          child: Align(
                            alignment: const AlignmentDirectional(0, 0),
                            child: Padding(
                              padding: const EdgeInsets.all(4),
                              child: Container(
                                width: 185,
                                height: 185,
                                decoration: const BoxDecoration(
                                  color: Color(0xFF101213),
                                  shape: BoxShape.circle,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(4),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: Image.network(
                                      authBag.user.photo!,
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(0, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 16, 0, 0),
                                child: Text(
                                  "${authBag.user.firstName} ${authBag.user.lastName}",
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .override(
                                        fontFamily: 'Plus Jakarta Sans',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontSize: 32,
                                        letterSpacing: 0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16, 8, 16, 0),
                                child: GradientText(
                                  authBag.user.email,
                                  style: FlutterFlowTheme.of(context)
                                      .labelSmall
                                      .override(
                                        fontFamily: 'Plus Jakarta Sans',
                                        color: const Color(0xFF39D2C0),
                                        fontSize: 18,
                                        letterSpacing: 0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                  colors: const [
                                    Color(0xFF4B39EF),
                                    Color(0xFFEE8B60)
                                  ],
                                  gradientDirection: GradientDirection.ltr,
                                  gradientType: GradientType.linear,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16, 8, 16, 0),
                                child: Text(
                                  authBag.classes.elementAt(0).name,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontSize: 20,
                                        letterSpacing: 0,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(0, 1),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16, 4, 16, 0),
                              child: Text(
                                authBag.user.userType,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      fontSize: 28,
                                      letterSpacing: 0,
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
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
        ),
      ),
    );
  }
}
