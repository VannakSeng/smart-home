import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/room_item_widget/room_item_widget_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'rooms_model.dart';
export 'rooms_model.dart';

class RoomsWidget extends StatefulWidget {
  const RoomsWidget({Key? key}) : super(key: key);

  @override
  _RoomsWidgetState createState() => _RoomsWidgetState();
}

class _RoomsWidgetState extends State<RoomsWidget> {
  late RoomsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RoomsModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              var roomsRecordReference = RoomsRecord.collection.doc();
              await roomsRecordReference.set(createRoomsRecordData(
                name: 'test-1',
                active: true,
                userId: currentUserReference,
              ));
              _model.newRoom = RoomsRecord.getDocumentFromData(
                  createRoomsRecordData(
                    name: 'test-1',
                    active: true,
                    userId: currentUserReference,
                  ),
                  roomsRecordReference);

              context.pushNamed(
                'room',
                queryParameters: {
                  'room': serializeParam(
                    _model.newRoom,
                    ParamType.Document,
                  ),
                }.withoutNulls,
                extra: <String, dynamic>{
                  'room': _model.newRoom,
                },
              );

              setState(() {});
            },
            backgroundColor: FlutterFlowTheme.of(context).primary,
            elevation: 8.0,
            child: Icon(
              Icons.add,
              color: FlutterFlowTheme.of(context).secondaryText,
              size: 24.0,
            ),
          ),
          body: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(0.00, 1.00),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    FFAppState().background,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.00, 0.00),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 44.0, 16.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            FFLocalizations.of(context).getText(
                              'lx4n0a2s' /* Smart Home */,
                            ),
                            style: FlutterFlowTheme.of(context).displaySmall,
                          ),
                          AuthUserStreamWidget(
                            builder: (context) => Container(
                              width: 40.0,
                              height: 40.0,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image.network(
                                currentUserPhoto,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: StreamBuilder<List<RoomsRecord>>(
                      stream: queryRoomsRecord(
                        queryBuilder: (roomsRecord) => roomsRecord.where(
                          'user_id',
                          isEqualTo: currentUserReference,
                        ),
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
                        List<RoomsRecord> listViewRoomsRecordList =
                            snapshot.data!;
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.vertical,
                          itemCount: listViewRoomsRecordList.length,
                          itemBuilder: (context, listViewIndex) {
                            final listViewRoomsRecord =
                                listViewRoomsRecordList[listViewIndex];
                            return FutureBuilder<ApiCallResponse>(
                              future: RoomGroup.getAllCall.call(),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                final roomItemGetAllResponse = snapshot.data!;
                                return RoomItemWidgetWidget(
                                  key: Key(
                                      'Key6oe_${listViewIndex}_of_${listViewRoomsRecordList.length}'),
                                  data: listViewRoomsRecord,
                                );
                              },
                            );
                          },
                        );
                      },
                    ),
                  ),
                ].divide(SizedBox(height: 16.0)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
