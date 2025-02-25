import '/backend/schema/enums/enums.dart';
import '/components/layout/main_layout/main_layout_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/modules/seasons/components/season_detail_view/season_detail_view_widget.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'season_detail_page_model.dart';
export 'season_detail_page_model.dart';

class SeasonDetailPageWidget extends StatefulWidget {
  const SeasonDetailPageWidget({
    super.key,
    required this.type,
    this.seasonId,
  });

  final Flag? type;
  final int? seasonId;

  static String routeName = 'SeasonDetailPage';
  static String routePath = '/season-details';

  @override
  State<SeasonDetailPageWidget> createState() => _SeasonDetailPageWidgetState();
}

class _SeasonDetailPageWidgetState extends State<SeasonDetailPageWidget> {
  late SeasonDetailPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SeasonDetailPageModel());

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
              child: () => SeasonDetailViewWidget(
                type: widget.type!,
                seasonId: widget.seasonId,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
