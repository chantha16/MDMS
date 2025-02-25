import '/backend/schema/enums/enums.dart';
import '/components/layout/main_layout/main_layout_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/modules/device_group/components/main_device_group_detial_view/main_device_group_detial_view_widget.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'device_group_detail_page_model.dart';
export 'device_group_detail_page_model.dart';

class DeviceGroupDetailPageWidget extends StatefulWidget {
  const DeviceGroupDetailPageWidget({
    super.key,
    required this.type,
    this.deviceGroupId,
  });

  final Flag? type;
  final int? deviceGroupId;

  static String routeName = 'DeviceGroupDetailPage';
  static String routePath = '/device-group-detail';

  @override
  State<DeviceGroupDetailPageWidget> createState() =>
      _DeviceGroupDetailPageWidgetState();
}

class _DeviceGroupDetailPageWidgetState
    extends State<DeviceGroupDetailPageWidget> {
  late DeviceGroupDetailPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DeviceGroupDetailPageModel());

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
              child: () => MainDeviceGroupDetialViewWidget(
                type: widget.type!,
                deviceGroupId: widget.deviceGroupId,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
