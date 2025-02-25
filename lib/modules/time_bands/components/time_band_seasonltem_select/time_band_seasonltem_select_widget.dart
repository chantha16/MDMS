import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/modules/time_bands/components/time_band_season_item/time_band_season_item_widget.dart';
import 'package:epower_library_llyhdh/app_state.dart'
    as epower_library_llyhdh_app_state;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'time_band_seasonltem_select_model.dart';
export 'time_band_seasonltem_select_model.dart';

class TimeBandSeasonltemSelectWidget extends StatefulWidget {
  const TimeBandSeasonltemSelectWidget({
    super.key,
    required this.actionAdd,
    this.actionDetail,
    this.onRemove,
    this.type,
  });

  final Future Function()? actionAdd;
  final Future Function(int id)? actionDetail;
  final Future Function()? onRemove;
  final Flag? type;

  @override
  State<TimeBandSeasonltemSelectWidget> createState() =>
      _TimeBandSeasonltemSelectWidgetState();
}

class _TimeBandSeasonltemSelectWidgetState
    extends State<TimeBandSeasonltemSelectWidget> {
  late TimeBandSeasonltemSelectModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TimeBandSeasonltemSelectModel());

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
    context.watch<epower_library_llyhdh_app_state.FFAppState>();

    return Container(
      decoration: BoxDecoration(),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          if ((widget.type == Flag.Add) || (widget.type == Flag.Update))
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                await widget.actionAdd?.call();
              },
              child: Icon(
                Icons.add_circle_sharp,
                color: FlutterFlowTheme.of(context).primary,
                size: 24.0,
              ),
            ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Wrap(
                      spacing: 8.0,
                      runSpacing: 8.0,
                      alignment: WrapAlignment.start,
                      crossAxisAlignment: WrapCrossAlignment.start,
                      direction: Axis.horizontal,
                      runAlignment: WrapAlignment.start,
                      verticalDirection: VerticalDirection.down,
                      clipBehavior: Clip.none,
                      children: [
                        Builder(
                          builder: (context) {
                            final item = FFAppState().seasonState.toList();

                            return Wrap(
                              spacing: 8.0,
                              runSpacing: 8.0,
                              alignment: WrapAlignment.start,
                              crossAxisAlignment: WrapCrossAlignment.start,
                              direction: Axis.horizontal,
                              runAlignment: WrapAlignment.start,
                              verticalDirection: VerticalDirection.down,
                              clipBehavior: Clip.none,
                              children: List.generate(item.length, (itemIndex) {
                                final itemItem = item[itemIndex];
                                return TimeBandSeasonItemWidget(
                                  key: Key(
                                      'Keylqe_${itemIndex}_of_${item.length}'),
                                  text: valueOrDefault<String>(
                                    itemItem.name,
                                    'text',
                                  ),
                                  type: widget.type,
                                  moreAction: () async {
                                    await widget.actionDetail?.call(
                                      itemItem.id,
                                    );
                                  },
                                  removeAction: () async {
                                    FFAppState()
                                        .removeFromSeasonState(itemItem);
                                    safeSetState(() {});
                                    await widget.onRemove?.call();
                                  },
                                );
                              }),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]
            .divide(SizedBox(width: 8.0))
            .addToStart(SizedBox(width: 8.0))
            .addToEnd(SizedBox(width: 8.0)),
      ),
    );
  }
}
