//
//  IOSTextView.m
//  flutter_arcgis_map
//
//  Created by 马永欣 on 2021/7/19.
//

#import "IOSTextView.h"
#import <ArcGIS/ArcGIS.h>
@implementation IOSTextView{
    int64_t _viewId;
    FlutterMethodChannel* _channel;
    UILabel *_uiLabel;
    AGSMapView* _mapView;
}
- (instancetype)initWithFrame:(CGRect)frame viewIdentifier:(int64_t)viewId arguments:(id)args binaryMessenger:(NSObject<FlutterBinaryMessenger> *)messenger{
    
    [AGSArcGISRuntimeEnvironment setLicenseKey:args[@"licenseKey"] error:nil];
    _mapView = [[AGSMapView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    _mapView.map = [[AGSMap alloc] initWithBasemap:[[AGSBasemap alloc] init]];
    AGSArcGISTiledLayer *tiledLayer = [AGSArcGISTiledLayer ArcGISTiledLayerWithURL:[NSURL URLWithString:args[@"tiledLayerUrl"]]];
    AGSArcGISMapImageLayer *dynamicLayer = [AGSArcGISMapImageLayer ArcGISMapImageLayerWithURL:[NSURL URLWithString:args[@"imageLayerUrl"]]];
    [_mapView.map.basemap.baseLayers addObjectsFromArray:@[tiledLayer,dynamicLayer]];
    NSString* extent = args[@"extent"];
    NSArray *arr = [extent componentsSeparatedByString:@","];
    AGSSpatialReference *AGS_SPA = [AGSSpatialReference spatialReferenceWithWKID:2437];
    AGSPoint *point1 = AGSPointMake([arr[0] doubleValue], [arr[1] doubleValue], AGS_SPA);
    AGSPoint *point2 = AGSPointMake([arr[2] doubleValue], [arr[3] doubleValue], AGS_SPA);
    AGSPoint *point3 = AGSPointMake([arr[0] doubleValue], [arr[3] doubleValue], AGS_SPA);
    AGSPoint *point4 = AGSPointMake([arr[2] doubleValue], [arr[1] doubleValue], AGS_SPA);
    AGSPolygon *gon = [AGSPolygon polygonWithPoints:@[point1,point2,point3,point4]];
    [_mapView setViewpointGeometry:gon completion:^(BOOL finished) {
            
    }];

    
    
    
    return  self;
}

- (UIView *)view{
    return _mapView;
}


@end
