import 'package:flutterflow_ui/flutterflow_ui.dart';
import '../pages/home.dart' show HomeWidget;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeModel extends FlutterFlowModel<HomeWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  DateTime? datePicked;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}