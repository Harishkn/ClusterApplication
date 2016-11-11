//
//  About.h
//  AllMyPasswords
//
//  Created by test on 25/10/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import <Social/Social.h>
@interface About : UIViewController<MFMailComposeViewControllerDelegate,MFMessageComposeViewControllerDelegate,UIScrollViewDelegate>


- (IBAction)checkUpdate:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *rightsLabel;
- (IBAction)rateReveiew:(id)sender;
- (IBAction)sendFeedback:(id)sender;
- (IBAction)sendToFriends:(id)sender;
- (IBAction)facebookPage:(id)sender;
- (IBAction)twitterPage:(id)sender;
- (IBAction)site:(id)sender;
- (IBAction)mailFeedback:(id)sender;

@end
