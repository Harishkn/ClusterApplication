//
//  About.m
//  AllMyPasswords
//
//  Created by test on 25/10/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "About.h"
#import <QuartzCore/QuartzCore.h>
#import <sys/utsname.h>

@interface About ()

@end

@implementation About

#pragma - mark View Did Load
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.rightsLabel.text = [NSString stringWithFormat:@"Cluster Info Solution Java App,\nCopyright © 2016 All Rights Reserved"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma - mark Share
- (IBAction)sendToFriends:(id)sender {
    
    
    
    UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        
       
        
        
        // Cancel button tappped do nothing.
        
    }]];
    
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"WhatsApp" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        
        
        NSString * msg = @"Cluster Institiute Application%20Name%20https://itunes.apple.com/allmypasswords";
        
        msg = [msg stringByReplacingOccurrencesOfString:@":" withString:@"%3A"];
        msg = [msg stringByReplacingOccurrencesOfString:@"/" withString:@"%2F"];
        msg = [msg stringByReplacingOccurrencesOfString:@"?" withString:@"%3F"];
        msg = [msg stringByReplacingOccurrencesOfString:@"," withString:@"%2C"];
        msg = [msg stringByReplacingOccurrencesOfString:@"=" withString:@"%3D"];
        msg = [msg stringByReplacingOccurrencesOfString:@"&" withString:@"%26"];
        
        NSString * urlWhats = [NSString stringWithFormat:@"whatsapp://send?text=%@",msg];
        
        
        NSURL * whatsappURL = [NSURL URLWithString:urlWhats];
        if ([[UIApplication sharedApplication] canOpenURL: whatsappURL])
        {
            UIApplication *application = [UIApplication sharedApplication];
            [application openURL:whatsappURL options:@{} completionHandler:nil];
        }
        else
        {
            
            [self CreateAlert:@"WhatsApp not installed." :@"Your device has no WhatsApp installed."];
            
        }
        
           }]];
    
    
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"Facebook" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        
        SLComposeViewController*post=[SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
        [post setInitialText:@"http://www.allmypasswords.com"];
        
        [self presentViewController:post animated:YES completion:nil];

    }]];
    
    
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"Mail" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        
        
        
        
        if ([MFMailComposeViewController canSendMail])
        {
            NSLog(@"It can send Mail");
            
            // Email Subject
            NSString *emailTitle = @"Cluster Java App for iPhone App"; 
            // Email Content
            NSString *messageBody = @"Hey,<br>\n\n I just downloaded All Cluster institute App on my iPhone \n\n <br>It is App to store ClusterApp in a single place with Java tutorial and testing  <br>\n\n Get it now from\nhttps:\\www.neorays.com"; // Change the message body to HTML
            // To address
            
            
            MFMailComposeViewController *mc = [[MFMailComposeViewController alloc] init];
            mc.mailComposeDelegate = self;
            [mc setSubject:emailTitle];
            [mc setMessageBody:messageBody isHTML:YES];
            
            
            // Present mail view controller on screen
            [self presentViewController:mc animated:YES completion:NULL];
            
        }
        else
        {
            [self CreateAlert:@"Error" :@"Your device will not support mail"];
            NSLog(@"It Cannot send mail");
        }

        
        
    }]];
    
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"Message" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        
        
        if(![MFMessageComposeViewController canSendText]) {
            
            [self CreateAlert:@"Error" :@"Your device doesn't support SMS!."];
            
            return;
        }
        
       NSString *file = @"Check Out Cluster Java App for your iPhone. Download from httos://www.neorays.com";
        
        NSString *message = [NSString stringWithFormat:@"Just sent the %@ file to your email. Please check!", file];
        
        MFMessageComposeViewController *messageController = [[MFMessageComposeViewController alloc] init];
        messageController.messageComposeDelegate = self;
       
        
        [messageController setBody:message];
        
        // Present message view controller on screen
        [self presentViewController:messageController animated:YES completion:nil];
        
        
        
        
        
    }]];
    
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"More" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        
        // create a message
        NSString *theMessage = @"Check Out Cluster Java App for your iPhone. Download from https://www.neorays.com";
        NSArray *items = @[theMessage];
        
        // build an activity view controller
        UIActivityViewController *controller = [[UIActivityViewController alloc]initWithActivityItems:items applicationActivities:nil];
        
        // and present it
        [self presentActivityController:controller];
        
    }]];
    
    
    [self presentViewController:actionSheet animated:YES completion:nil];
    

    
    
}

#pragma - mark Facebook and Twitter

- (IBAction)facebookPage:(id)sender {
    
    UIApplication *application = [UIApplication sharedApplication];
    [application openURL:[NSURL URLWithString:@"https://www.facebook.com/search/top/?q=neo%20rays%20software%20solutions%20pvt%20ltd"] options:@{} completionHandler:nil];
}

- (IBAction)twitterPage:(id)sender {
    
    UIApplication *application = [UIApplication sharedApplication];
    [application openURL:[NSURL URLWithString:@"https://twitter.com/search?f=tweets&q=neorays%20software%20solutions&src=typd"] options:@{} completionHandler:nil];
    
  
}

