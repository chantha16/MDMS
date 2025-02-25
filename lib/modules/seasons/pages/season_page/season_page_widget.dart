import '/backend/schema/enums/enums.dart';
import '/components/layout/main_layout/main_layout_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/modules/seasons/components/season_view/season_view_widget.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'season_page_model.dart';
export 'season_page_model.dart';

class SeasonPageWidget extends StatefulWidget {
  const SeasonPageWidget({super.key});

  static String routeName = 'SeasonPage';
  static String routePath = '/seasons';

  @override
  State<SeasonPageWidget> createState() => _SeasonPageWidgetState();
}

class _SeasonPageWidgetState extends State<SeasonPageWidget> {
  late SeasonPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SeasonPageModel());

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
              menu: MenuItems.Seasons,
              child: () => SeasonViewWidget(),
            ),
          ),
        ),
      ),
    );
  }
}
