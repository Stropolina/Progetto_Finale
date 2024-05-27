import 'package:fizook/model/auth_bag_provider.dart';
import 'package:fizook/model/booking_parameters.dart';
import 'package:fizook/model/timetable_item.dart';
import 'package:fizook/pages/booking.dart';
import 'package:fizook/services/booking_service.dart';
import 'package:fizook/services/common.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:provider/provider.dart';

import '../model/common_provider.dart';

import '../model/response.dart';
import 'profile.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({Key? key}) : super(key: key);

  //final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final common = Provider.of<CommonProvider>(context);
    final authBag = Provider.of<AuthBagProvider>(context);
    getTimetable(common, authBag);

    void onItemTapped(int index) {
      common.currentIndex = index;
      common.currentDate = getCurrentTimestamp;

      switch (index) {
        case 0:
          Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => const HomeWidget()
          ));
          break;

        case 1:
          Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => const BookingWidget()
          ));
          break;

        case 2:
          Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => const ProfileWidget()
          ));
          break;
      }
    }

    return Consumer<CommonProvider>(builder: (context, common, _) => GestureDetector(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: common.currentIndex,
            onTap: onItemTapped,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedIconTheme: const IconThemeData(color: Color(0xFFDB2777), size: 30),
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
        backgroundColor: Colors.white,
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await showModalBottomSheet<bool>(
                context: context,
                builder: (context) {
                  final datePickedCupertinoTheme = CupertinoTheme.of(context);
                  return Container(
                    height: MediaQuery.of(context).size.height / 3,
                    width: MediaQuery.of(context).size.width,
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    child: CupertinoTheme(
                      data: datePickedCupertinoTheme.copyWith(
                        textTheme: datePickedCupertinoTheme.textTheme.copyWith(
                          dateTimePickerTextStyle: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .override(
                                fontFamily: 'Outfit',
                                color: FlutterFlowTheme.of(context).primaryText,
                                letterSpacing: 0,
                              ),
                        ),
                      ),
                      child: CupertinoDatePicker(
                        mode: CupertinoDatePickerMode.date,
                        minimumDate: DateTime(1900),
                        initialDateTime: common.currentDate,
                        maximumDate: DateTime(2050),
                        backgroundColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        use24hFormat: false,
                        onDateTimeChanged: (newDateTime) => {
                          common.currentDate = newDateTime,
                          getTimetable(common, authBag)
                        },
                      ),
                    ),
                  );
                });
          },
          backgroundColor: const Color(0xFFDB2777),
          elevation: 8,
          child: Icon(
            Icons.calendar_month_outlined,
            color: FlutterFlowTheme.of(context).info,
            size: 24,
          ),
        ),
        body: SafeArea(
          top: true,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Align(
                  alignment: const AlignmentDirectional(0, -1),
                  child: Container(
                    width: double.infinity,
                    constraints: const BoxConstraints(
                      maxWidth: 1170,
                    ),
                    decoration: const BoxDecoration(),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsetsDirectional.fromSTEB(24, 20, 0, 0),
                            child: Text(
                              'Orario',
                              style: FlutterFlowTheme.of(context)
                                  .headlineMedium
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: const Color(0xFF15161E),
                                    fontSize: 24,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsetsDirectional.fromSTEB(24, 4, 0, 0),
                            child: Text(
                              'Lezioni di ${getLongDate(common.currentDate, "EEEE d MMMM yyyy")}',
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Plus Jakarta Sans',
                                    color: const Color(0xFF606A85),
                                    fontSize: 14,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                            child: ListView.builder(
                              itemCount: common.timetable.length,
                              padding: const EdgeInsets.fromLTRB(
                                0,
                                12,
                                0,
                                44,
                              ),
                              primary: false,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      16, 0, 16, 12),
                                  child: Container(
                                    width: double.infinity,
                                    constraints: const BoxConstraints(
                                      maxWidth: 570,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: const Color(0xFFE5E7EB),
                                        width: 1,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          16, 12, 16, 12),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 12, 0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  getTime(common.timetable[index].start),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'Plus Jakarta Sans',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontSize: 14,
                                                        letterSpacing: 0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                                Text(
                                                  getTime(common.timetable[index].end),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'Plus Jakarta Sans',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        letterSpacing: 0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Text(
                                                  common.timetable[index].subject != null ? common.timetable[index].subject! : "Nessuna lezione",
                                                  textAlign: TextAlign.end,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineSmall
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color:
                                                            const Color(0xFF15161E),
                                                        fontSize: 22,
                                                        letterSpacing: 0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Text(
                                                      common.timetable[index].classroom != null ? common.timetable[index].classroom! : "",
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .labelMedium
                                                          .override(
                                                            fontFamily:
                                                                'Plus Jakarta Sans',
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                            fontSize: 14,
                                                            letterSpacing: 0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                    ),
                                                    Text(
                                                      common.timetable[index].room != null ? common.timetable[index].room! : "",
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .labelMedium
                                                          .override(
                                                            fontFamily:
                                                                'Plus Jakarta Sans',
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                            fontSize: 14,
                                                            letterSpacing: 0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                    ),
                                                  ].divide(const SizedBox(width: 8)),
                                                ),
                                              ],
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
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),);
  }

  void getTimetable(CommonProvider common, AuthBagProvider authBag) async {
    var date = common.currentDate;
    
    BookingParameters parameters = BookingParameters();
    parameters.classroom = authBag.classes.elementAt(0).name;
    parameters.start = '${date.year}-${date.month}-${date.day} 00:00:00';
    parameters.end = '${date.year}-${date.month}-${date.day} 23:59:59';
    parameters.userType = authBag.user.userType;
    
    BookingService service = BookingService();
    Response<List<TimetableItem>> response = await service.bookingView(parameters);
    if (!response.hasError) {
      common.timetable = response.result;
    }
  }
}
