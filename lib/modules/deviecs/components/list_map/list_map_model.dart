import '/flutter_flow/flutter_flow_util.dart';
import 'list_map_widget.dart' show ListMapWidget;
import 'package:flutter/material.dart';

class ListMapModel extends FlutterFlowModel<ListMapWidget> {
  ///  Local state fields for this component.

  List<String> listMaps = [];
  void addToListMaps(String item) => listMaps.add(item);
  void removeFromListMaps(String item) => listMaps.remove(item);
  void removeAtIndexFromListMaps(int index) => listMaps.removeAt(index);
  void insertAtIndexInListMaps(int index, String item) =>
      listMaps.insert(index, item);
  void updateListMapsAtIndex(int index, Function(String) updateFn) =>
      listMaps[index] = updateFn(listMaps[index]);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
