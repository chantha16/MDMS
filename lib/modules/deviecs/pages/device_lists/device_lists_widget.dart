import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/layout/main_layout/main_layout_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/modules/deviecs/components/c_device_list/c_device_list_widget.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'device_lists_model.dart';
export 'device_lists_model.dart';

class DeviceListsWidget extends StatefulWidget {
  const DeviceListsWidget({
    super.key,
    this.type,
    this.types,
    this.deviceId,
  });

  final Flag? type;
  final FlagStruct? types;
  final String? deviceId;

  static String routeName = 'DeviceLists';
  static String routePath = '/device-lists';

  @override
  State<DeviceListsWidget> createState() => _DeviceListsWidgetState();
}

class _DeviceListsWidgetState extends State<DeviceListsWidget> {
  late DeviceListsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DeviceListsModel());

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
        body: wrapWithModel(
          model: _model.mainLayoutModel,
          updateCallback: () => safeSetState(() {}),
          child: MainLayoutWidget(
            menu: MenuItems.Devices,
            child: () => CDeviceListWidget(
              type: widget.type,
              deviceId: widget.deviceId,
              actionMore: () async {},
            ),
          ),
        ),
      ),
    );
  }
}
