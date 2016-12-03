//
//  JoinUsViewController.h
//  ClusterApp
//
//  Created by test on 11/15/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"

@interface JoinUsViewController : ViewController
- (IBAction)doneButton:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *mobileNumberField;
@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UITextField *alternateNumberField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *genderSegment;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *pickerDone;
@property (weak, nonatomic) IBOutlet UIButton *dobButtonOutlet;
@property (weak, nonatomic) IBOutlet UIDatePicker *pickerView;
- (IBAction)DobButton:(id)sender;
@property (weak, nonatomic) IBOutlet UIToolbar *toolBar;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *imagePic;

- (IBAction)loadImage:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *secondView;
- (IBAction)pickerDone:(id)sender;

@end
