import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/layout/main_layout/main_layout_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/modules/specialday/components/special_day_list_view/special_day_list_view_widget.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'specail_day_list_model.dart';
export 'specail_day_list_model.dart';

class SpecailDayListWidget extends StatefulWidget {
  const SpecailDayListWidget({
    super.key,
    this.type,
    this.types,
  });

  final Flag? type;
  final FlagStruct? types;

  static String routeName = 'SpecailDayList';
  static String routePath = '/specail-day-list';

  @override
  State<SpecailDayListWidget> createState() => _SpecailDayListWidgetState();
}

class _SpecailDayListWidgetState extends State<SpecailDayListWidget> {
  late SpecailDayListModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SpecailDayListModel());

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
            updateOnChange: true,
            child: MainLayoutWidget(
              menu: MenuItems.SpecialDays,
              child: () => SpecialDayListViewWidget(),
            ),
          ),
        ),
      ),
    );
  }
}
