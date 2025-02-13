import '/backend/schema/enums/enums.dart';
import '/components/main_layout_v2/main_layout_v2_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/modules/seasons/components/c_season/c_season_widget.dart';
import 'package:flutter/material.dart';
import 'p_season_model.dart';
export 'p_season_model.dart';

class PSeasonWidget extends StatefulWidget {
  const PSeasonWidget({super.key});

  @override
  State<PSeasonWidget> createState() => _PSeasonWidgetState();
}

class _PSeasonWidgetState extends State<PSeasonWidget> {
  late PSeasonModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PSeasonModel());

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
              key: ValueKey('MainLayoutV2_nmyv'),
              menu: MenuItems.Seasons,
              child: () => CSeasonWidget(),
            ),
          ),
        ),
      ),
    );
  }
}
