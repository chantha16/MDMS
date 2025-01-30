import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/layout/main_layout_v1/main_layout_v1_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/modules/specialday/components/c_special_day_view/c_special_day_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'p_special_day_view_model.dart';
export 'p_special_day_view_model.dart';

class PSpecialDayViewWidget extends StatefulWidget {
  const PSpecialDayViewWidget({
    super.key,
    this.types,
    this.detailsSpecial,
    this.id,
    this.detailsSpecials,
  });

  final Flag? types;
  final SpecialDayDetailsModelStruct? detailsSpecial;
  final int? id;
  final SpecialDayModelStruct? detailsSpecials;

  @override
  State<PSpecialDayViewWidget> createState() => _PSpecialDayViewWidgetState();
}

class _PSpecialDayViewWidgetState extends State<PSpecialDayViewWidget> {
  late PSpecialDayViewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PSpecialDayViewModel());

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
              body: () => CSpecialDayViewWidget(
                type: widget!.types,
                types: FlagStruct(),
                details: widget!.detailsSpecial,
                specialDayId: widget!.id,
                detailsSpecial: widget!.detailsSpecials,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
