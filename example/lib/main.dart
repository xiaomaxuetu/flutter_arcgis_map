import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_arcgis_map/flutter_arcgis_map.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    // try {
    //   platformVersion =
    //       await FlutterArcgisMap.platformVersion ?? 'Unknown platform version';
    // } on PlatformException {
    //   platformVersion = 'Failed to get platform version.';
    // }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    // setState(() {
    //   _platformVersion = platformVersion;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: ArcgisMapViewWidget(
            licenseKey:
                "runtimelite,1000,rud5184119841,none,5H80TK8EL7G2J9HSX059",
            imageLayerUrl:
                "http://58.210.54.58:8188/arcgis/rest/services/SZGW/XKGS/MapServer",
            tiledLayerUrl:
                "http://58.210.54.58:8188/ServiceEngine/rest/services/GHYDX/MapServer",
            extent: "42087.631,36347.275,38936.501,34010.963",
            wkid: 2437,
          ),
        ),
      ),
    );
  }
}
