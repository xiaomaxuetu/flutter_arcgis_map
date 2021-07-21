import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

/// 这里使用了 statelessWidget
class ArcgisMapViewWidget extends StatelessWidget {
  ArcgisMapViewWidget(
      {required this.licenseKey,
      this.imageLayerUrl,
      this.tiledLayerUrl,
      this.extent,
      this.wkid});

  final String licenseKey;
  final String? imageLayerUrl;
  final String? tiledLayerUrl;
  final String? extent;
  final int? wkid;

  @override
  Widget build(BuildContext context) {
    // 根据运行平台判断执行代码
    if (defaultTargetPlatform == TargetPlatform.android) {
      return AndroidView(
        // 在 native 中的唯一标识符，需要与 native 侧的值相同
        viewType: "arcgis_map_view",
        // 在创建 AndroidView 的同时，可以传递参数
        creationParams: <String, dynamic>{
          "licenseKey": licenseKey,
          "imageLayerUrl": imageLayerUrl,
          "tiledLayerUrl": tiledLayerUrl,
          "extent": extent,
          "wkid": '$wkid'
        },
        // 用来编码 creationParams 的形式，可选 [StandardMessageCodec], [JSONMessageCodec], [StringCodec], or [BinaryCodec]
        // 如果存在 creationParams，则该值不能为null
        creationParamsCodec: const StandardMessageCodec(),
      );
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      return UiKitView(
        viewType: "arcgis_map_view",
        creationParams: <String, dynamic>{
          "licenseKey": licenseKey,
          "imageLayerUrl": imageLayerUrl,
          "tiledLayerUrl": tiledLayerUrl,
          "extent": extent
        },
        creationParamsCodec: const StandardMessageCodec(),
      );
    } else {
      return Text("不支持的平台");
    }
  }
}
