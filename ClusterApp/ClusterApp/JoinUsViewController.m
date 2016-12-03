//
//  JoinUsViewController.m
//  ClusterApp
//
//  Created by test on 11/15/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "JoinUsViewController.h"
#import <MessageUI/MessageUI.h>

@interface JoinUsViewController ()<UITextFieldDelegate,MFMailComposeViewControllerDelegate>
{
    MFMailComposeViewController *mailComposer;
}
- (IBAction)cancelButton:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *profilePhoto;

@property(strong,nonatomic)UITextField* activeField;
@property(strong,nonatomic)NSMutableArray* studentDetails;
@property(strong,nonatomic)NSUserDefaults* defaults;

@end

@implementation JoinUsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.imagePic.layer.cornerRadius =50;
    self.studentDetails = [[NSMutableArray alloc]init];
    self.defaults = [NSUserDefaults standardUserDefaults];
    [self registerForKeyboardNotifications];
    
    UITapGestureRecognizer* tapBackground = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard:)];
    [tapBackground setNumberOfTapsRequired:1];
    [self.view addGestureRecognizer:tapBackground];
}
-(void) dismissKeyboard:(id)sender
{
    [self.view endEditing:YES];
}
// Call this method somewhere in your view controller setup code.
- (void)registerForKeyboardNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWasShown:)
                                                 name:UIKeyboardDidShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillBeHidden:)
                                                 name:UIKeyboardWillHideNotification object:nil];
    
}

// Called when the UIKeyboardDidShowNotification is sent.
- (void)keyboardWasShown:(NSNotification*)aNotification
{
    
    
    NSDictionary* info = [aNotification userInfo];
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, kbSize.height, 0.0);
    self.scrollView.contentInset = contentInsets;
    self.scrollView.scrollIndicatorInsets = contentInsets;
    
    // If active text field is hidden by keyboard, scroll it so it's visible
    // Your app might not need or want this behavior.
    CGRect aRect = self.view.frame;
    aRect.size.height -= kbSize.height;
    if (!CGRectContainsPoint(aRect, self.activeField.frame.origin) ) {
        [self.scrollView scrollRectToVisible:self.activeField.frame animated:YES];
        
    }
}

// Called when the UIKeyboardWillHideNotification is sent
- (void)keyboardWillBeHidden:(NSNotification*)aNotification
{
    UIEdgeInsets contentInsets = UIEdgeInsetsZero;
    self.scrollView.contentInset = contentInsets;
    self.scrollView.scrollIndicatorInsets = contentInsets;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    self.activeField = textField;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    self.activeField = nil;
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
-(BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    
   
    [self.activeField resignFirstResponder];
    return YES;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)cancelButton:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (IBAction)loadImage:(id)sender
{
    UIImagePickerController *pickerController = [[UIImagePickerController alloc]
                                                 init];
    pickerController.delegate = self;
    //[self presentModalViewController:pickerController animated:YES];
    
    [self presentViewController:pickerController animated:YES completion:nil];
    
}

- (IBAction)pickerDone:(id)sender
{
    [self.toolBar setHidden:true];
    [self.pickerView setHidden:true];
    self.scrollView.frame = CGRectMake(self.scrollView.frame.origin.x,
                                       self.scrollView.frame.origin.y,
                                       self.scrollView.frame.size.width,
                                       self.scrollView.frame.size.height + 200 -50);
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd-MM-yyyy HH:mm"];
    NSString *strDate = [dateFormatter stringFromDate:self.pickerView.date];
    
    [self.dobButtonOutlet setTitle:strDate forState:UIControlStateNormal];
    
}
- (void) imagePickerController:(UIImagePickerController *)picker
         didFinishPickingImage:(UIImage *)image
                   editingInfo:(NSDictionary *)editingInfo
{
    self.imagePic.image = image;
    
    //NSData *picData = UIImagePNGRepresentation(image);
   // NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
   // [defaults setObject:picData forKey:@"image"];
   // [defaults synchronize];
    
    
    //NSData* imageData = [defaults dataForKey:@"image"];
   
    //self.imagePic.image = [UIImage imageWithData:imageData];
   
    
    [self dismissViewControllerAnimated:YES completion:nil];
}




- (IBAction)DobButton:(id)sender
{
    [self.toolBar setHidden:false];
    [self.pickerView setHidden:false];
    
    
    self.scrollView.frame = CGRectMake(self.scrollView.frame.origin.x,
                                  self.scrollView.frame.origin.y,
                                  self.scrollView.frame.size.width,
                                  self.scrollView.frame.size.height - 200 + 50);
    
}


- (IBAction)doneButton:(id)sender
{
    NSString* sName = self.nameField.text;
    NSString* sMnumber = self.mobileNumberField.text;
    NSString* sEmail = self.emailField.text;
    NSString* alNumber = self.alternateNumberField.text;
    
   // self.studentDetails = [[NSMutableArray alloc]initWithObjects:sName,sMnumber,sEmail,alNumber, nil];
    
    if (![self.defaults objectForKey:@"data"]) {
        [self.studentDetails addObject:sName];
        [self.studentDetails addObject:sMnumber];
        [self.studentDetails addObject:sEmail];
        [self.studentDetails addObject:alNumber];
        
        [self.defaults setObject:self.studentDetails forKey:@"data"];
        [self.defaults synchronize];
    }
    else
    {
        [self.studentDetails addObject:[self.defaults objectForKey:@"data"]];
        [self.studentDetails addObject:sName];
        [self.studentDetails addObject:sMnumber];
        [self.studentDetails addObject:sEmail];
        [self.studentDetails addObject:alNumber];
        
        [self.defaults setObject:self.studentDetails forKey:@"data"];
        [self.defaults synchronize];
        
    }
    
    
    NSLog(@"details name %@",[self.defaults objectForKey:@"data"]);
    
    if (self.nameField.text.length==0 || self.emailField.text.length==0||self.mobileNumberField.text.length==0||self.alternateNumberField.text.length==0)
    {
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Login Alert"
                                                                       message:@"Please fill all the details."
                                                                preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {}];
        
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
        
    }
    else{
    [self performSegueWithIdentifier:@"login" sender:self];
    }
    NSString *emailTitle = @"Test Email";
    // Email Content
    NSString *messageBody = sName;
    // To address
    NSArray *toRecipents = [NSArray arrayWithObject:sEmail];
    
    MFMailComposeViewController *mc = [[MFMailComposeViewController alloc] init];
    mc.mailComposeDelegate = self;
    [mc setSubject:emailTitle];
    [mc setMessageBody:messageBody isHTML:NO];
    [mc setToRecipients:toRecipents];
    
    // Present mail view controller on screen
    [self presentViewController:mc animated:YES completion:NULL];
}
#pragma mark - mail compose delegate
-(void)mailComposeController:(MFMailComposeViewController *)controller
         didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error{
    if (result) {
        NSLog(@"Result : %ld",(long)result);
    }
    if (error) {
        NSLog(@"Error : %@",error);
    }
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
@end
