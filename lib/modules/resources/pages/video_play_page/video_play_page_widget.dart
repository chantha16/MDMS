import '/backend/schema/enums/enums.dart';
import '/components/layout/main_layout_v1/main_layout_v1_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/modules/dashboard/components/dashboard_view/dashboard_view_widget.dart';
import 'package:flutter/material.dart';
import 'video_play_page_model.dart';
export 'video_play_page_model.dart';

class VideoPlayPageWidget extends StatefulWidget {
  const VideoPlayPageWidget({super.key});

  @override
  State<VideoPlayPageWidget> createState() => _VideoPlayPageWidgetState();
}

class _VideoPlayPageWidgetState extends State<VideoPlayPageWidget> {
  late VideoPlayPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VideoPlayPageModel());

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
              activeMenu: MenuItems.Dashboard,
              body: () => const DashboardViewWidget(),
            ),
          ),
        ),
      ),
    );
  }
}
