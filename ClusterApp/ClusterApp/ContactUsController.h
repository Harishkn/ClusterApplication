//
//  ContactUsController.h
//  ClusterApp
//
//  Created by test on 11/7/16.
//  Copyright © 2016 test. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>


@interface ContactUsController : UIViewController<MKMapViewDelegate>
@property (nonatomic, strong) IBOutlet MKMapView *mapView;

@property(strong,nonatomic)NSString* latitude;
@property(strong,nonatomic)NSString* longitude;
@end
