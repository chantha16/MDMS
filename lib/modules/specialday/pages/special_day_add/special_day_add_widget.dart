import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/layout/main_layout/main_layout_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/modules/specialday/components/special_day_add_view/special_day_add_view_widget.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'special_day_add_model.dart';
export 'special_day_add_model.dart';

class SpecialDayAddWidget extends StatefulWidget {
  const SpecialDayAddWidget({
    super.key,
    this.types,
    this.detailss,
  });

  final Flag? types;
  final SpecialDayModelStruct? detailss;

  static String routeName = 'SpecialDayAdd';
  static String routePath = '/special-day';

  @override
  State<SpecialDayAddWidget> createState() => _SpecialDayAddWidgetState();
}

class _SpecialDayAddWidgetState extends State<SpecialDayAddWidget> {
  late SpecialDayAddModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SpecialDayAddModel());

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
              child: () => SpecialDayAddViewWidget(
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