- (IBAction)site:(id)sender {
    
    UIApplication *application = [UIApplication sharedApplication];
    [application openURL:[NSURL URLWithString:@"http://neorays.com"] options:@{} completionHandler:nil];
}

#pragma - mark Email and Feedback

- (IBAction)sendFeedback:(id)sender {
    
    [self feedBackMail];
}

-(void)feedBackMail{
    if ([MFMailComposeViewController canSendMail])
    {
        NSLog(@"It can send Mail");
        
        // Email Subject
        NSString *emailTitle = @"All My Passwords iPhone App";
        // Email Content
        NSString *messageBody = [NSString stringWithFormat:@"%@%@%@%@%@%@%@%@" ,[NSString stringWithFormat:@"Country : %@\n<br>",[[NSLocale currentLocale] objectForKey:NSLocaleCountryCode]],
                                 [NSString stringWithFormat:@"Devive language : %@\n<br>",[[NSLocale preferredLanguages] objectAtIndex:0]],
                                 [NSString stringWithFormat:@"Unique Identifier: %@\n<br>", [UIDevice currentDevice].identifierForVendor],
                                 [NSString stringWithFormat:@"Name: %@\n<br>", [[UIDevice currentDevice] name]],
                                 [NSString stringWithFormat:@"System Name: %@\n<br>", [[UIDevice currentDevice] systemName]],
                                 [NSString stringWithFormat:@"System Version: %@\n<br>", [[UIDevice currentDevice] systemVersion]],
                                 [NSString stringWithFormat:@"Model: %@\n<br>", [[UIDevice currentDevice] model]],
                                 [NSString stringWithFormat:@"localizedModel: %@<br>", [[UIDevice currentDevice] localizedModel]]];
        // To address
        NSArray *toRecipents = [NSArray arrayWithObject:@"mrnadaf2010@gmail.com"];
        
        MFMailComposeViewController *mc = [[MFMailComposeViewController alloc] init];
        mc.mailComposeDelegate = self;
        [mc setSubject:emailTitle];
        [mc setMessageBody:messageBody isHTML:YES];
        [mc setToRecipients:toRecipents];
        
        // Present mail view controller on screen
        [self presentViewController:mc animated:YES completion:NULL];
        
    }
    else
    {
        [self CreateAlert:@"Error" :@"Your device will not Support Mail"];
    }
    
    
}
- (IBAction)mailFeedback:(id)sender {
    
    
    [self feedBackMail];

}


- (void)presentActivityController:(UIActivityViewController *)controller {
    
    // for iPad: make the presentation a Popover
    controller.modalPresentationStyle = UIModalPresentationPopover;
    [self presentViewController:controller animated:YES completion:nil];
    
    UIPopoverPresentationController *popController = [controller popoverPresentationController];
    popController.permittedArrowDirections = UIPopoverArrowDirectionAny;
    popController.barButtonItem = self.navigationItem.leftBarButtonItem;
    
    // access the completion handler
    controller.completionWithItemsHandler = ^(NSString *activityType,
                                              BOOL completed,
                                              NSArray *returnedItems,
                                              NSError *error){
        // react to the completion
        if (completed) {
            
            // user shared an item
            NSLog(@"We used activity type%@", activityType);
            
        } else {
            
            // user cancelled
            NSLog(@"We didn't want to share anything after all.");
        }
        
        if (error) {
            NSLog(@"An Error occured: %@, %@", error.localizedDescription, error.localizedFailureReason);
        }
    };
}

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(nullable NSError *)error {
    
    
    switch (result) {
        case MFMailComposeResultCancelled:
            
            
            [self CreateAlert:@"Error" :@"Message Sending Cancelled"];
            
            break;
            
        case MFMailComposeResultFailed:
            
            [self CreateAlert:@"Error" :@"Message Sending Failed"];
            
            break;
            
        case MFMailComposeResultSent:
            
            [self CreateAlert:@"Message Alert" :@"Message Sent Sucsessfully..."];
            
            
            break;
            
        case MFMailComposeResultSaved:
            
            [self CreateAlert:@"Message Alert" :@"Message Saved Sucsessfully..."];
           
            break;
            
        default:
            break;
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult) result
{
    switch (result) {
        case MessageComposeResultCancelled:
            break;
            
        case MessageComposeResultFailed:
        {
            [self CreateAlert:@"Error" :@"Failed to send SMS!."];
            
            break;
        }
            
        case MessageComposeResultSent:
            break;
            
        default:
            break;
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


#pragma - mark Update and Reviews
- (IBAction)checkUpdate:(id)sender {
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[@"itms-apps://itunes.apple.com/app/" stringByAppendingString: @"id547101139"]] options:@{} completionHandler:nil
     ];
}
- (IBAction)rateReveiew:(id)sender {
    
    NSString* url = [NSString stringWithFormat: @"http://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?id=547101139&pageNumber=0&sortOrdering=2&type=Purple+Software&mt=8"];
    
    [[UIApplication sharedApplication] openURL: [NSURL URLWithString: url ]options:@{} completionHandler:nil];
    
    
}

#pragma  - mark Alert Message

-(void)CreateAlert : (NSString *)title :(NSString *)message {

    UIAlertController* alert = [UIAlertController alertControllerWithTitle:title
                                                                   message:message
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {}];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
    
}
@end
