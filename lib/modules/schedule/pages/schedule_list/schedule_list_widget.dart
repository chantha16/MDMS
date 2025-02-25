import '/backend/schema/enums/enums.dart';
import '/components/layout/main_layout/main_layout_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/modules/schedule/components/c_schedule_list/c_schedule_list_widget.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'schedule_list_model.dart';
export 'schedule_list_model.dart';

class ScheduleListWidget extends StatefulWidget {
  const ScheduleListWidget({super.key});

  static String routeName = 'ScheduleList';
  static String routePath = '/schedule-list';

  @override
  State<ScheduleListWidget> createState() => _ScheduleListWidgetState();
}

class _ScheduleListWidgetState extends State<ScheduleListWidget> {
  late ScheduleListModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ScheduleListModel());

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
              child: () => CScheduleListWidget(),
            ),
          ),
        ),
      ),
    );
  }
}
