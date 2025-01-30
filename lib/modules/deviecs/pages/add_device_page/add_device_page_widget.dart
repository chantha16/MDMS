import '/components/layout/main_layout_v1/main_layout_v1_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/modules/deviecs/components/c_add_device/c_add_device_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'add_device_page_model.dart';
export 'add_device_page_model.dart';

class AddDevicePageWidget extends StatefulWidget {
  const AddDevicePageWidget({super.key});

  @override
  State<AddDevicePageWidget> createState() => _AddDevicePageWidgetState();
}

class _AddDevicePageWidgetState extends State<AddDevicePageWidget> {
  late AddDevicePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddDevicePageModel());

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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: wrapWithModel(
            model: _model.mainLayoutV1Model,
            updateCallback: () => safeSetState(() {}),
            child: MainLayoutV1Widget(
              body: () => CAddDeviceWidget(),
            ),
          ),
        ),
      ),
    );
  }
}
