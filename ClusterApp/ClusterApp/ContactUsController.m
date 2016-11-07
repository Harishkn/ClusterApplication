//
//  ContactUsController.m
//  ClusterApp
//
//  Created by test on 11/7/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ContactUsController.h"

@interface ContactUsController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;


@property (weak, nonatomic) IBOutlet UIView *secondView;
@property (weak, nonatomic) IBOutlet UIButton *enquiryButton;
- (IBAction)enquiry:(id)sender;

@property(strong,nonatomic)NSString* vijAddress;
@property(strong,nonatomic)NSString* rajAddress;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
- (IBAction)segmentedAction:(id)sender;
@end

@implementation ContactUsController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
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
    
    }
    else
    {
        self.addressLabel.text = [NSString stringWithFormat:@"%@",self.rajAddress];
    }
}
@end
