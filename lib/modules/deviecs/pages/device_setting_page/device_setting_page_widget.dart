import '/components/layout/main_layout_v1/main_layout_v1_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/modules/deviecs/components/c_device_setting/c_device_setting_widget.dart';
import 'package:flutter/material.dart';
import 'device_setting_page_model.dart';
export 'device_setting_page_model.dart';

class DeviceSettingPageWidget extends StatefulWidget {
  const DeviceSettingPageWidget({super.key});

  @override
  State<DeviceSettingPageWidget> createState() =>
      _DeviceSettingPageWidgetState();
}

class _DeviceSettingPageWidgetState extends State<DeviceSettingPageWidget> {
  late DeviceSettingPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DeviceSettingPageModel());

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
              body: () => CDeviceSettingWidget(),
            ),
          ),
        ),
      ),
    );
  }
}
