//
//  ContactUsController.m
//  ClusterApp
//
//  Created by test on 11/7/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ContactUsController.h"
#import "MapAnnotation.h"

@interface ContactUsController ()
- (IBAction)enquiryButton:(id)sender;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
@property(nonatomic, retain) CLLocationManager *locationManager;

@property (weak, nonatomic) IBOutlet UIView *secondView;
@property (weak, nonatomic) IBOutlet UIButton *enquiryButton;
- (IBAction)enquiry:(id)sender;

@property(strong,nonatomic)NSString* vijAddress;
@property(strong,nonatomic)NSString* rajAddress;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
- (IBAction)segmentedAction:(id)sender;
@end

@implementation ContactUsController
@synthesize mapView;

- (void)viewDidLoad {
    [super viewDidLoad];
    
     self.mapView.delegate = self;
    
    mapView.delegate = self;
    mapView.centerCoordinate = CLLocationCoordinate2DMake(12.9634, 77.5339);
    mapView.mapType = MKMapTypeHybrid;
    CLLocationCoordinate2D location;
    location.latitude = (double) 12.9634;
    
    location.longitude = (double) 77.5339;
    // Add the annotation to our map view
    MapAnnotation *newAnnotation = [[MapAnnotation alloc]
                                    initWithTitle:@"Vijay Nagar Branch" andCoordinate:location];
    [mapView addAnnotation:newAnnotation];
    CLLocationCoordinate2D location2;
    location2.latitude = (double) 12.9634;
    location2.longitude = (double) 77.5339 ;
    MapAnnotation *newAnnotation2 = [[MapAnnotation alloc]
                                     initWithTitle:@"Vijay Nagar Branch" andCoordinate:location2];
    [mapView addAnnotation:newAnnotation2];
    [self.view addSubview:mapView];
}
// When a map annotation point is added, zoom to it (1500 range)
- (void)mapView:(MKMapView *)mv didAddAnnotationViews:(NSArray *)views
{
    MKAnnotationView *annotationView = [views objectAtIndex:0];
    id <MKAnnotation> mp = [annotationView annotation];
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance
    ([mp coordinate], 1500, 1500);
    [mv setRegion:region animated:YES];
    [mv selectAnnotation:mp animated:YES];

    self.secondView.layer.cornerRadius=5;
    self.enquiryButton.layer.cornerRadius=5;
    
    self.vijAddress = @"3417/13, 30 Ft. Service Road, RPC Layout, Opp.RPC Layout Bus stand, Hosabelaku, Govindaraja Nagar Ward, Saraswathi Nagar, Vijayanagar, Bengaluru, Karnataka 560040";
    
    self.rajAddress = @"#737, 3rd floor,Near St.Anns School, Beside Laxmi Villas Bank., Dr Rajkumar Rd, 6 Block, Rajaji Nagar, Bengaluru, Karnataka";
    
    if ([self.segmentedControl selectedSegmentIndex]==0)
    {
        self.addressLabel.text = self.vijAddress;
        
    }
    else
    {
        self.addressLabel.text = self.vijAddress;
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)enquiry:(id)sender {
}
- (IBAction)segmentedAction:(id)sender
{
    if ([self.segmentedControl selectedSegmentIndex]==0)
    {
        self.addressLabel.text = [NSString stringWithFormat:@"%@",self.vijAddress];
        mapView.centerCoordinate = CLLocationCoordinate2DMake(12.9634, 77.5339);
        mapView.mapType = MKMapTypeHybrid;
        CLLocationCoordinate2D location;
        location.latitude = (double) 12.9634;
        
        location.longitude = (double) 77.5339;
        // Add the annotation to our map view
        MapAnnotation *newAnnotation = [[MapAnnotation alloc]
                                        initWithTitle:@"Vijay Nagar Branch" andCoordinate:location];
        [mapView addAnnotation:newAnnotation];
        CLLocationCoordinate2D location2;
        location2.latitude = (double) 12.9634;
        location2.longitude = (double) 77.5339 ;
        MapAnnotation *newAnnotation2 = [[MapAnnotation alloc]
                                         initWithTitle:@"Vijay Nagar Branch" andCoordinate:location2];
        [mapView addAnnotation:newAnnotation2];
        [self.view addSubview:mapView];

    
    }
    else
    {
        self.addressLabel.text = [NSString stringWithFormat:@"%@",self.rajAddress];
        
        mapView.centerCoordinate = CLLocationCoordinate2DMake(12.9801, 77.5554);
        mapView.mapType = MKMapTypeHybrid;
        CLLocationCoordinate2D location;
        location.latitude = (double) 12.9801;
        
        location.longitude = (double) 77.5554;
        // Add the annotation to our map view
        MapAnnotation *newAnnotation = [[MapAnnotation alloc]
                                        initWithTitle:@"Rajaji Nagar Branch" andCoordinate:location];
        [mapView addAnnotation:newAnnotation];
        CLLocationCoordinate2D location2;
        location2.latitude = (double) 12.9801;
        location2.longitude = (double) 77.5554 ;
        MapAnnotation *newAnnotation2 = [[MapAnnotation alloc]
                                         initWithTitle:@"Rajaji Nagar Branch" andCoordinate:location2];
        [mapView addAnnotation:newAnnotation2];
        [self.view addSubview:mapView];
    }
}
- (IBAction)enquiryButton:(id)sender
{
    
    if ([self.segmentedControl selectedSegmentIndex]==0) 
    {
    UIApplication *application = [UIApplication sharedApplication];
    [application openURL:[NSURL URLWithString:@"tel:8123990421"] options:@{} completionHandler:nil];
    }
    else{
        UIApplication *application = [UIApplication sharedApplication];
        [application openURL:[NSURL URLWithString:@"tel:9880995143"] options:@{} completionHandler:nil];
        
    }
    
    
    
     }




@end
