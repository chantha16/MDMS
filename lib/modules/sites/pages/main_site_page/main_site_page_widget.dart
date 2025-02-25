import '/backend/schema/enums/enums.dart';
import '/components/layout/main_layout/main_layout_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/modules/sites/components/site_list_view/site_list_view_widget.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'main_site_page_model.dart';
export 'main_site_page_model.dart';

class MainSitePageWidget extends StatefulWidget {
  const MainSitePageWidget({super.key});

  static String routeName = 'MainSitePage';
  static String routePath = '/sites';

  @override
  State<MainSitePageWidget> createState() => _MainSitePageWidgetState();
}

class _MainSitePageWidgetState extends State<MainSitePageWidget> {
  late MainSitePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MainSitePageModel());

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
              menu: MenuItems.Site,
              child: () => SiteListViewWidget(
                actionMore: () async {},
              ),
            ),
          ),
        ),
      ),
    );
  }
}
