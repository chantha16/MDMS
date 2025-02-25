import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/layout/main_layout/main_layout_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/modules/specialday/components/special_day_detail_view/special_day_detail_view_widget.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'special_day_page_model.dart';
export 'special_day_page_model.dart';

class SpecialDayPageWidget extends StatefulWidget {
  const SpecialDayPageWidget({
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

  static String routeName = 'SpecialDayPage';
  static String routePath = '/special-day-view';

  @override
  State<SpecialDayPageWidget> createState() => _SpecialDayPageWidgetState();
}

class _SpecialDayPageWidgetState extends State<SpecialDayPageWidget> {
  late SpecialDayPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SpecialDayPageModel());

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
              child: () => SpecialDayDetailViewWidget(
                type: widget.types,
                types: FlagStruct(),
                details: widget.detailsSpecial,
                specialDayId: widget.id,
                detailsSpecial: widget.detailsSpecials,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
