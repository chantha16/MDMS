import '/backend/schema/enums/enums.dart';
import '/components/layout/main_layout_v2/main_layout_v2_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/modules/deviecs/components/c_add_device/c_add_device_widget.dart';
import 'package:flutter/material.dart';
import 'fffff_model.dart';
export 'fffff_model.dart';

class FffffWidget extends StatefulWidget {
  const FffffWidget({super.key});

  @override
  State<FffffWidget> createState() => _FffffWidgetState();
}

class _FffffWidgetState extends State<FffffWidget> {
  late FffffModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FffffModel());

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
            model: _model.mainLayoutV2Model,
            updateCallback: () => safeSetState(() {}),
            child: MainLayoutV2Widget(
              menu: MenuItems.Devices,
              child: () => const CAddDeviceWidget(),
            ),
          ),
        ),
      ),
    );
  }
}
