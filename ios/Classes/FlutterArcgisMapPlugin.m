#import "FlutterArcgisMapPlugin.h"
#import <ArcgisMapViewFactory.h>
@implementation FlutterArcgisMapPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"flutter_arcgis_map"
            binaryMessenger:[registrar messenger]];
  FlutterArcgisMapPlugin* instance = [[FlutterArcgisMapPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
    [registrar registerViewFactory:[[ArcgisMapViewFactory alloc] init] withId:@"arcgis_map_view"];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"getPlatformVersion" isEqualToString:call.method]) {
    result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
  } else {
    result(FlutterMethodNotImplemented);
  }
}

@end
