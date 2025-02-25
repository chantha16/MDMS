import '/flutter_flow/flutter_flow_util.dart';
import 'c_add_integration_widget.dart' show CAddIntegrationWidget;
import 'package:flutter/material.dart';

class CAddIntegrationModel extends FlutterFlowModel<CAddIntegrationWidget> {
  ///  Local state fields for this component.

  List<String> itemsTemp = [];
  void addToItemsTemp(String item) => itemsTemp.add(item);
  void removeFromItemsTemp(String item) => itemsTemp.remove(item);
  void removeAtIndexFromItemsTemp(int index) => itemsTemp.removeAt(index);
  void insertAtIndexInItemsTemp(int index, String item) =>
      itemsTemp.insert(index, item);
  void updateItemsTempAtIndex(int index, Function(String) updateFn) =>
      itemsTemp[index] = updateFn(itemsTemp[index]);

  List<String> items = [];
  void addToItems(String item) => items.add(item);
  void removeFromItems(String item) => items.remove(item);
  void removeAtIndexFromItems(int index) => items.removeAt(index);
  void insertAtIndexInItems(int index, String item) =>
      items.insert(index, item);
  void updateItemsAtIndex(int index, Function(String) updateFn) =>
      items[index] = updateFn(items[index]);

  ///  State fields for stateful widgets in this component.

  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered = false;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
