import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'device_item_widget_model.dart';
export 'device_item_widget_model.dart';

class DeviceItemWidgetWidget extends StatefulWidget {
  const DeviceItemWidgetWidget({
    Key? key,
    required this.device,
  }) : super(key: key);

  final DevicesRecord? device;

  @override
  _DeviceItemWidgetWidgetState createState() => _DeviceItemWidgetWidgetState();
}

class _DeviceItemWidgetWidgetState extends State<DeviceItemWidgetWidget> {
  late DeviceItemWidgetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DeviceItemWidgetModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      context.pushNamed(
        'device',
        queryParameters: {
          'room': serializeParam(
            widget.device,
            ParamType.Document,
          ),
        }.withoutNulls,
        extra: <String, dynamic>{
          'room': widget.device,
        },
      );
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      color: widget.device!.status
          ? FlutterFlowTheme.of(context).tertiary
          : Color(0x00000000),
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 12.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 12.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  widget.device!.photo,
                  width: 100.0,
                  height: 100.0,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Text(
              valueOrDefault<String>(
                widget.device?.name,
                '-',
              ),
              style: FlutterFlowTheme.of(context).bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
