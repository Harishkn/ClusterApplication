//
//  RefferViewController.m
//  ClusterApp
//
//  Created by test on 11/10/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "RefferViewController.h"
#import <MessageUI/MessageUI.h>

@interface RefferViewController ()
@property (weak, nonatomic) IBOutlet UITextField *mobileNumber;
- (IBAction)sendSms:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *sendSms;

@property(strong,nonatomic)NSString* number;

@end

@implementation RefferViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

- (IBAction)sendSms:(id)sender
{
    self.number = self.mobileNumber.text;
    
    MFMessageComposeViewController *controller = [[MFMessageComposeViewController alloc] init];
    if([MFMessageComposeViewController canSendText])
    {
        controller.body = @"Hello  this is Harish";
        controller.recipients = [NSArray arrayWithObjects:self.number, nil];
        controller.messageComposeDelegate = self;
        [self presentModalViewController:controller animated:YES];
    }
}
- (void)messageComposeViewController:(MFMessageComposeViewController *)controller
                 didFinishWithResult:(MessageComposeResult)result {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
