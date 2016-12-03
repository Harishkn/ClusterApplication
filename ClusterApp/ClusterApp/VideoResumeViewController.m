//
//  VideoResumeViewController.m
//  ClusterApp
//
//  Created by test on 11/10/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "VideoResumeViewController.h"
#import <MediaPlayer/MediaPlayer.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import <AVKit/AVKit.h>
#import <AVFoundation/AVFoundation.h>

@interface VideoResumeViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
- (IBAction)capture:(id)sender;
- (IBAction)segmentAction:(id)sender;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControler;
@property (weak, nonatomic) IBOutlet UIView *secondView;

@property (strong, nonatomic) NSURL *videoURL;
@property (strong, nonatomic) MPMoviePlayerController *videoController;
@end

@implementation VideoResumeViewController

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

- (IBAction)capture:(id)sender
{
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        
        
        [picker.view setFrame:CGRectMake (-70, 0, 320, 460)];
        picker.delegate = self;
        picker.allowsEditing = YES;
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        picker.mediaTypes = [[NSArray alloc] initWithObjects: (NSString *) kUTTypeMovie, nil];
        
        
        
        [self presentViewController:picker animated:YES completion:NULL];
    }
}

- (IBAction)segmentAction:(id)sender
{
    if ([self.segmentedControler selectedSegmentIndex]==0)
    {
        [self.secondView setHidden:YES];
    }
    else{
        [self.secondView setHidden:false];
    }
  }
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    self.videoURL = info[UIImagePickerControllerMediaURL];
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
   // self.videoController = [[MPMoviePlayerController alloc] init];
    
    [self.videoController setContentURL:self.videoURL];
    [self.videoController.view setFrame:CGRectMake (-70, 0, 320, 460)];
    [self.view addSubview:self.videoController.view];
    
    [self.videoController play];
    
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}
- (void)applyVideoEffectsToComposition:(AVMutableVideoComposition *)composition size:(CGSize)size
{
    CATextLayer *subtitle1Text = [[CATextLayer alloc] init];
    [subtitle1Text setFont:@"Helvetica-Bold"];
    [subtitle1Text setFontSize:36];
    [subtitle1Text setFrame:CGRectMake(0, 0, size.width, 100)];
    [subtitle1Text setString:@"text over lay "];
    [subtitle1Text setAlignmentMode:kCAAlignmentCenter];
    [subtitle1Text setForegroundColor:[[UIColor whiteColor] CGColor]];
    
    // 2 - The usual overlay
    CALayer *overlayLayer = [CALayer layer];
    [overlayLayer addSublayer:subtitle1Text];
    overlayLayer.frame = CGRectMake(0, 0, size.width, size.height);
    [overlayLayer setMasksToBounds:YES];
    
    CALayer *parentLayer = [CALayer layer];
    CALayer *videoLayer = [CALayer layer];
    parentLayer.frame = CGRectMake(0, 0, size.width, size.height);
    videoLayer.frame = CGRectMake(0, 0, size.width, size.height);
    [parentLayer addSublayer:videoLayer];
    [parentLayer addSublayer:overlayLayer];
    
    composition.animationTool = [AVVideoCompositionCoreAnimationTool
                                 videoCompositionCoreAnimationToolWithPostProcessingAsVideoLayer:videoLayer inLayer:parentLayer];
}
@end
