import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/layout/main_layout_v1/main_layout_v1_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/modules/specialday/components/c_special_day_detail/c_special_day_detail_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'p_special_day_detail_model.dart';
export 'p_special_day_detail_model.dart';

class PSpecialDayDetailWidget extends StatefulWidget {
  const PSpecialDayDetailWidget({
    super.key,
    this.types,
    this.detailsSpecial,
    this.id,
  });

  final Flag? types;
  final SpecialDayDetailsModelStruct? detailsSpecial;
  final int? id;

  @override
  State<PSpecialDayDetailWidget> createState() =>
      _PSpecialDayDetailWidgetState();
}

class _PSpecialDayDetailWidgetState extends State<PSpecialDayDetailWidget> {
  late PSpecialDayDetailModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PSpecialDayDetailModel());

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
              body: () => CSpecialDayDetailWidget(
                details: widget!.detailsSpecial,
                types: FlagStruct(),
                type: widget!.types,
                specialDayId: widget!.id,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
