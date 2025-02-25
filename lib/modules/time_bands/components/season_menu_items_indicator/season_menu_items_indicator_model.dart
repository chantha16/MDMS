import '/flutter_flow/flutter_flow_util.dart';
import 'season_menu_items_indicator_widget.dart'
    show SeasonMenuItemsIndicatorWidget;
import 'package:flutter/material.dart';

class SeasonMenuItemsIndicatorModel
    extends FlutterFlowModel<SeasonMenuItemsIndicatorWidget> {
  ///  Local state fields for this component.

  List<String> itemsTemp = [];
  void addToItemsTemp(String item) => itemsTemp.add(item);
  void removeFromItemsTemp(String item) => itemsTemp.remove(item);
  void removeAtIndexFromItemsTemp(int index) => itemsTemp.removeAt(index);
  void insertAtIndexInItemsTemp(int index, String item) =>
      itemsTemp.insert(index, item);
  void updateItemsTempAtIndex(int index, Function(String) updateFn) =>
      itemsTemp[index] = updateFn(itemsTemp[index]);

  ///  State fields for stateful widgets in this component.

  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered = false;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
