import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/layout/main_layout_v1/main_layout_v1_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/modules/tou_setting/components/c_season_copy/c_season_copy_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'seasonmaintest_model.dart';
export 'seasonmaintest_model.dart';

class SeasonmaintestWidget extends StatefulWidget {
  const SeasonmaintestWidget({super.key});

  @override
  State<SeasonmaintestWidget> createState() => _SeasonmaintestWidgetState();
}

class _SeasonmaintestWidgetState extends State<SeasonmaintestWidget> {
  late SeasonmaintestModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SeasonmaintestModel());

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
            model: _model.mainLayoutV1Model,
            updateCallback: () => safeSetState(() {}),
            child: MainLayoutV1Widget(
              activeMenu: MenuItems.TOU,
              body: () => CSeasonCopyWidget(
                months: MonthStruct(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
