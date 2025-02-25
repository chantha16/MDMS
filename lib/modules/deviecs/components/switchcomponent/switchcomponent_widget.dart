import '/flutter_flow/flutter_flow_util.dart';
import 'package:epower_library_llyhdh/app_state.dart'
    as epower_library_llyhdh_app_state;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'switchcomponent_model.dart';
export 'switchcomponent_model.dart';

class SwitchcomponentWidget extends StatefulWidget {
  const SwitchcomponentWidget({
    super.key,
    bool? statusSwitch,
    this.switchActionOn,
    this.switchActionOff,
    this.status,
    this.from,
  }) : this.statusSwitch = statusSwitch ?? false;

  final bool statusSwitch;
  final Future Function()? switchActionOn;
  final Future Function()? switchActionOff;
  final String? status;
  final String? from;

  @override
  State<SwitchcomponentWidget> createState() => _SwitchcomponentWidgetState();
}

class _SwitchcomponentWidgetState extends State<SwitchcomponentWidget> {
  late SwitchcomponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SwitchcomponentModel());

    _model.switchValue = (FFAppState().statusSwitch == true) ||
        ((widget.status == 'Enabled') && (widget.from == 'Device'));
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    context.watch<epower_library_llyhdh_app_state.FFAppState>();

    return Switch.adaptive(
      value: _model.switchValue!,
      onChanged: (widget.from != 'Device')
          ? null
          : (newValue) async {
              safeSetState(() => _model.switchValue = newValue);
              if (newValue) {
                await widget.switchActionOn?.call();
              } else {
                await widget.switchActionOff?.call();
              }
            },
      activeColor: FlutterFlowTheme.of(context).alternate,
      activeTrackColor: FlutterFlowTheme.of(context).primary,
      inactiveTrackColor: FlutterFlowTheme.of(context).alternate,
      inactiveThumbColor: FlutterFlowTheme.of(context).secondaryBackground,
    );
  }
}
