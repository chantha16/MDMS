import '/backend/schema/enums/enums.dart';
import '/components/main_layout_v2/main_layout_v2_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/modules/deviecs/device_view/device_view_widget.dart';
import 'package:flutter/material.dart';
import 'devices_page_model.dart';
export 'devices_page_model.dart';

class DevicesPageWidget extends StatefulWidget {
  const DevicesPageWidget({super.key});

  @override
  State<DevicesPageWidget> createState() => _DevicesPageWidgetState();
}

class _DevicesPageWidgetState extends State<DevicesPageWidget> {
  late DevicesPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DevicesPageModel());

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
              key: ValueKey('MainLayoutV2_n2l0'),
              menu: MenuItems.Devices,
              child: () => DeviceViewWidget(),
            ),
          ),
        ),
      ),
    );
  }
}
