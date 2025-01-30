import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/modules/deviecs/components/device_view/device_view_widget.dart';
import 'package:flutter/material.dart';
import 'search_device_model.dart';
export 'search_device_model.dart';

class SearchDeviceWidget extends StatefulWidget {
  const SearchDeviceWidget({super.key});

  @override
  State<SearchDeviceWidget> createState() => _SearchDeviceWidgetState();
}

class _SearchDeviceWidgetState extends State<SearchDeviceWidget> {
  late SearchDeviceModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchDeviceModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.4,
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        boxShadow: const [
          BoxShadow(
            blurRadius: 4.0,
            color: Color(0x33000000),
            offset: Offset(
              0.0,
              2.0,
            ),
          )
        ],
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(0.0),
        ),
      ),
      child: Container(
        width: 1000.0,
        decoration: const BoxDecoration(),
        child: wrapWithModel(
          model: _model.deviceViewModel,
          updateCallback: () => safeSetState(() {}),
          child: const DeviceViewWidget(),
        ),
      ),
    );
  }
}
