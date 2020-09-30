import 'dart:io';
import 'package:dio/dio.dart';
import 'package:ext_storage/ext_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:recipeapp/util/data.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';

class Details extends StatefulWidget {
  Details({Key key, @required this.food, this.index}) : super(key: key);
  List food;
  int index;

  @override
  _DetailsState createState() => _DetailsState(food: food);
}

class _DetailsState extends State<Details> {
  _DetailsState({this.food, this.index});
  List food;
  int index;

  bool isdownloading = false;

  var progessString = "";

  String assetPDFpath = "";

  @override
  void initState() {
    super.initState();

    getPdfFromAsset("img/${widget.food[widget.index]['pdf']}").then((f) {
      setState(() {
        assetPDFpath = f.path;
      });
    });

    getPermission();
  }

  Future<File> getPdfFromAsset(String asset) async {
    try {
      var data = await rootBundle.load(asset);
      var bytes = data.buffer.asInt8List();
      var dir = await getApplicationDocumentsDirectory();

      File file = File("${dir.path}/${widget.food[widget.index]['pdf']}");

      File assetFile = await file.writeAsBytes(bytes);
      return assetFile;
    } catch (e) {
      throw Exception("Error Openning asset File");
    }
  }

  //String imgUrl = "${widget.food[widget.index]['link']}";
  var dio = Dio();

  void showDownloadProgress(received, total) {
    if (total != -1) {
      print((received / total * 100).toStringAsFixed(0) + "%");
      setState(() {
        isdownloading = true;
        progessString = (received / total * 100).toStringAsFixed(0) + "%";
      });
     
    }
  }

  void getPermission() async {
    print("getPermission");
    await PermissionHandler().requestPermissions([PermissionGroup.storage]);
  }

  Future download(Dio dio, String url, String savePath) async {
    try {
      Response response = await dio.get(
        url,
        onReceiveProgress: showDownloadProgress,
        options: Options(
            responseType: ResponseType.bytes,
            followRedirects: false,
            validateStatus: (status) {
              return status < 500;
            }),
      );

      File file = File(savePath);
      var raf = file.openSync(mode: FileMode.write);
      raf.writeFromSync(response.data);
      await raf.close();
    } catch (e) {
      print("Error is");
      print(e);
     
    }

    setState(() {
      isdownloading = false;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(
          "${widget.food[widget.index]['name']}",
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w900,
            fontFamily: 'Lobster',
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: Container(
              height: 250,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  widget.food[widget.index]["img"],
                  height: 240,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              "${widget.food[widget.index]["name"]}",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w900,
                fontFamily: 'Lobster',
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              "What You Need",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: 'Alike',
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "${widget.food[widget.index]['ff']}",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Alike',
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Ingredients",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Quando',
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "${widget.food[widget.index]['1']}",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                    fontWeight: FontWeight.w800,
                    fontFamily: 'Alike',
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: RaisedButton(
                color: Colors.blueGrey,
                child: Text(
                  'View Guide',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  if (assetPDFpath != null) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                PdfViewPage(path: assetPDFpath)));
                  }
                }),
          ),
          SizedBox(height: 20),
          isdownloading
              ? Column(
                children: <Widget>[
                  CircularProgressIndicator(),
                  Text('Downloading..... : $progessString'),
                ]
                ): Offstage(),
          // Padding(
          //   padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          //   child: RaisedButton(
          //       color: Colors.blueGrey,
          //       child: Text(),
          //       onPressed: () async {
          //         String path =
          //             await ExtStorage.getExternalStoragePublicDirectory(
          //                 ExtStorage.DIRECTORY_DOWNLOADS);
          //         String fullPath = "$path/Recipe.pdf";
          //         download(dio,"https://cookpad.com/ng/recipes/7345484-okro-soup-and-white-amala.pdf", fullPath);
          //       }),
          // ),
          Padding(
            padding: const EdgeInsets.only(
              left: 10.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Other Dishes',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                FlatButton(
                  onPressed: () {},
                  child: Text(
                    'View More',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
          Container(
              height: 200,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: recipes.length,
                  itemBuilder: (BuildContext context, int index) {
                    Map recipe = recipes[index];
                    //  Map recipe = recipes.reversed.toList()[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (BuildContext context) {
                          return Details(
                            food: recipes,
                            index: index,
                          );
                        }));
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 4),
                        child: Container(
                            width: 130,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Card(
                                      child: Column(children: <Widget>[
                                        Image.asset(
                                          "${recipe["img"]}",
                                          height: 110,
                                          fit: BoxFit.cover,
                                        ),
                                        Column(
                                          children: [
                                            SizedBox(height: 8.0),
                                            Text(
                                              recipe["name"],
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily: 'Alike',
                                                  ),
                                            ),
                                            SizedBox(height: 8.0),
                                            Text(
                                              'Click to View Recipe',
                                              style: TextStyle(
                                                color: Colors.red,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600,
                                                fontFamily: 'Satisfy',
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10.0,
                                            )
                                          ],
                                        )
                                      ]),
                                    )),
                              ],
                            )),
                      ),
                    );
                  })),
        ],
      ),
    );
  }
}

class PdfViewPage extends StatefulWidget {
  final String path;

  const PdfViewPage({Key key, this.path}) : super(key: key);

  @override
  _PdfViewPageState createState() => _PdfViewPageState();
}

class _PdfViewPageState extends State<PdfViewPage> {
  bool pdfReady = false;
  int _totalPages = 0;
  int _currentPage = 0;
  PDFViewController _pdfViewController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Document"),
      ),
      body: Stack(children: <Widget>[
        PDFView(
          filePath: widget.path,
          autoSpacing: true,
          enableSwipe: true,
          pageSnap: true,
          swipeHorizontal: true,
          onError: (e) {
            print(e);
          },
          onRender: (_pages) {
            setState(() {
              _totalPages = _pages;
              pdfReady = true;
            });
          },
          onViewCreated: (PDFViewController vc) {
            _pdfViewController = vc;
          },
          onPageChanged: (int page, int total) {
            setState(() {});
          },
          onPageError: (page, e) {},
        ),
        !pdfReady ? Center(child: CircularProgressIndicator()) : Offstage(),
      ]),
      floatingActionButton:
          Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
        _currentPage > 0
            ? FloatingActionButton.extended(
                backgroundColor: Colors.red,
                label: Text('Back ${_currentPage - 1}'),
                onPressed: () {
                  _currentPage -= 1;
                  _pdfViewController.setPage(_currentPage);
                },
              )
            : Offstage(),
        _currentPage < _totalPages
            ? FloatingActionButton.extended(
                backgroundColor: Colors.blue,
                label: Text('Next ${_currentPage + 1}'),
                onPressed: () {
                  _currentPage += 1;
                  _pdfViewController.setPage(_currentPage);
                },
              )
            : Offstage(),
      ]),
    );
  }
}
