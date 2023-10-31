import '/backend/backend.dart';
import '/components/device_item_widget/device_item_widget_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'room_item_widget_model.dart';
export 'room_item_widget_model.dart';

class RoomItemWidgetWidget extends StatefulWidget {
  const RoomItemWidgetWidget({
    Key? key,
    required this.data,
  }) : super(key: key);

  final RoomsRecord? data;

  @override
  _RoomItemWidgetWidgetState createState() => _RoomItemWidgetWidgetState();
}

class _RoomItemWidgetWidgetState extends State<RoomItemWidgetWidget> {
  late RoomItemWidgetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RoomItemWidgetModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: AlignmentDirectional(-1.00, 0.00),
                child: Text(
                  widget.data!.name,
                  style: FlutterFlowTheme.of(context).titleMedium,
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-1.00, 0.00),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.pushNamed(
                      'room',
                      queryParameters: {
                        'room': serializeParam(
                          widget.data,
                          ParamType.Document,
                        ),
                      }.withoutNulls,
                      extra: <String, dynamic>{
                        'room': widget.data,
                      },
                    );
                  },
                  child: Text(
                    FFLocalizations.of(context).getText(
                      '9jqf3z2p' /* more */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyLarge.override(
                          fontFamily: 'Readex Pro',
                          color: FlutterFlowTheme.of(context).tertiary,
                          decoration: TextDecoration.underline,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 200.0,
          decoration: BoxDecoration(),
          child: StreamBuilder<List<DevicesRecord>>(
            stream: queryDevicesRecord(
              parent: widget.data?.reference,
              queryBuilder: (devicesRecord) => devicesRecord.where(
                'status',
                isEqualTo: true,
              ),
              limit: 3,
            ),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  ),
                );
              }
              List<DevicesRecord> listViewDevicesRecordList = snapshot.data!;
              return ListView.builder(
                padding: EdgeInsets.fromLTRB(
                  12.0,
                  0,
                  12.0,
                  0,
                ),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: listViewDevicesRecordList.length,
                itemBuilder: (context, listViewIndex) {
                  final listViewDevicesRecord =
                      listViewDevicesRecordList[listViewIndex];
                  return DeviceItemWidgetWidget(
                    key: Key(
                        'Key4px_${listViewIndex}_of_${listViewDevicesRecordList.length}'),
                    device: listViewDevicesRecord,
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
