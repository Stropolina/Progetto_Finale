import 'package:fizook/model/auth_bag_provider.dart';
import 'package:fizook/model/subject.dart';
import 'package:fizook/model/user_booking.dart';
import 'package:fizook/services/activity_service.dart';
import 'package:fizook/services/common.dart';
import 'package:fizook/services/subject_service.dart';
import 'package:flutter/material.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../model/activity.dart';
import '../model/booking_provider.dart';
import '../model/class.dart';
import '../model/response.dart';
import '../model/room.dart';
import '../services/booking_service.dart';
import '../services/class_service.dart';
import '../services/room_service.dart';
import 'booking.dart';

class BookingModifyWidget extends StatelessWidget {
  const BookingModifyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bookingState = Provider.of<BookingProvider>(context);
    final authBag = Provider.of<AuthBagProvider>(context);
    getOptions(bookingState);

    return  Consumer<BookingProvider>(builder: (context, bookingState, _) => GestureDetector(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme:
              IconThemeData(color: FlutterFlowTheme.of(context).primaryText),
          automaticallyImplyLeading: true,
          title: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Prenotazioni',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Outfit',
                      color: const Color(0xFF15161E),
                      fontSize: 24,
                      letterSpacing: 0,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              Text(
                'Riempi le informazioni sottostanti per continuare.',
                style: FlutterFlowTheme.of(context).labelMedium.override(
                      fontFamily: 'Outfit',
                      color: const Color(0xFF606A85),
                      fontSize: 14,
                      letterSpacing: 0,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ].divide(const SizedBox(height: 4)),
          ),
          actions: [],
          centerTitle: false,
          elevation: 0,
        ),
        body: SafeArea(
          top: true,
          child: Form(
            autovalidateMode: AutovalidateMode.disabled,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(0, -1),
                          child: Container(
                            constraints: const BoxConstraints(
                              maxWidth: 770,
                            ),
                            decoration: const BoxDecoration(),
                            child: Padding(
                              padding:
                                  const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Align(
                                        alignment: const AlignmentDirectional(-1, 0),
                                        child: Text(
                                          'Data',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge
                                              .override(
                                                fontFamily: 'Figtree',
                                                color: const Color(0xFF15161E),
                                                fontSize: 16,
                                                letterSpacing: 0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(0, 2, 0, 0),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      await showModalBottomSheet<
                                                              bool>(
                                                          context: context,
                                                          builder: (context) {
                                                            final _datePicked1CupertinoTheme =
                                                                CupertinoTheme
                                                                    .of(context);
                                                            return Container(
                                                              height: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height /
                                                                  3,
                                                              width:
                                                                  MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width,
                                                              color:
                                                                  Colors.white,
                                                              child:
                                                                  CupertinoTheme(
                                                                data: _datePicked1CupertinoTheme
                                                                    .copyWith(
                                                                  textTheme: _datePicked1CupertinoTheme
                                                                      .textTheme
                                                                      .copyWith(
                                                                    dateTimePickerTextStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Outfit',
                                                                          color:
                                                                              const Color(0xFF15161E),
                                                                          fontSize:
                                                                              24,
                                                                          letterSpacing:
                                                                              0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                        ),
                                                                  ),
                                                                ),
                                                                child:
                                                                    CupertinoDatePicker(
                                                                  mode:
                                                                      CupertinoDatePickerMode
                                                                          .date,
                                                                  initialDateTime:
                                                                      bookingState.selectedDate,
                                                                  maximumDate:
                                                                      DateTime(
                                                                          2050),
                                                                  backgroundColor:
                                                                      Colors
                                                                          .white,
                                                                  use24hFormat:
                                                                      false,
                                                                  onDateTimeChanged:
                                                                    (newDateTime) => {
                                                                          bookingState.selectedDate = newDateTime
                                                                    },
                                                                ),
                                                              ),
                                                            );
                                                          });
                                                    },
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 48,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                        border: Border.all(
                                                          color:
                                                              const Color(0xFFE5E7EB),
                                                          width: 2,
                                                        ),
                                                      ),
                                                      child: Align(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                -1, 0),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(12,
                                                                      0, 0, 0),
                                                          child: Text(
                                                            dateTimeFormat('dd/MM/yyyy', bookingState.selectedDate),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyLarge
                                                                .override(
                                                                  fontFamily:
                                                                      'Figtree',
                                                                  color: const Color(
                                                                      0xFF15161E),
                                                                  fontSize: 16,
                                                                  letterSpacing:
                                                                      0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ].divide(const SizedBox(height: 4)),
                                            ),
                                          ),
                                        ].divide(const SizedBox(width: 12)),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0, 10, 0, 0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(-1, 0),
                                          child: Text(
                                            'Orario',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyLarge
                                                .override(
                                                  fontFamily: 'Figtree',
                                                  color: const Color(0xFF15161E),
                                                  fontSize: 16,
                                                  letterSpacing: 0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(0, 2, 0, 0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Dal',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .labelMedium
                                                          .override(
                                                            fontFamily:
                                                                'Outfit',
                                                            color: const Color(
                                                                0xFF606A85),
                                                            fontSize: 14,
                                                            letterSpacing: 0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                    ),
                                                    InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        await showModalBottomSheet<
                                                                bool>(
                                                            context: context,
                                                            builder: (context) {
                                                              final _datePicked2CupertinoTheme =
                                                                  CupertinoTheme
                                                                      .of(context);
                                                              return Container(
                                                                height: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .height /
                                                                    3,
                                                                width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width,
                                                                color: Colors
                                                                    .white,
                                                                child:
                                                                    CupertinoTheme(
                                                                  data: _datePicked2CupertinoTheme
                                                                      .copyWith(
                                                                    textTheme: _datePicked2CupertinoTheme
                                                                        .textTheme
                                                                        .copyWith(
                                                                      dateTimePickerTextStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .headlineMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Outfit',
                                                                            color:
                                                                                const Color(0xFF15161E),
                                                                            fontSize:
                                                                                24,
                                                                            letterSpacing:
                                                                                0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  child:
                                                                      CupertinoTimerPicker(
                                                                    mode: CupertinoTimerPickerMode
                                                                        .hm,
                                                                    initialTimerDuration:
                                                                        bookingState.startTime,
                                                                    backgroundColor:
                                                                        Colors
                                                                            .white,
                                                                    onTimerDurationChanged:
                                                                        (newTime) =>
                                                                            {bookingState.startTime = newTime},
                                                                  ),
                                                                ),
                                                              );
                                                            });
                                                      },
                                                      child: Container(
                                                        width: double.infinity,
                                                        height: 48,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(12),
                                                          border: Border.all(
                                                            color: const Color(
                                                                0xFFE5E7EB),
                                                            width: 2,
                                                          ),
                                                        ),
                                                        child: Align(
                                                          alignment:
                                                              const AlignmentDirectional(
                                                                  -1, 0),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        12,
                                                                        0,
                                                                        0,
                                                                        0),
                                                            child: Text(
                                                                  getDurationString(bookingState.startTime),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        'Figtree',
                                                                    color: const Color(
                                                                        0xFF15161E),
                                                                    fontSize:
                                                                        16,
                                                                    letterSpacing:
                                                                        0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ].divide(const SizedBox(height: 4)),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(0, 2, 0, 0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Al',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .labelMedium
                                                          .override(
                                                            fontFamily:
                                                                'Outfit',
                                                            color: const Color(
                                                                0xFF606A85),
                                                            fontSize: 14,
                                                            letterSpacing: 0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                    ),
                                                    InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        await showModalBottomSheet<
                                                                bool>(
                                                            context: context,
                                                            builder: (context) {
                                                              final _datePicked3CupertinoTheme =
                                                                  CupertinoTheme
                                                                      .of(context);
                                                              return Container(
                                                                height: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .height /
                                                                    3,
                                                                width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width,
                                                                color: Colors
                                                                    .white,
                                                                child:
                                                                    CupertinoTheme(
                                                                  data: _datePicked3CupertinoTheme
                                                                      .copyWith(
                                                                    textTheme: _datePicked3CupertinoTheme
                                                                        .textTheme
                                                                        .copyWith(
                                                                      dateTimePickerTextStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .headlineMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Outfit',
                                                                            color:
                                                                                const Color(0xFF15161E),
                                                                            fontSize:
                                                                                24,
                                                                            letterSpacing:
                                                                                0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  child:
                                                                      CupertinoTimerPicker(
                                                                    mode: CupertinoTimerPickerMode
                                                                        .hm,
                                                                    initialTimerDuration:
                                                                        bookingState.endTime,
                                                                    backgroundColor:
                                                                        Colors
                                                                            .white,
                                                                    onTimerDurationChanged:
                                                                        (newTime) =>
                                                                            {bookingState.endTime = newTime},
                                                                  ),
                                                                ),
                                                              );
                                                            });
                                                      },
                                                      child: Container(
                                                        width: double.infinity,
                                                        height: 48,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(12),
                                                          border: Border.all(
                                                            color: const Color(
                                                                0xFFE5E7EB),
                                                            width: 2,
                                                          ),
                                                        ),
                                                        child: Align(
                                                          alignment:
                                                              const AlignmentDirectional(
                                                                  -1, 0),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        12,
                                                                        0,
                                                                        0,
                                                                        0),
                                                            child: Text(
                                                                  getDurationString(bookingState.endTime),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        'Figtree',
                                                                    color: const Color(
                                                                        0xFF15161E),
                                                                    fontSize:
                                                                        16,
                                                                    letterSpacing:
                                                                        0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ].divide(const SizedBox(height: 4)),
                                                ),
                                              ),
                                            ),
                                          ].divide(const SizedBox(width: 12)),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0, 10, 0, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Align(
                                                alignment:
                                                    const AlignmentDirectional(-1, 0),
                                                child: Text(
                                                  'Attività',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily: 'Figtree',
                                                        color:
                                                            const Color(0xFF15161E),
                                                        fontSize: 16,
                                                        letterSpacing: 0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                ),
                                              ),
                                              Align(
                                                alignment:
                                                    const AlignmentDirectional(-1, 0),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(0, 2, 0, 0),
                                                  child: DropdownMenu<String>(
                                                    inputDecorationTheme: InputDecorationTheme(
                                                      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                                                      focusColor: Colors.pinkAccent,
                                                      constraints: BoxConstraints.tight(
                                                        const Size.fromHeight(50)),
                                                      border: OutlineInputBorder(
                                                        borderRadius: BorderRadius.circular(12),
                                                        borderSide: const BorderSide(color: Colors.white60, width: 2.0),
                                                      ),
                                                      focusedBorder: OutlineInputBorder(
                                                        borderRadius: BorderRadius.circular(12),
                                                        borderSide: const BorderSide(color: Color.fromARGB(255, 219, 39, 119), width: 1.0),
                                                      ),
                                                    ),
                                                    requestFocusOnTap: true,
                                                    menuHeight: 120,
                                                    width: 192,
                                                    dropdownMenuEntries: bookingState.activities.map((activity) {
                                                      return DropdownMenuEntry<String>(value: activity.id, label: activity.name);
                                                    }).toList(),
                                                    initialSelection: bookingState.activities.isNotEmpty ? bookingState.activities.first.id : "",
                                                    onSelected: (String? value) {
                                                      bookingState.booking.activityId = int.parse(value!);
                                                    }
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Align(
                                                alignment:
                                                    const AlignmentDirectional(-1, 0),
                                                child: Text(
                                                  'Aula',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily: 'Figtree',
                                                        color:
                                                            const Color(0xFF15161E),
                                                        fontSize: 16,
                                                        letterSpacing: 0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                ),
                                              ),
                                              Align(
                                                alignment:
                                                    const AlignmentDirectional(-1, 0),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(0, 2, 0, 0),
                                                  child: DropdownMenu<String>(
                                                    inputDecorationTheme: InputDecorationTheme(
                                                      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                                                      focusColor: Colors.pinkAccent,
                                                      constraints: BoxConstraints.tight(const 
                                                        Size.fromHeight(50)),
                                                      border: OutlineInputBorder(
                                                        borderRadius: BorderRadius.circular(12),
                                                        borderSide: const BorderSide(color: Colors.white60, width: 2.0),
                                                      ),
                                                      focusedBorder: OutlineInputBorder(
                                                        borderRadius: BorderRadius.circular(12),
                                                        borderSide: const BorderSide(color: Color.fromARGB(255, 219, 39, 119), width: 1.0),
                                                      ),
                                                    ),
                                                    requestFocusOnTap: true,
                                                    menuHeight: 120,
                                                    width: 192,
                                                    dropdownMenuEntries: bookingState.rooms.map((room) {
                                                      return DropdownMenuEntry<String>(value: room.id, label: '${room.name} ${room.code}');
                                                    }).toList(),
                                                    initialSelection: bookingState.rooms.isNotEmpty ? bookingState.rooms.first.id : "",
                                                    onSelected: (String? value) {
                                                      bookingState.booking.roomId = int.parse(value!);
                                                    }
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ].divide(const SizedBox(width: 12)),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0, 10, 0, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Align(
                                                alignment:
                                                    const AlignmentDirectional(-1, 0),
                                                child: Text(
                                                  'Materia',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily: 'Figtree',
                                                        color:
                                                            const Color(0xFF15161E),
                                                        fontSize: 16,
                                                        letterSpacing: 0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                ),
                                              ),
                                              Align(
                                                alignment:
                                                    const AlignmentDirectional(-1, 0),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(0, 2, 0, 0),
                                                  child: DropdownMenu<String>(
                                                    inputDecorationTheme: InputDecorationTheme(
                                                      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                                                      focusColor: Colors.pinkAccent,
                                                      constraints: BoxConstraints.tight(const 
                                                        Size.fromHeight(50)),
                                                      border: OutlineInputBorder(
                                                        borderRadius: BorderRadius.circular(12),
                                                        borderSide: const BorderSide(color: Colors.white60, width: 2.0),
                                                      ),
                                                      focusedBorder: OutlineInputBorder(
                                                        borderRadius: BorderRadius.circular(12),
                                                        borderSide: const BorderSide(color: Color.fromARGB(255, 219, 39, 119), width: 1.0),
                                                      ),
                                                    ),
                                                    requestFocusOnTap: true,
                                                    menuHeight: 120,
                                                    width: 192,
                                                    dropdownMenuEntries: bookingState.subjects.map((subject) {
                                                      return DropdownMenuEntry<String>(value: subject.id, label: subject.name);
                                                    }).toList(),
                                                    initialSelection: bookingState.subjects.isNotEmpty ? bookingState.subjects.first.id : "",
                                                    onSelected: (String? value) {
                                                      bookingState.booking.subjectId = int.parse(value!);
                                                    }
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Align(
                                                alignment:
                                                    const AlignmentDirectional(-1, 0),
                                                child: Text(
                                                  'Classe',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily: 'Figtree',
                                                        color:
                                                            const Color(0xFF15161E),
                                                        fontSize: 16,
                                                        letterSpacing: 0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                ),
                                              ),
                                              Align(
                                                alignment:
                                                    const AlignmentDirectional(-1, 0),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(0, 2, 0, 0),
                                                  child: DropdownMenu<String>(
                                                    inputDecorationTheme: InputDecorationTheme(
                                                      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                                                      focusColor: Colors.pinkAccent,
                                                      constraints: BoxConstraints.tight(const 
                                                        Size.fromHeight(50)),
                                                      border: OutlineInputBorder(
                                                        borderRadius: BorderRadius.circular(12),
                                                        borderSide: const BorderSide(color: Colors.white60, width: 2.0),
                                                      ),
                                                      focusedBorder: OutlineInputBorder(
                                                        borderRadius: BorderRadius.circular(12),
                                                        borderSide: const BorderSide(color: Color.fromARGB(255, 219, 39, 119), width: 1.0),
                                                      ),
                                                    ),
                                                    requestFocusOnTap: true,
                                                    menuHeight: 120,
                                                    width: 192,
                                                    dropdownMenuEntries: bookingState.classes.map((classroom) {
                                                      return DropdownMenuEntry<String>(value: classroom.id, label: classroom.name);
                                                    }).toList(),
                                                    initialSelection: bookingState.classes.isNotEmpty ? bookingState.classes.first.id : "",
                                                    onSelected: (String? value) {
                                                      bookingState.booking.classroomId = int.parse(value!);
                                                    }
                                                  ),
                                                )
                                              ),
                                            ],
                                          ),
                                        ),
                                      ].divide(const SizedBox(width: 12)),
                                    ),
                                  ),
                                ]
                                    .divide(const SizedBox(height: 12))
                                    .addToEnd(const SizedBox(height: 32)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  constraints: const BoxConstraints(
                    maxWidth: 770,
                  ),
                  decoration: const BoxDecoration(),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 12),
                    child: FFButtonWidget(
                      onPressed: () {
                        prepareForStore(bookingState, context, authBag);
                      },
                      text: 'Aggiungi',
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 48,
                        padding: const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                        iconPadding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                        color: const Color(0xFFDB2777),
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Figtree',
                                  color: Colors.white,
                                  fontSize: 16,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.w500,
                                ),
                        elevation: 3,
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }

  void getOptions(BookingProvider bookingState) async {
    ActivityService serviceActivity = ActivityService();
    Response<List<Activity>> responseActivity= await serviceActivity.getActivities();

    RoomService serviceRoom = RoomService();
    Response<List<Room>> responseRoom= await serviceRoom.getRooms();

    SubjectService serviceSubject = SubjectService();
    Response<List<Subject>> responseSubject= await serviceSubject.getSubjects();

    ClassService serviceClass = ClassService();
    Response<List<Class>> responseClass= await serviceClass.getClasses();

    if (!responseActivity.hasError) {
      bookingState.activities = responseActivity.result;
    }

    if (!responseRoom.hasError) {
      bookingState.rooms = responseRoom.result;
    }

    if (!responseSubject.hasError) {
      bookingState.subjects = responseSubject.result;
    }

    if (!responseClass.hasError) {
      bookingState.classes = responseClass.result;
    }
  }

  void prepareForStore(BookingProvider bookingState, BuildContext context, AuthBagProvider authBag) async {
    var startTime = bookingState.selectedDate.add(bookingState.startTime).toString();
    var endTime = bookingState.selectedDate.add(bookingState.endTime).toString();

    bookingState.booking.start = startTime;
    bookingState.booking.end = endTime;

    UserBooking userBooking = UserBooking();
    userBooking.booking = bookingState.booking;
    userBooking.userId = int.parse(authBag.user.id);
    userBooking.id = bookingState.booking.id;

    BookingService service = BookingService();
    Response<bool> response = await service.addBooking(userBooking);
    if (!response.hasError && response.result == true) {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => const BookingWidget()));
    }
  }
}
