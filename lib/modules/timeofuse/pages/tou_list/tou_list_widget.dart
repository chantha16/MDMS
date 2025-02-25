import '/backend/schema/enums/enums.dart';
import '/components/layout/main_layout/main_layout_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/modules/timeofuse/components/tou_detail_lists/tou_detail_lists_widget.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'tou_list_model.dart';
export 'tou_list_model.dart';

class TouListWidget extends StatefulWidget {
  const TouListWidget({super.key});

  static String routeName = 'TouList';
  static String routePath = '/tou-list';

  @override
  State<TouListWidget> createState() => _TouListWidgetState();
}

class _TouListWidgetState extends State<TouListWidget> {
  late TouListModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TouListModel());

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
              menu: MenuItems.TOU,
              child: () => TouDetailListsWidget(),
            ),
          ),
        ),
      ),
    );
  }
}
