import '/components/system_logic/body_header/body_header_widget.dart';
import '/components/system_logic/pagenation_component/pagenation_component_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/modules/deviecs/components/c_action/c_action_widget.dart';
import '/modules/deviecs/components/c_custom_columns/c_custom_columns_widget.dart';
import '/modules/deviecs/components/c_sidebar/c_sidebar_widget.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'device_view_model.dart';
export 'device_view_model.dart';

class DeviceViewWidget extends StatefulWidget {
  const DeviceViewWidget({super.key});

  @override
  State<DeviceViewWidget> createState() => _DeviceViewWidgetState();
}

class _DeviceViewWidgetState extends State<DeviceViewWidget> {
  late DeviceViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DeviceViewModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(0.0),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (responsiveVisibility(
              context: context,
              phone: false,
            ))
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  wrapWithModel(
                    model: _model.bodyHeaderModel,
                    updateCallback: () => safeSetState(() {}),
                    child: BodyHeaderWidget(
                      tbName1: 'Export',
                      btIcon1: Icon(
                        Icons.ios_share,
                      ),
                      tbName2: 'Add',
                      btIcon2: Icon(
                        Icons.add_box,
                      ),
                      filterAction: () async {},
                      btAction1: () async {
                        context.pushNamed(
                          'AddDevicePage',
                          extra: <String, dynamic>{
                            kTransitionInfoKey: TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.fade,
                              duration: Duration(milliseconds: 0),
                            ),
                          },
                        );
                      },
                      btAction2: () async {},
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0.0),
                        bottomRight: Radius.circular(0.0),
                        topLeft: Radius.circular(16.0),
                        topRight: Radius.circular(16.0),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Theme(
                          data: ThemeData(
                            checkboxTheme: CheckboxThemeData(
                              visualDensity: VisualDensity.compact,
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                            ),
                            unselectedWidgetColor:
                                FlutterFlowTheme.of(context).alternate,
                          ),
                          child: Checkbox(
                            value: _model.checkboxValue1 ??= false,
                            onChanged: (newValue) async {
                              safeSetState(
                                  () => _model.checkboxValue1 = newValue!);
                            },
                            side: BorderSide(
                              width: 2,
                              color: FlutterFlowTheme.of(context).alternate,
                            ),
                            activeColor: FlutterFlowTheme.of(context).primary,
                          ),
                        ),
                        Container(
                          width: 40.0,
                          height: 40.0,
                          decoration: BoxDecoration(),
                          child: Builder(
                            builder: (context) => FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 8.0,
                              buttonSize: 40.0,
                              hoverColor:
                                  FlutterFlowTheme.of(context).alternate,
                              icon: FaIcon(
                                FontAwesomeIcons.slidersH,
                                color: FlutterFlowTheme.of(context).primary,
                                size: 20.0,
                              ),
                              onPressed: () async {
                                await showAlignedDialog(
                                  context: context,
                                  isGlobal: false,
                                  avoidOverflow: false,
                                  targetAnchor: AlignmentDirectional(0.0, 0.5)
                                      .resolve(Directionality.of(context)),
                                  followerAnchor:
                                      AlignmentDirectional(-1.0, -1.0)
                                          .resolve(Directionality.of(context)),
                                  builder: (dialogContext) {
                                    return Material(
                                      color: Colors.transparent,
                                      child: CCustomColumnsWidget(),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'g0v9nrgn' /* No */,
                            ),
                            style:
                                FlutterFlowTheme.of(context).bodyLarge.override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0.0,
                                    ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'l13fspgl' /* Serial */,
                            ),
                            style:
                                FlutterFlowTheme.of(context).bodyLarge.override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0.0,
                                    ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'rak5vwi8' /* Device Type */,
                            ),
                            style:
                                FlutterFlowTheme.of(context).bodyLarge.override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0.0,
                                    ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Text(
                            FFLocalizations.of(context).getText(
                              '5rvuguvi' /* Device Group */,
                            ),
                            style:
                                FlutterFlowTheme.of(context).bodyLarge.override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0.0,
                                    ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'mrwil5q0' /* TOU */,
                            ),
                            style:
                                FlutterFlowTheme.of(context).bodyLarge.override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0.0,
                                    ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'cy6lgt68' /* Application */,
                            ),
                            style:
                                FlutterFlowTheme.of(context).bodyLarge.override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0.0,
                                    ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'swy9ishl' /* Status */,
                            ),
                            style:
                                FlutterFlowTheme.of(context).bodyLarge.override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0.0,
                                    ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            FFLocalizations.of(context).getText(
                              '6yg9ke0m' /* Created By */,
                            ),
                            style:
                                FlutterFlowTheme.of(context).bodyLarge.override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0.0,
                                    ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            FFLocalizations.of(context).getText(
                              '1kfuc0m3' /* Created On */,
                            ),
                            style:
                                FlutterFlowTheme.of(context).bodyLarge.override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0.0,
                                    ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'nbls07h8' /* Installation Date */,
                            ),
                            style:
                                FlutterFlowTheme.of(context).bodyLarge.override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0.0,
                                    ),
                          ),
                        ),
                      ].divide(SizedBox(width: 14.0)),
                    ),
                  ),
                  ListView(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: [
                      MouseRegion(
                        opaque: false,
                        cursor: MouseCursor.defer ?? MouseCursor.defer,
                        child: Container(
                          width: double.infinity,
                          height: 40.0,
                          decoration: BoxDecoration(
                            color: _model.mouseRegionHovered1
                                ? FlutterFlowTheme.of(context).accent4
                                : FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                          ),
                          child: Builder(
                            builder: (context) => InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                await showAlignedDialog(
                                  barrierColor: Colors.transparent,
                                  context: context,
                                  isGlobal: false,
                                  avoidOverflow: true,
                                  targetAnchor: AlignmentDirectional(1.0, -1.0)
                                      .resolve(Directionality.of(context)),
                                  followerAnchor:
                                      AlignmentDirectional(0.0, -1.0)
                                          .resolve(Directionality.of(context)),
                                  builder: (dialogContext) {
                                    return Material(
                                      color: Colors.transparent,
                                      child: CSidebarWidget(),
                                    );
                                  },
                                );
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Theme(
                                    data: ThemeData(
                                      checkboxTheme: CheckboxThemeData(
                                        visualDensity: VisualDensity.compact,
                                        materialTapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                      ),
                                      unselectedWidgetColor:
                                          FlutterFlowTheme.of(context)
                                              .alternate,
                                    ),
                                    child: Checkbox(
                                      key: ValueKey('chbDV1'),
                                      value: _model.checkboxValue2 ??= false,
                                      onChanged: (newValue) async {
                                        safeSetState(() =>
                                            _model.checkboxValue2 = newValue!);
                                      },
                                      side: BorderSide(
                                        width: 2,
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                      ),
                                      activeColor:
                                          FlutterFlowTheme.of(context).primary,
                                      checkColor:
                                          FlutterFlowTheme.of(context).info,
                                    ),
                                  ),
                                  Builder(
                                    builder: (context) => FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 100.0,
                                      buttonSize: 40.0,
                                      hoverColor: FlutterFlowTheme.of(context)
                                          .alternate,
                                      icon: Icon(
                                        Icons.more_vert,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 20.0,
                                      ),
                                      onPressed: () async {
                                        await showAlignedDialog(
                                          context: context,
                                          isGlobal: false,
                                          avoidOverflow: false,
                                          targetAnchor: AlignmentDirectional(
                                                  0.0, 0.5)
                                              .resolve(
                                                  Directionality.of(context)),
                                          followerAnchor: AlignmentDirectional(
                                                  -1.0, -1.0)
                                              .resolve(
                                                  Directionality.of(context)),
                                          builder: (dialogContext) {
                                            return Material(
                                              color: Colors.transparent,
                                              child: CActionWidget(),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'eb2rg1jz' /* 1 */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'nko0t8lo' /* 800046773 */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        '2vro52g8' /* K10A/5A */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'tc05xxt5' /* COMMERCIAL */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'f1tnmeqp' /* TOU01 */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'jdo74r29' /* HES */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        '8vec6cjx' /* Active */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'vzcfeiea' /* Kim Heang */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        '5ob35xra' /* 06/01/2024 */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'wg7wl4hw' /* 06/01/2024 */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ),
                                ].divide(SizedBox(width: 14.0)),
                              ),
                            ),
                          ),
                        ),
                        onEnter: ((event) async {
                          safeSetState(() => _model.mouseRegionHovered1 = true);
                        }),
                        onExit: ((event) async {
                          safeSetState(
                              () => _model.mouseRegionHovered1 = false);
                        }),
                      ),
                      MouseRegion(
                        opaque: false,
                        cursor: MouseCursor.defer ?? MouseCursor.defer,
                        child: Container(
                          width: double.infinity,
                          height: 40.0,
                          decoration: BoxDecoration(
                            color: _model.mouseRegionHovered3
                                ? FlutterFlowTheme.of(context).accent4
                                : FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                          ),
                          child: Builder(
                            builder: (context) => InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                await showAlignedDialog(
                                  barrierColor: Colors.transparent,
                                  context: context,
                                  isGlobal: false,
                                  avoidOverflow: true,
                                  targetAnchor: AlignmentDirectional(1.0, -1.0)
                                      .resolve(Directionality.of(context)),
                                  followerAnchor:
                                      AlignmentDirectional(0.0, -1.0)
                                          .resolve(Directionality.of(context)),
                                  builder: (dialogContext) {
                                    return Material(
                                      color: Colors.transparent,
                                      child: CSidebarWidget(),
                                    );
                                  },
                                );
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Theme(
                                    data: ThemeData(
                                      checkboxTheme: CheckboxThemeData(
                                        visualDensity: VisualDensity.compact,
                                        materialTapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                      ),
                                      unselectedWidgetColor:
                                          FlutterFlowTheme.of(context)
                                              .alternate,
                                    ),
                                    child: Checkbox(
                                      key: ValueKey('chbDV2'),
                                      value: _model.checkboxValue3 ??= false,
                                      onChanged: (newValue) async {
                                        safeSetState(() =>
                                            _model.checkboxValue3 = newValue!);
                                      },
                                      side: BorderSide(
                                        width: 2,
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                      ),
                                      activeColor:
                                          FlutterFlowTheme.of(context).primary,
                                      checkColor:
                                          FlutterFlowTheme.of(context).info,
                                    ),
                                  ),
                                  FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 100.0,
                                    buttonSize: 40.0,
                                    hoverColor:
                                        FlutterFlowTheme.of(context).alternate,
                                    icon: Icon(
                                      Icons.more_vert,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 20.0,
                                    ),
                                    onPressed: () {
                                      print('IconButton pressed ...');
                                    },
                                  ),
                                  Expanded(
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'gb3x9cob' /* 2 */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'wyhah5hk' /* 800046774 */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        '0ee4fmbz' /* K10A/5A */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'aujywwqb' /* COMMERCIAL */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        '107al05b' /* TOU01 */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'z1tcfxr2' /* HES */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'edj5mpr8' /* Active */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'lg33idt3' /* Ti Fong */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        '4wf3aozf' /* 06/01/2024 */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'v3mxim0p' /* 06/01/2024 */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ),
                                ].divide(SizedBox(width: 14.0)),
                              ),
                            ),
                          ),
                        ),
                        onEnter: ((event) async {
                          safeSetState(() => _model.mouseRegionHovered2 = true);
                        }),
                        onExit: ((event) async {
                          safeSetState(
                              () => _model.mouseRegionHovered2 = false);
                        }),
                      ),
                      MouseRegion(
                        opaque: false,
                        cursor: MouseCursor.defer ?? MouseCursor.defer,
                        child: Container(
                          width: double.infinity,
                          height: 40.0,
                          decoration: BoxDecoration(
                            color: _model.mouseRegionHovered3
                                ? FlutterFlowTheme.of(context).primaryBackground
                                : Color(0x00000000),
                          ),
                          child: Builder(
                            builder: (context) => InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                await showAlignedDialog(
                                  barrierColor: Colors.transparent,
                                  context: context,
                                  isGlobal: false,
                                  avoidOverflow: true,
                                  targetAnchor: AlignmentDirectional(1.0, -1.0)
                                      .resolve(Directionality.of(context)),
                                  followerAnchor:
                                      AlignmentDirectional(0.0, -1.0)
                                          .resolve(Directionality.of(context)),
                                  builder: (dialogContext) {
                                    return Material(
                                      color: Colors.transparent,
                                      child: CSidebarWidget(),
                                    );
                                  },
                                );
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Theme(
                                    data: ThemeData(
                                      checkboxTheme: CheckboxThemeData(
                                        visualDensity: VisualDensity.compact,
                                        materialTapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                      ),
                                      unselectedWidgetColor:
                                          FlutterFlowTheme.of(context)
                                              .alternate,
                                    ),
                                    child: Checkbox(
                                      key: ValueKey('chbDV3'),
                                      value: _model.checkboxValue4 ??= false,
                                      onChanged: (newValue) async {
                                        safeSetState(() =>
                                            _model.checkboxValue4 = newValue!);
                                      },
                                      side: BorderSide(
                                        width: 2,
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                      ),
                                      activeColor:
                                          FlutterFlowTheme.of(context).primary,
                                      checkColor:
                                          FlutterFlowTheme.of(context).info,
                                    ),
                                  ),
                                  FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 100.0,
                                    buttonSize: 40.0,
                                    hoverColor:
                                        FlutterFlowTheme.of(context).alternate,
                                    icon: Icon(
                                      Icons.more_vert,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 20.0,
                                    ),
                                    onPressed: () {
                                      print('IconButton pressed ...');
                                    },
                                  ),
                                  Expanded(
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'n1tuh9ex' /* 3 */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'nqc55480' /* 800046775 */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'o1wcq7uw' /* K10A/5A */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'xfit4nk9' /* INDUSTRIAL */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'wr91ybvy' /* TOU02 */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'trbhmfqc' /* HES */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        '3bz4zrc6' /* Active */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'twbgrqpt' /* Kim Heang */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'r88xeyt1' /* 06/01/2024 */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'e9assla1' /* 06/01/2024 */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ),
                                ].divide(SizedBox(width: 14.0)),
                              ),
                            ),
                          ),
                        ),
                        onEnter: ((event) async {
                          safeSetState(() => _model.mouseRegionHovered3 = true);
                        }),
                        onExit: ((event) async {
                          safeSetState(
                              () => _model.mouseRegionHovered3 = false);
                        }),
                      ),
                      MouseRegion(
                        opaque: false,
                        cursor: MouseCursor.defer ?? MouseCursor.defer,
                        child: Container(
                          decoration: BoxDecoration(
                            color: _model.mouseRegionHovered4
                                ? FlutterFlowTheme.of(context).primaryBackground
                                : Color(0x00000000),
                          ),
                          child: Builder(
                            builder: (context) => InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                await showAlignedDialog(
                                  barrierColor: Colors.transparent,
                                  context: context,
                                  isGlobal: false,
                                  avoidOverflow: true,
                                  targetAnchor: AlignmentDirectional(1.0, -1.0)
                                      .resolve(Directionality.of(context)),
                                  followerAnchor:
                                      AlignmentDirectional(0.0, -1.0)
                                          .resolve(Directionality.of(context)),
                                  builder: (dialogContext) {
                                    return Material(
                                      color: Colors.transparent,
                                      child: CSidebarWidget(),
                                    );
                                  },
                                );
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Theme(
                                    data: ThemeData(
                                      checkboxTheme: CheckboxThemeData(
                                        visualDensity: VisualDensity.compact,
                                        materialTapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                      ),
                                      unselectedWidgetColor:
                                          FlutterFlowTheme.of(context)
                                              .alternate,
                                    ),
                                    child: Checkbox(
                                      key: ValueKey('chbDV4'),
                                      value: _model.checkboxValue5 ??= false,
                                      onChanged: (newValue) async {
                                        safeSetState(() =>
                                            _model.checkboxValue5 = newValue!);
                                      },
                                      side: BorderSide(
                                        width: 2,
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                      ),
                                      activeColor:
                                          FlutterFlowTheme.of(context).primary,
                                      checkColor:
                                          FlutterFlowTheme.of(context).info,
                                    ),
                                  ),
                                  FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 100.0,
                                    buttonSize: 40.0,
                                    hoverColor:
                                        FlutterFlowTheme.of(context).alternate,
                                    icon: Icon(
                                      Icons.more_vert,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 20.0,
                                    ),
                                    onPressed: () {
                                      print('IconButton pressed ...');
                                    },
                                  ),
                                  Expanded(
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'lkv1i5xm' /* 4 */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'eatspgsb' /* 800046776 */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        '4vqrbaz3' /* K10A/5A */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'urco0mdh' /* INDUSTRIAL */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        '04apfo91' /* TOU02 */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'mll54e0v' /* HES */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'voitge35' /* Inactive */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'a351yvhi' /* Ti Fong */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        '9emvzl29' /* 06/01/2024 */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'rf1rt9cx' /* 06/01/2024 */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ),
                                ].divide(SizedBox(width: 14.0)),
                              ),
                            ),
                          ),
                        ),
                        onEnter: ((event) async {
                          safeSetState(() => _model.mouseRegionHovered4 = true);
                        }),
                        onExit: ((event) async {
                          safeSetState(
                              () => _model.mouseRegionHovered4 = false);
                        }),
                      ),
                    ].divide(SizedBox(height: 6.0)),
                  ),
                ].divide(SizedBox(height: 16.0)),
              ),
            wrapWithModel(
              model: _model.pagenationComponentModel,
              updateCallback: () => safeSetState(() {}),
              child: PagenationComponentWidget(),
            ),
          ].divide(SizedBox(height: 16.0)),
        ),
      ),
    );
  }
}
