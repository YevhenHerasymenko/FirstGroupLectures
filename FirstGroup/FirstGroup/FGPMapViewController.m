//
//  FGPMapViewController.m
//  FirstGroup
//
//  Created by Yevhen Herasymenko on 15/12/2015.
//  Copyright © 2015 YevhenHerasymenko. All rights reserved.
//

#import "FGPMapViewController.h"
#import <MapKit/MapKit.h>

@interface FGPMapViewController ()<MKMapViewDelegate, CLLocationManagerDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@property (strong, nonatomic) CLLocationManager *locationManager;

@end

@implementation FGPMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    
    [self.locationManager startUpdatingLocation];
    [self.locationManager requestAlwaysAuthorization];
//    NSString *template = @"http://tile.openstreetmap.org/{z}/{x}/{y}.png";         // (1)
//    MKTileOverlay *overlay = [[MKTileOverlay alloc] initWithURLTemplate:template]; // (2)
//    overlay.canReplaceMapContent = YES;                        // (3)
//    [self.mapView addOverlay:overlay level:MKOverlayLevelAboveLabels];         // (4)
    
    MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
    annotation.coordinate = CLLocationCoordinate2DMake(50, 36);
    annotation.title = @"Super Pin";
    annotation.subtitle = @"ssssss";
    [self.mapView addAnnotation:annotation];
    [self showPath];
    
    self.mapView.region = MKCoordinateRegionMake(CLLocationCoordinate2DMake(50, 36), MKCoordinateSpanMake(1, 1));
}

- (void)myMethod:(NSInteger)integer {
    integer++;
    if (integer < 5) {
        [self myMethod:integer];
    }
}

- (void)showPath {
    MKPlacemark *placemarkSrc = [[MKPlacemark alloc] initWithCoordinate:CLLocationCoordinate2DMake(50.02, 36.19) addressDictionary:nil];
    MKMapItem *mapItemSrc = [[MKMapItem alloc] initWithPlacemark:placemarkSrc];
    MKPlacemark *placemarkDest = [[MKPlacemark alloc] initWithCoordinate:CLLocationCoordinate2DMake(50.05, 36.22) addressDictionary:nil];
    MKMapItem *mapItemDest = [[MKMapItem alloc] initWithPlacemark:placemarkDest];
    [mapItemSrc setName:@"name1"];
    [mapItemDest setName:@"name2"];
    
    MKDirectionsRequest *request = [[MKDirectionsRequest alloc] init];
    [request setSource:mapItemSrc];
    [request setDestination:mapItemDest];
    [request setTransportType:MKDirectionsTransportTypeAutomobile];
    request.requestsAlternateRoutes = NO;
    
    MKDirections *directions = [[MKDirections alloc] initWithRequest:request];
    
    [directions calculateDirectionsWithCompletionHandler:
     ^(MKDirectionsResponse *response, NSError *error) {
         if (error) {
             // Handle Error
         } else {
             [_mapView removeOverlays:_mapView.overlays];
             for (MKRoute *route in response.routes)
             {
                 [self.mapView
                  addOverlay:route.polyline level:MKOverlayLevelAboveRoads];
             }
         }
     }];
}

- (MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id < MKOverlay >)overlay
{
    MKPolylineRenderer *renderer =
    [[MKPolylineRenderer alloc] initWithOverlay:overlay];
    renderer.strokeColor = [UIColor blueColor];
    renderer.lineWidth = 5.0;
    return renderer;
}

// Place this into your -viewDidLoad method

// And this somewhere in your class that’s mapView’s delegate (most likely a view controller).
//- (MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id)overlay {
//    if ([overlay isKindOfClass:[MKTileOverlay class]]) {
//        return [[MKTileOverlayRenderer alloc] initWithTileOverlay:overlay];
//    } else {
//        return nil;
//    }
//}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    MKAnnotationView *annView=(MKAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:@"annotation"];
    if (annView==nil) {
        annView=[[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"annotation"];
    }
    annView.canShowCallout = YES;
    UIImage *image = [UIImage imageNamed:@"pin_2"];
    annView.image = image;
    annView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    annView.centerOffset = CGPointMake(0, -image.size.height / 2);
    return annView;
}

//- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view {
//    
//}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control {
    
}

- (IBAction)tapMap:(UITapGestureRecognizer *)sender {
    CGPoint point = [sender locationInView:self.mapView];
    CLLocationCoordinate2D mapCoordinate = [self.mapView convertPoint:point toCoordinateFromView:self.mapView];
    
    MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
    annotation.coordinate = mapCoordinate;
    annotation.title = @"Added point";
    annotation.subtitle = @"pointtt";
    [self.mapView addAnnotation:annotation];
}

@end
