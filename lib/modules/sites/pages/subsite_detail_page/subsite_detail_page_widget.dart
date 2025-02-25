import '/backend/schema/enums/enums.dart';
import '/components/layout/main_layout/main_layout_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/modules/sites/components/sub_site_detail_view/sub_site_detail_view_widget.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'subsite_detail_page_model.dart';
export 'subsite_detail_page_model.dart';

class SubsiteDetailPageWidget extends StatefulWidget {
  const SubsiteDetailPageWidget({
    super.key,
    this.type,
    this.siteId,
    this.parentId,
    this.triggerRefresh,
  });

  final Flag? type;
  final int? siteId;
  final int? parentId;
  final bool? triggerRefresh;

  static String routeName = 'SubsiteDetailPage';
  static String routePath = '/subsite-details';

  @override
  State<SubsiteDetailPageWidget> createState() =>
      _SubsiteDetailPageWidgetState();
}

class _SubsiteDetailPageWidgetState extends State<SubsiteDetailPageWidget> {
  late SubsiteDetailPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SubsiteDetailPageModel());

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
              child: () => SubSiteDetailViewWidget(
                type: widget.type!,
                siteId: widget.siteId,
                parentId: widget.parentId,
                triggerRefresh: true,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
