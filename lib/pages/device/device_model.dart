import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'device_widget.dart' show DeviceWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DeviceModel extends FlutterFlowModel<DeviceWidget> {
  ///  Local state fields for this page.

  String photo = 'false';

  DevicesRecord? data;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for TextFieldDeviceName widget.
  FocusNode? textFieldDeviceNameFocusNode;
  TextEditingController? textFieldDeviceNameController;
  String? Function(BuildContext, String?)?
      textFieldDeviceNameControllerValidator;
  // State field(s) for active widget.
  bool? activeValue;
  // State field(s) for status widget.
  bool? statusValue;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    textFieldDeviceNameFocusNode?.dispose();
    textFieldDeviceNameController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
