import '/backend/schema/enums/enums.dart';
import '/components/layout/main_layout/main_layout_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/modules/resources/components/resource_view/resource_view_widget.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'resource_page_model.dart';
export 'resource_page_model.dart';

class ResourcePageWidget extends StatefulWidget {
  const ResourcePageWidget({super.key});

  static String routeName = 'ResourcePage';
  static String routePath = '/resourcePage';

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
            model: _model.mainLayoutModel,
            updateCallback: () => safeSetState(() {}),
            child: MainLayoutWidget(
              menu: MenuItems.Configuration,
              child: () => ResourceViewWidget(),
            ),
          ),
        ),
      ),
    );
  }
}
