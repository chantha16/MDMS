// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/actions/actions.dart' as action_blocks;
import "package:epower_library_llyhdh/backend/schema/structs/index.dart"
    as epower_library_llyhdh_data_schema;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_spinkit/flutter_spinkit.dart';

class RippleLoadingWidget extends StatefulWidget {
  const RippleLoadingWidget({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<RippleLoadingWidget> createState() => _RippleLoadingWidgetState();
}

class _RippleLoadingWidgetState extends State<RippleLoadingWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitRipple(
        color: FlutterFlowTheme.of(context).primary,
        size: 50,
      ),
    );
  }
}
