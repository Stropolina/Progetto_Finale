import 'package:flutter/material.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:provider/provider.dart';

import '../model/auth_bag_provider.dart';
import '../model/booking.dart';
import '../model/common_provider.dart';
import '../model/response.dart';
import '../model/booking_provider.dart';
import '../model/booking_view.dart';

import '../services/booking_service.dart';
import '../services/common.dart';
import 'booking_modify.dart';
import 'home.dart';
import 'profile.dart';

class BookingWidget extends StatelessWidget {
  const BookingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final common = Provider.of<CommonProvider>(context);
    final bookingState = Provider.of<BookingProvider>(context);
    final authBag = Provider.of<AuthBagProvider>(context);
    getBookings(bookingState, authBag);

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

    return Consumer<BookingProvider>(builder: (context, bookingState, _) => GestureDetector(
      child: Scaffold(bottomNavigationBar: BottomNavigationBar(
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
        backgroundColor: Colors.white,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (_) => const BookingModifyWidget()));
          },
          backgroundColor: const Color(0xFFDB2777),
          elevation: 8,
          child: Icon(
            Icons.add,
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
                              'Le mie prenotazioni',
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
                              'Lista delle prenotazioni effettuate',
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
                              itemCount: bookingState.bookings.length,
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
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      // ConfirmDelete
                                      var confirmDialogResponse = await showDialog<bool>(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                backgroundColor: Colors.white,
                                                title: Text('Cancella prenotazione',
                                                  style: FlutterFlowTheme.of(context)
                                                      .headlineMedium
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color: Color(0xFF15161E),
                                                        fontSize: 24,
                                                        letterSpacing: 0,
                                                        fontWeight: FontWeight.w500,
                                                      ),),
                                                content: Text('Sei sicuro di voler cancellare la prenotazione ${bookingState.bookings[index].activity} del ${getLongDate(DateTime.parse(bookingState.bookings[index].start), 'dd/MM/yyyy')}',
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'Plus Jakarta Sans',
                                                        color: Colors.black,
                                                        fontSize: 14,
                                                        letterSpacing: 0,
                                                        fontWeight: FontWeight.w500,
                                                      ),),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(alertDialogContext, false),
                                                    child: Text('Annulla',
                                                      style: FlutterFlowTheme.of(context)
                                                          .labelMedium
                                                          .override(
                                                            fontFamily: 'Plus Jakarta Sans',
                                                            color: Colors.black,
                                                            fontSize: 14,
                                                            letterSpacing: 0,
                                                            fontWeight: FontWeight.w500,
                                                          ),),
                                                  ),
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(alertDialogContext, true),
                                                    child: Text('Conferma',
                                                      style: FlutterFlowTheme.of(context)
                                                          .labelMedium
                                                          .override(
                                                            fontFamily: 'Plus Jakarta Sans',
                                                            color: const Color(0xFFDB2777),
                                                            fontSize: 14,
                                                            letterSpacing: 0,
                                                            fontWeight: FontWeight.w500,
                                                          ),),
                                                  ),
                                                ],
                                              );
                                            },
                                          ) ??
                                          false;

                                        if (confirmDialogResponse) {
                                          deleteBooking(bookingState.bookings[index], bookingState);
                                        }
                                    },
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
                                          width: 2,
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
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 12, 0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        getTime(bookingState.bookings[index].start),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Plus Jakarta Sans',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize: 14,
                                                                  letterSpacing:
                                                                      0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                      ),
                                                      Text(
                                                        getTime(bookingState.bookings[index].end),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Plus Jakarta Sans',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  letterSpacing:
                                                                      0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                      ),
                                                    ].divide(
                                                        const SizedBox(width: 6)),
                                                  ),
                                                  Text(
                                                    getLongDate(DateTime.parse(bookingState.bookings[index].start), 'dd/MM/yyyy'),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Plus Jakarta Sans',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 14,
                                                          letterSpacing: 0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Text (
                                                  bookingState.bookings[index].subject != null ? bookingState.bookings[index].subject! : "",
                                                  textAlign: TextAlign.end,
                                                  style: FlutterFlowTheme.of(
                                                        context)
                                                    .headlineSmall
                                                    .override(
                                                      fontFamily: 'Outfit',
                                                      color:
                                                          const Color(0xFF15161E),
                                                      fontSize: 20,
                                                      letterSpacing: 0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                ),
                                                Text(
                                                  bookingState.bookings[index].activity != null ? bookingState.bookings[index].activity! : "",
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'Plus Jakarta Sans',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        fontSize: 14,
                                                        letterSpacing: 0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Text(
                                                      bookingState.bookings[index].classroom != null ? bookingState.bookings[index].classroom! : "",
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
                                                      bookingState.bookings[index].room != null ? bookingState.bookings[index].room! : "",
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
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }
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
    ));
  }

  void getBookings(BookingProvider bookingState, AuthBagProvider authBag) async {
    var userId = authBag.user.id;
    
    BookingService service = BookingService();
    Response<List<BookingView>> response = await service.getMyBookings(userId);
    if (!response.hasError) {
      bookingState.bookings = response.result;
    }
  }

  void deleteBooking(BookingView booking, BookingProvider bookingState) async {
    BookingService service = BookingService();
    Response<bool> response = await service.deleteBooking(booking.id);
    
    if (!response.hasError && response.result == true) {
      bookingState.bookings.remove(booking);
    }
  }
}
