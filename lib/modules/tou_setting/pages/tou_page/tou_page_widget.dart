import '/components/layout/main_layout_v1/main_layout_v1_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/modules/tou_setting/components/tou_view/tou_view_widget.dart';
import 'package:flutter/material.dart';
import 'tou_page_model.dart';
export 'tou_page_model.dart';

class TouPageWidget extends StatefulWidget {
  const TouPageWidget({super.key});

  @override
  State<TouPageWidget> createState() => _TouPageWidgetState();
}

class _TouPageWidgetState extends State<TouPageWidget> {
  late TouPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TouPageModel());

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
              key: const ValueKey('MainLayoutV1_yv6v'),
              body: () => const TouViewWidget(),
            ),
          ),
        ),
      ),
    );
  }
}
