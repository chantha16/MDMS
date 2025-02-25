import '/flutter_flow/flutter_flow_util.dart';
import 'select_time_of_use_widget.dart' show SelectTimeOfUseWidget;
import 'package:flutter/material.dart';

class SelectTimeOfUseModel extends FlutterFlowModel<SelectTimeOfUseWidget> {
  ///  Local state fields for this component.

  List<String> register = [];
  void addToRegister(String item) => register.add(item);
  void removeFromRegister(String item) => register.remove(item);
  void removeAtIndexFromRegister(int index) => register.removeAt(index);
  void insertAtIndexInRegister(int index, String item) =>
      register.insert(index, item);
  void updateRegisterAtIndex(int index, Function(String) updateFn) =>
      register[index] = updateFn(register[index]);

  ///  State fields for stateful widgets in this component.

  // State field(s) for Register widget.
  FocusNode? registerFocusNode;
  TextEditingController? registerTextController;
  String? Function(BuildContext, String?)? registerTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    registerFocusNode?.dispose();
    registerTextController?.dispose();
  }
}
