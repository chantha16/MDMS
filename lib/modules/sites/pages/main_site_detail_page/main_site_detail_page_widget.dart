import '/backend/schema/enums/enums.dart';
import '/components/layout/main_layout/main_layout_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/modules/sites/components/main_site_detial_view/main_site_detial_view_widget.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'main_site_detail_page_model.dart';
export 'main_site_detail_page_model.dart';

class MainSiteDetailPageWidget extends StatefulWidget {
  const MainSiteDetailPageWidget({
    super.key,
    this.parentid,
    this.type,
    this.siteId,
    this.triggerRefresh,
  });

  final int? parentid;
  final Flag? type;
  final int? siteId;
  final bool? triggerRefresh;

  static String routeName = 'MainSiteDetailPage';
  static String routePath = '/site-details';

  @override
  State<MainSiteDetailPageWidget> createState() =>
      _MainSiteDetailPageWidgetState();
}

class _MainSiteDetailPageWidgetState extends State<MainSiteDetailPageWidget> {
  late MainSiteDetailPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MainSiteDetailPageModel());

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
              child: () => MainSiteDetialViewWidget(
                type: widget.type,
                siteId: widget.siteId,
                parentId: valueOrDefault<int>(
                  widget.parentid,
                  0,
                ),
                triggerRefresh: false,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
