//
//  JoinUsViewController.m
//  ClusterApp
//
//  Created by test on 11/15/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "JoinUsViewController.h"

@interface JoinUsViewController ()
- (IBAction)cancelButton:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *profilePhoto;

@property(strong,nonatomic)UITextField* activeField;

@end

@implementation JoinUsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.imagePic.layer.cornerRadius =50;
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWasShown:)
                                                 name:UIKeyboardDidShowNotification object:nil];

    
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
    
}
- (void) imagePickerController:(UIImagePickerController *)picker
         didFinishPickingImage:(UIImage *)image
                   editingInfo:(NSDictionary *)editingInfo
{
    //self.imagePic.image = image;
    
    NSData *picData = UIImagePNGRepresentation(image);
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:picData forKey:@"image"];
    [defaults synchronize];
    
    
    NSData* imageData = [defaults dataForKey:@"image"];
   
    self.imagePic.image = [UIImage imageWithData:imageData];
   
    
    [self dismissViewControllerAnimated:YES completion:nil];
}




- (IBAction)DobButton:(id)sender
{
    [self.toolBar setHidden:false];
    [self.pickerView setHidden:false];
}

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
    //[textField resignFirstResponder];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillBeHidden:)
                                                 name:UIKeyboardDidShowNotification object:nil];
    [textField resignFirstResponder];
    return YES;
}
-(void)didTapAnywhere: (UITapGestureRecognizer*) recognizer {
    [self.activeField resignFirstResponder];
}

@end
