import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/body/body_widget.dart';
import 'dart:ui';
import 'sent_box1_widget.dart' show SentBox1Widget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SentBox1Model extends FlutterFlowModel<SentBox1Widget> {
  ///  State fields for stateful widgets in this page.

  // Model for Body component.
  late BodyModel bodyModel;

  @override
  void initState(BuildContext context) {
    bodyModel = createModel(context, () => BodyModel());
  }

  @override
  void dispose() {
    bodyModel.dispose();
  }
}
