import '/backend/schema/enums/enums.dart';
import '/components/layout/main_layout/main_layout_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/modules/device_group/components/device_group_view/device_group_view_widget.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'device_group_page_model.dart';
export 'device_group_page_model.dart';

class DeviceGroupPageWidget extends StatefulWidget {
  const DeviceGroupPageWidget({super.key});

  static String routeName = 'DeviceGroupPage';
  static String routePath = '/device-group';

  @override
  State<DeviceGroupPageWidget> createState() => _DeviceGroupPageWidgetState();
}

class _DeviceGroupPageWidgetState extends State<DeviceGroupPageWidget> {
  late DeviceGroupPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DeviceGroupPageModel());

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
            model: _model.mainLayoutModel,
            updateCallback: () => safeSetState(() {}),
            child: MainLayoutWidget(
              menu: MenuItems.DevicesGroup,
              child: () => DeviceGroupViewWidget(),
            ),
          ),
        ),
      ),
    );
  }
}
