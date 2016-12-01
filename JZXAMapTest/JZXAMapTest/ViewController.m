//
//  ViewController.m
//  JZXAMapTest
//
//  Created by macbook on 16/11/30.
//  Copyright © 2016年 macbook. All rights reserved.
//

#import "ViewController.h"
#import <MAMapKit/MAMapKit.h>
@interface ViewController ()<MAMapViewDelegate>
/** mapView */
@property (strong, nonatomic) MAMapView *mapView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    NSLog(@"developing");

    NSLog(@"start developer");

    [self setUpMapView];
}

- (void)viewWillAppear:(BOOL)animated {
    MAPointAnnotation *pointAnnotation = [[MAPointAnnotation alloc] init];
    pointAnnotation.coordinate = CLLocationCoordinate2DMake(39.989631, 116.481018);
    pointAnnotation.title = @"方恒国际";
    pointAnnotation.subtitle = @"阜通东大街6号";
    
    [self.mapView addAnnotation:pointAnnotation];
    
//    [self.mapView setZoomLevel:10 animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - SetUpMethod
- (void)setUpMapView {
    [self.view addSubview:self.mapView];
}

#pragma mark - Attribute 
- (MAMapView *)mapView{
    if (!_mapView) {
        _mapView = [[MAMapView alloc] initWithFrame:self.view.bounds];
//        _mapView.language = MAMapLanguageEn;
        _mapView.showsScale = NO;
//        _mapView.showTraffic = YES;
        _mapView.showsUserLocation = YES;
//        _mapView.showsCompass = NO;
        _mapView.compassOrigin = CGPointMake(_mapView.center.x-_mapView.compassSize.width*0.5, _mapView.center.y-_mapView.compassSize.height*0.5);
        _mapView.delegate = self;
        
    }
    return _mapView;
}

#pragma mark - MAMapViewDelegate
- (MAAnnotationView *)mapView:(MAMapView *)mapView viewForAnnotation:(id <MAAnnotation>)annotation
{
    if ([annotation isKindOfClass:[MAPointAnnotation class]])
    {
        static NSString *pointReuseIndentifier = @"pointReuseIndentifier";
        MAPinAnnotationView*annotationView = (MAPinAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:pointReuseIndentifier];
        if (annotationView == nil)
        {
            annotationView = [[MAPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:pointReuseIndentifier];
        }
        annotationView.canShowCallout= YES;       //设置气泡可以弹出，默认为NO
        annotationView.animatesDrop = YES;        //设置标注动画显示，默认为NO
        annotationView.draggable = YES;        //设置标注可以拖动，默认为NO
        annotationView.pinColor = MAPinAnnotationColorRed;
        return annotationView;
    }
    return nil;
}

@end
