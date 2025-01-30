import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'sample_data_table_model.dart';
export 'sample_data_table_model.dart';

class SampleDataTableWidget extends StatefulWidget {
  const SampleDataTableWidget({super.key});

  @override
  State<SampleDataTableWidget> createState() => _SampleDataTableWidgetState();
}

class _SampleDataTableWidgetState extends State<SampleDataTableWidget> {
  late SampleDataTableModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SampleDataTableModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Builder(
      builder: (context) {
        final item = FFAppState().SampleDummyJson2.toList();

        return FlutterFlowDataTable<dynamic>(
          controller: _model.paginatedDataTableController,
          data: item,
          columnsBuilder: (onSortChanged) => [
            DataColumn2(
              label: DefaultTextStyle.merge(
                softWrap: true,
                child: Icon(
                  Icons.arrow_back,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 24.0,
                ),
              ),
              fixedWidth: 30.0,
              onSort: onSortChanged,
            ),
            DataColumn2(
              label: DefaultTextStyle.merge(
                softWrap: true,
                child: Text(
                  FFLocalizations.of(context).getText(
                    'tgkddd6t' /* Edit Header 2 */,
                  ),
                  style: FlutterFlowTheme.of(context).labelLarge.override(
                        fontFamily: 'Inter',
                        letterSpacing: 0.0,
                      ),
                ),
              ),
            ),
            DataColumn2(
              label: DefaultTextStyle.merge(
                softWrap: true,
                child: Text(
                  FFLocalizations.of(context).getText(
                    'owhacu13' /* Edit Header 3 */,
                  ),
                  style: FlutterFlowTheme.of(context).labelLarge.override(
                        fontFamily: 'Inter',
                        letterSpacing: 0.0,
                      ),
                ),
              ),
              onSort: onSortChanged,
            ),
            DataColumn2(
              label: DefaultTextStyle.merge(
                softWrap: true,
                child: Text(
                  FFLocalizations.of(context).getText(
                    '5ryd6wqs' /* Edit Header 4 */,
                  ),
                  style: FlutterFlowTheme.of(context).labelLarge.override(
                        fontFamily: 'Inter',
                        letterSpacing: 0.0,
                      ),
                ),
              ),
            ),
            DataColumn2(
              label: DefaultTextStyle.merge(
                softWrap: true,
                child: Text(
                  FFLocalizations.of(context).getText(
                    'cbs9j2j5' /* Edit Header 5 */,
                  ),
                  style: FlutterFlowTheme.of(context).labelLarge.override(
                        fontFamily: 'Inter',
                        letterSpacing: 0.0,
                      ),
                ),
              ),
            ),
            DataColumn2(
              label: DefaultTextStyle.merge(
                softWrap: true,
                child: Text(
                  FFLocalizations.of(context).getText(
                    'oikq9nyu' /* Edit Header 6 */,
                  ),
                  style: FlutterFlowTheme.of(context).labelLarge.override(
                        fontFamily: 'Inter',
                        letterSpacing: 0.0,
                      ),
                ),
              ),
            ),
            DataColumn2(
              label: DefaultTextStyle.merge(
                softWrap: true,
                child: Text(
                  FFLocalizations.of(context).getText(
                    '1yag5if4' /* Edit Header 7 */,
                  ),
                  style: FlutterFlowTheme.of(context).labelLarge.override(
                        fontFamily: 'Inter',
                        letterSpacing: 0.0,
                      ),
                ),
              ),
            ),
          ],
          dataRowBuilder: (itemItem, itemIndex, selected, onSelectChanged) =>
              DataRow(
            selected: selected,
            onSelectChanged: onSelectChanged,
            color: MaterialStateProperty.all(
              itemIndex % 2 == 0
                  ? FlutterFlowTheme.of(context).secondaryBackground
                  : FlutterFlowTheme.of(context).primaryBackground,
            ),
            cells: [
              Icon(
                Icons.arrow_back,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 24.0,
              ),
              Text(
                FFLocalizations.of(context).getText(
                  'blghwo0x' /* Edit Column 2 */,
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Inter',
                      letterSpacing: 0.0,
                    ),
              ),
              Text(
                FFLocalizations.of(context).getText(
                  'wrweudak' /* Edit Column 3 */,
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Inter',
                      letterSpacing: 0.0,
                    ),
              ),
              Text(
                FFLocalizations.of(context).getText(
                  'be8d16q9' /* Edit Column 4 */,
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Inter',
                      letterSpacing: 0.0,
                    ),
              ),
              Text(
                FFLocalizations.of(context).getText(
                  'obxfkyup' /* Edit Column 5 */,
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Inter',
                      letterSpacing: 0.0,
                    ),
              ),
              Text(
                FFLocalizations.of(context).getText(
                  '5qaa78vo' /* Edit Column 6 */,
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Inter',
                      letterSpacing: 0.0,
                    ),
              ),
              Text(
                FFLocalizations.of(context).getText(
                  'sfdfht65' /* Edit Column 7 */,
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Inter',
                      letterSpacing: 0.0,
                    ),
              ),
            ].map((c) => DataCell(c)).toList(),
          ),
          paginated: true,
          selectable: true,
          hidePaginator: false,
          showFirstLastButtons: false,
          headingRowHeight: 56.0,
          dataRowHeight: 48.0,
          columnSpacing: 20.0,
          headingRowColor: FlutterFlowTheme.of(context).primaryBackground,
          sortIconColor: FlutterFlowTheme.of(context).primary,
          borderRadius: BorderRadius.circular(8.0),
          addHorizontalDivider: true,
          addTopAndBottomDivider: false,
          hideDefaultHorizontalDivider: true,
          horizontalDividerColor:
              FlutterFlowTheme.of(context).secondaryBackground,
          horizontalDividerThickness: 1.0,
          addVerticalDivider: false,
          checkboxUnselectedFillColor: Colors.transparent,
          checkboxSelectedFillColor: Colors.transparent,
          checkboxCheckColor: Color(0x8A000000),
          checkboxUnselectedBorderColor: Color(0x8A000000),
          checkboxSelectedBorderColor: Color(0x8A000000),
        );
      },
    );
  }
}
