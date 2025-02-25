import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/layout/main_layout/main_layout_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/modules/deviecs/components/c_device_details/c_device_details_widget.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'p_device_details_model.dart';
export 'p_device_details_model.dart';

class PDeviceDetailsWidget extends StatefulWidget {
  const PDeviceDetailsWidget({
    super.key,
    this.type,
    this.deviceId,
    this.types,
  });

  final Flag? type;
  final String? deviceId;
  final FlagStruct? types;

  static String routeName = 'pDeviceDetails';
  static String routePath = '/device-details';

  @override
  State<PDeviceDetailsWidget> createState() => _PDeviceDetailsWidgetState();
}

class _PDeviceDetailsWidgetState extends State<PDeviceDetailsWidget> {
  late PDeviceDetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PDeviceDetailsModel());

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
              menu: MenuItems.Devices,
              child: () => CDeviceDetailsWidget(
                type: widget.type,
                deviceId: widget.deviceId,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
