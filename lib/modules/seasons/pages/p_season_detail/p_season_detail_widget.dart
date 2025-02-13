import '/backend/schema/enums/enums.dart';
import '/components/main_layout_v2/main_layout_v2_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/modules/seasons/components/c_season_details/c_season_details_widget.dart';
import 'package:flutter/material.dart';
import 'p_season_detail_model.dart';
export 'p_season_detail_model.dart';

class PSeasonDetailWidget extends StatefulWidget {
  const PSeasonDetailWidget({
    super.key,
    required this.type,
    this.seasonId,
  });

  final Flag? type;
  final int? seasonId;

  @override
  State<PSeasonDetailWidget> createState() => _PSeasonDetailWidgetState();
}

class _PSeasonDetailWidgetState extends State<PSeasonDetailWidget> {
  late PSeasonDetailModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PSeasonDetailModel());

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
            model: _model.mainLayoutV2Model,
            updateCallback: () => safeSetState(() {}),
            child: MainLayoutV2Widget(
              key: ValueKey('MainLayoutV2_ihfl'),
              menu: MenuItems.Seasons,
              child: () => CSeasonDetailsWidget(
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
