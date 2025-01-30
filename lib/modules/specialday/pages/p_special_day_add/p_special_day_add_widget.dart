import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/layout/main_layout_v1/main_layout_v1_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/modules/specialday/components/c_special_day_add/c_special_day_add_widget.dart';
import 'package:flutter/material.dart';
import 'p_special_day_add_model.dart';
export 'p_special_day_add_model.dart';

class PSpecialDayAddWidget extends StatefulWidget {
  const PSpecialDayAddWidget({
    super.key,
    this.types,
    this.detailss,
  });

  final Flag? types;
  final SpecialDayModelStruct? detailss;

  @override
  State<PSpecialDayAddWidget> createState() => _PSpecialDayAddWidgetState();
}

class _PSpecialDayAddWidgetState extends State<PSpecialDayAddWidget> {
  late PSpecialDayAddModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PSpecialDayAddModel());

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
              activeMenu: MenuItems.TimeBands,
              body: () => CSpecialDayAddWidget(
                types: FlagStruct(),
                type: widget.types,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
