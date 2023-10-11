import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'form_form_widget_widget.dart' show FormFormWidgetWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FormFormWidgetModel extends FlutterFlowModel<FormFormWidgetWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for text_field_name widget.
  TextEditingController? textFieldNameController;
  String? Function(BuildContext, String?)? textFieldNameControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    textFieldNameController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
