//
//  ArcgisMapViewFactory.m
//  flutter_arcgis_map
//
//  Created by 马永欣 on 2021/7/19.
//

#import "ArcgisMapViewFactory.h"
#import "IOSTextView.h"

@implementation ArcgisMapViewFactory{
    NSObject<FlutterBinaryMessenger>*_messenger;
}
- (instancetype)initWithMessenger:(NSObject<FlutterBinaryMessenger> *)messager{
    self = [super init];
    if (self) {
        _messenger = messager;
    }
    return self;
}

-(NSObject<FlutterMessageCodec> *)createArgsCodec{
    return [FlutterStandardMessageCodec sharedInstance];
}

-(NSObject<FlutterPlatformView> *)createWithFrame:(CGRect)frame viewIdentifier:(int64_t)viewId arguments:(id)args{
    IOSTextView *iosTextView = [[IOSTextView alloc] initWithFrame:frame viewIdentifier:viewId arguments:args binaryMessenger:_messenger];
    return iosTextView;
}

@end
