import '/components/layout/main_layout_v1/main_layout_v1_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/modules/resources/components/c_resource/c_resource_widget.dart';
import 'package:flutter/material.dart';
import 'resource_page_model.dart';
export 'resource_page_model.dart';

class ResourcePageWidget extends StatefulWidget {
  const ResourcePageWidget({super.key});

  @override
  State<ResourcePageWidget> createState() => _ResourcePageWidgetState();
}

class _ResourcePageWidgetState extends State<ResourcePageWidget> {
  late ResourcePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ResourcePageModel());

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
              body: () => CResourceWidget(),
            ),
          ),
        ),
      ),
    );
  }
}
