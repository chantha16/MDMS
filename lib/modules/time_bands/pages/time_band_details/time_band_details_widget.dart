import '/backend/schema/enums/enums.dart';
import '/components/layout/main_layout_v2/main_layout_v2_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/modules/time_bands/components/timeband_details_view/timeband_details_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'time_band_details_model.dart';
export 'time_band_details_model.dart';

class TimeBandDetailsWidget extends StatefulWidget {
  const TimeBandDetailsWidget({super.key});

  @override
  State<TimeBandDetailsWidget> createState() => _TimeBandDetailsWidgetState();
}

class _TimeBandDetailsWidgetState extends State<TimeBandDetailsWidget> {
  late TimeBandDetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TimeBandDetailsModel());

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
              menu: MenuItems.TimeBands,
              child: () => TimebandDetailsViewWidget(),
            ),
          ),
        ),
      ),
    );
  }
}
