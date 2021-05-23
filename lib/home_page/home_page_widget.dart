import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageWidget extends StatefulWidget {
  HomePageWidget({
    Key key,
    this.resimUrl,
  }) : super(key: key);

  final String resimUrl;

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<AydinKadinDogumRecord>>(
      stream: queryAydinKadinDogumRecord(
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }
        List<AydinKadinDogumRecord> homePageAydinKadinDogumRecordList =
            snapshot.data;
        // Customize what your widget looks like with no query results.
        if (snapshot.data.isEmpty) {
          // return Container();
          // For now, we'll just include some dummy data.
          homePageAydinKadinDogumRecordList =
              createDummyAydinKadinDogumRecord(count: 1);
        }
        final homePageAydinKadinDogumRecord =
            homePageAydinKadinDogumRecordList.first;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: Color(0xFF9E9E9E),
          body: SafeArea(
            child: StreamBuilder<List<AydinKadinDogumRecord>>(
              stream: queryAydinKadinDogumRecord(
                limit: 100,
              ),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }
                List<AydinKadinDogumRecord> listViewAydinKadinDogumRecordList =
                    snapshot.data;
                // Customize what your widget looks like with no query results.
                if (snapshot.data.isEmpty) {
                  // return Container();
                  // For now, we'll just include some dummy data.
                  listViewAydinKadinDogumRecordList =
                      createDummyAydinKadinDogumRecord(count: 100);
                }
                return ListView.builder(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.vertical,
                  itemCount: listViewAydinKadinDogumRecordList.length,
                  itemBuilder: (context, listViewIndex) {
                    final listViewAydinKadinDogumRecord =
                        listViewAydinKadinDogumRecordList[listViewIndex];
                    return Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      color: Color(0xFFF5F5F5),
                    );
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }
}
