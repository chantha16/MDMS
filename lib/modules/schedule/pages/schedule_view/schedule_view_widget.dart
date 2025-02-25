import '/backend/schema/enums/enums.dart';
import '/components/layout/main_layout/main_layout_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/modules/schedule/components/c_schedule_view/c_schedule_view_widget.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'schedule_view_model.dart';
export 'schedule_view_model.dart';

class ScheduleViewWidget extends StatefulWidget {
  const ScheduleViewWidget({
    super.key,
    this.type,
    this.scheduleId,
    this.typeSchedule,
    this.deviceGroupId,
  });

  final Flag? type;
  final String? scheduleId;
  final FlagSchedule? typeSchedule;
  final int? deviceGroupId;

  static String routeName = 'ScheduleView';
  static String routePath = '/schedule-view';

  @override
  State<ScheduleViewWidget> createState() => _ScheduleViewWidgetState();
}

class _ScheduleViewWidgetState extends State<ScheduleViewWidget> {
  late ScheduleViewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ScheduleViewModel());

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
              menu: MenuItems.Schedule,
              child: () => CScheduleViewWidget(
                type: widget.type,
                scheduleId: widget.scheduleId,
                typeSchedule: widget.typeSchedule,
                deviceGroupId: widget.deviceGroupId,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
