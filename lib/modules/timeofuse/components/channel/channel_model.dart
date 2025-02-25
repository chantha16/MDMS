import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'channel_widget.dart' show ChannelWidget;
import 'package:flutter/material.dart';

class ChannelModel extends FlutterFlowModel<ChannelWidget> {
  ///  Local state fields for this component.

  List<ChannelStruct> chennel = [];
  void addToChennel(ChannelStruct item) => chennel.add(item);
  void removeFromChennel(ChannelStruct item) => chennel.remove(item);
  void removeAtIndexFromChennel(int index) => chennel.removeAt(index);
  void insertAtIndexInChennel(int index, ChannelStruct item) =>
      chennel.insert(index, item);
  void updateChennelAtIndex(int index, Function(ChannelStruct) updateFn) =>
      chennel[index] = updateFn(chennel[index]);

  int offset = 0;

  String? searchField;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (Read All Channels)] action in Channel widget.
  ApiCallResponse? apiChannelResponse;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (Read All Channels)] action in TextField widget.
  ApiCallResponse? apiRequestSearch;
  // Stores action output result for [Backend Call - API (Read Channels)] action in Container widget.
  ApiCallResponse? findChannel;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
