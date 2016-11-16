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

@end

@implementation JoinUsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.imagePic.layer.cornerRadius =50;
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
    [self.secondView setHidden:true];
    
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
    [self.secondView setHidden:false];
}
@end
