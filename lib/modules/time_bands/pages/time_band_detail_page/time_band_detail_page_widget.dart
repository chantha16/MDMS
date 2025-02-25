import '/backend/schema/enums/enums.dart';
import '/components/layout/main_layout/main_layout_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/modules/time_bands/components/time_band_detail_view/time_band_detail_view_widget.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'time_band_detail_page_model.dart';
export 'time_band_detail_page_model.dart';

class TimeBandDetailPageWidget extends StatefulWidget {
  const TimeBandDetailPageWidget({
    super.key,
    required this.type,
    this.timeBandId,
  });

  final Flag? type;
  final int? timeBandId;

  static String routeName = 'TimeBandDetailPage';
  static String routePath = '/time-band-details';

  @override
  State<TimeBandDetailPageWidget> createState() =>
      _TimeBandDetailPageWidgetState();
}

class _TimeBandDetailPageWidgetState extends State<TimeBandDetailPageWidget> {
  late TimeBandDetailPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TimeBandDetailPageModel());

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
              menu: MenuItems.TimeBands,
              child: () => TimeBandDetailViewWidget(
                type: widget.type!,
                timeBandId: widget.timeBandId,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
