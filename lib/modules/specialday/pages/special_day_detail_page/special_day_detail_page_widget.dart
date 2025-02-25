import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/layout/main_layout/main_layout_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/modules/specialday/components/special_day_view/special_day_view_widget.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'special_day_detail_page_model.dart';
export 'special_day_detail_page_model.dart';

class SpecialDayDetailPageWidget extends StatefulWidget {
  const SpecialDayDetailPageWidget({
    super.key,
    this.types,
    this.detailsSpecial,
    this.id,
  });

  final Flag? types;
  final SpecialDayDetailsModelStruct? detailsSpecial;
  final int? id;

  static String routeName = 'SpecialDayDetailPage';
  static String routePath = '/special-day-detail';

  @override
  State<SpecialDayDetailPageWidget> createState() =>
      _SpecialDayDetailPageWidgetState();
}

class _SpecialDayDetailPageWidgetState
    extends State<SpecialDayDetailPageWidget> {
  late SpecialDayDetailPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SpecialDayDetailPageModel());

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
              child: () => SpecialDayViewWidget(
                type: widget.types,
                types: FlagStruct(
                  option: Flag.Add,
                ),
                details: widget.detailsSpecial,
                specialDayId: widget.id,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
