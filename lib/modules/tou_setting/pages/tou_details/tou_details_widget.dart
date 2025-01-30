import '/components/layout/main_layout_v1/main_layout_v1_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/modules/tou_setting/components/tou_details_view/tou_details_view_widget.dart';
import 'package:flutter/material.dart';
import 'tou_details_model.dart';
export 'tou_details_model.dart';

class TouDetailsWidget extends StatefulWidget {
  const TouDetailsWidget({super.key});

  @override
  State<TouDetailsWidget> createState() => _TouDetailsWidgetState();
}

class _TouDetailsWidgetState extends State<TouDetailsWidget> {
  late TouDetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TouDetailsModel());

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
              body: () => const TouDetailsViewWidget(),
            ),
          ),
        ),
      ),
    );
  }
}
